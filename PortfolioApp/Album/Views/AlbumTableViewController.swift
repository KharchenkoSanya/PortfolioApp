import UIKit
import RswiftResources

class AlbumTableViewController: UITableViewController {
    private var modelPosts: [AlbumData] = []
    var albumsViewModel: AlbumsViewModel
    
    init(viewModel: AlbumsViewModel) {
        self.albumsViewModel = viewModel
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelPosts.count
    }
    
    private func configureTableView() {
        title = R.string.texts.albumTitle()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(R.nib.albumTableViewCell)
        tableView.refreshControl = UIRefreshControl()
    }
}
