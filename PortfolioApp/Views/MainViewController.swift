import UIKit

final class MainViewController: UITableViewController {
    var viewModel: MainViewModel!
    private var models: [UserData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        onRefresh()
    }
    
    @objc
    internal func onRefresh() {
        viewModel.onRefresh()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = models[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.usersTableViewCell, for: indexPath)!
        cell.setup(user: user)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let user = models[indexPath.row]
    }
    
    private func configureTableView() {
        title = R.string.texts.userTitle()
        tableView.refreshControl = UIRefreshControl()
        tableView.estimatedRowHeight = 175
        tableView.rowHeight = UITableView.automaticDimension
        tableView.refreshControl?.addTarget(self, action: #selector(onRefresh), for: .valueChanged)
        tableView.register(R.nib.usersTableViewCell)
    }
}

extension MainViewController: UsersViewProtocol {
    
    func display(_ users: [UserData]) {
        models = users
        tableView.reloadData()
    }
    
    func display(isLoading: Bool) {
        if isLoading {
            tableView.refreshControl?.beginRefreshing()
        } else {
            tableView.refreshControl?.endRefreshing()
        }
    }
}
