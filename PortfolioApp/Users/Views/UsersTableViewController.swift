import UIKit

final class UsersTableViewController: UITableViewController {
    private var modelUsers: [UserData] = []
    private var usersViewModel: UsersViewModel
    
    init(usersViewModel: UsersViewModel) {
        self.usersViewModel = usersViewModel
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        bindToViewModel()
        loadData()
    }
    
    @objc
    func loadData() {
        usersViewModel.onLoad()
    }
    
    private func bindToViewModel() {
        usersViewModel.isLoadingData = { [weak self] isLoading in
            if isLoading {
                self?.tableView.refreshControl?.beginRefreshing()
            } else {
                self?.tableView.refreshControl?.endRefreshing()
            }
        }
        
        usersViewModel.usersViewData = { [weak self] users in
            self?.modelUsers = users
            self?.tableView.reloadData()
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelUsers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = modelUsers[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.usersTableViewCell, for: indexPath)!
        cell.setup(user: user)
        cell.onPostButtonTap = { [weak self] in
            guard let self else { return }
            let controller = PostComposer.build(userID: user.id)
            self.navigationController?.pushViewController(controller, animated: true)
        }
        
        cell.onAlbumButtonTap = { [weak self] in
            guard let self else { return }
            let controller = AlbumComposer.build(userID: user.id)
            self.navigationController?.pushViewController(controller, animated: true)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let user = modelUsers[indexPath.row]
    }
    
    private func configureTableView() {
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(loadData), for: .valueChanged)
        tableView.refreshControl = refresh
        title = R.string.texts.userTitle()
        tableView.estimatedRowHeight = 175
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(R.nib.usersTableViewCell)
    }
}
