import UIKit

final class UsersTableViewController: UITableViewController {
//    public typealias ReusableType = UsersTableViewController
    @IBOutlet private weak var usersTableView: UITableView!
    var presenter = UsersPresenter()
    var models: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        onRefresh()
    }
    
    @objc
    private func onRefresh() {
        presenter.onRefresh()
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
    
    func configureTableView() {
        presenter.view = self
        title = R.string.texts.userTitle()
        tableView.refreshControl = UIRefreshControl()
        tableView.estimatedRowHeight = 175
        tableView.rowHeight = UITableView.automaticDimension
        tableView.refreshControl?.addTarget(self, action: #selector(onRefresh), for: .valueChanged)
        tableView.register(R.nib.usersTableViewCell)
    }
}

extension UsersTableViewController: UsersView {
    
    func display(_ users: [User]) {
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

extension UITableViewController {
    public var identifier: String {
        return String(describing: self)
    }
}
