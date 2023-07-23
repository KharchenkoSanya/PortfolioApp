import UIKit

final class PostsTableViewController: UITableViewController {
    private var modelPosts: [PostsData] = []
    private var viewModel: PostsViewModel
    var onSelectUserButton: ((PostsData) -> Void)?
    
    init(viewModel: PostsViewModel) {
        self.viewModel = viewModel
        super.init(style: .grouped)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Posts"
        configureTableView()
        viewModel.isLoadingData = { [weak self] isLoading in
            if isLoading {
                self?.tableView.refreshControl?.beginRefreshing()
            } else {
                self?.tableView.refreshControl?.endRefreshing()
            }
        }
        
        viewModel.postData = { [weak self] posts in
            self?.modelPosts = posts
            self?.tableView.reloadData()
        }
        
        viewModel.onLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelPosts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = modelPosts[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: PostsTableViewCell.identifier, for: indexPath) as! PostsTableViewCell
        cell.setup(post: post)
        return cell
    }
    
    private func configureTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(.init(nibName: PostsTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: PostsTableViewCell.identifier)
        tableView.refreshControl = UIRefreshControl()
    }
}
