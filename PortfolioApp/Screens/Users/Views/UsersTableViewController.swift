import UIKit

final class UsersTableViewController: UITableViewController {
    private var modelUsers: [UserData] = []
    private var usersViewModel: UsersViewModel
    private var filteredUsers = [UserData]()
    private var searchController = UISearchController(searchResultsController: nil)
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    private var isFiltering: Bool {
        searchController.isActive && !searchBarIsEmpty
    }
    
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        searchController.searchResultsUpdater = self
        tableView.tableHeaderView = searchController.searchBar
        definesPresentationContext = true
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
        if isFiltering {
            return filteredUsers.count
        }
        return modelUsers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var user = modelUsers[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: UsersTableViewCell.identifier, for: indexPath) as! UsersTableViewCell
        
        if isFiltering {
            user = filteredUsers[indexPath.row]
        } else {
            user = modelUsers[indexPath.row]
        }
        
        cell.setup(user: user)
        cell.onPostButtonTap = { [weak self] in
            guard let self else { return }
            let controller = PostsComposer.build(userID: user.id)
            self.navigationController?.pushViewController(controller, animated: true)
        }
        
        cell.onAlbumButtonTap = { [weak self] in
            guard let self else { return }
            let controller = AlbumsComposer.build(userID: user.id)
            self.navigationController?.pushViewController(controller, animated: true)
        }
        
        cell.onPhotoButtonTap = { [weak self] in
            guard let self else { return }
            let controller = PhotosComposer.build(userID: user.id)
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
        tableView.estimatedRowHeight = 175
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(.init(nibName: UsersTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: UsersTableViewCell.identifier)
    }
}

extension UsersTableViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        filteredUsers = modelUsers.filter({ (userData: UserData) -> Bool in
            userData.name.lowercased().contains(searchText.lowercased()) || userData.email.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
}

