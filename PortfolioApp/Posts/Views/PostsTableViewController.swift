import UIKit
import RswiftResources

final class PostsTableViewController: UITableViewController {
    private var modelPosts: [PostsData] = []
    private var postsViewModel: PostsViewModel
    
    init(viewModel: PostsViewModel) {
        self.postsViewModel = viewModel
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        bindToPostsViewModel()
    }
    
    private func bindToPostsViewModel() {
        postsViewModel.isLoadingData = { [weak self] isLoading in
            if isLoading {
                self?.tableView.refreshControl?.beginRefreshing()
            } else {
                self?.tableView.refreshControl?.endRefreshing()
            }
        }
        
        postsViewModel.postsViewData = { [weak self] posts in
            self?.modelPosts = posts
            self?.tableView.reloadData()
        }
        
        postsViewModel.onLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelPosts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = modelPosts[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.postsTableViewCell, for: indexPath)!
        cell.setup(post: post)
        return cell
    }
    
    private func configureTableView() {
        title = R.string.texts.postTitle()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(R.nib.postsTableViewCell)
    }
}
