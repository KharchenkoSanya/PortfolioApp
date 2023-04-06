import UIKit

final class UsersTableViewController: UITableViewController {
    @IBOutlet private weak var usersTableView: UITableView!
    
    var presenter = UsersPresenter()
    var models: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
        tableView.refreshControl = UIRefreshControl()
        tableView.estimatedRowHeight = 175
        tableView.rowHeight = UITableView.automaticDimension
        tableView.refreshControl?.addTarget(self, action: #selector(onRefresh), for: .valueChanged)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        title = "Users"
        usersTableView.delegate = self
        usersTableView.dataSource = self
        usersTableView.register(UINib(nibName: "UsersTableViewCell", bundle: nil),
                                forCellReuseIdentifier: "UsersTableViewCell")
        onRefresh()
        
    }
    
    @objc
    func onRefresh() {
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "UsersTableViewCell", for: indexPath) as!
        UsersTableViewCell
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = models[indexPath.row]
        presenter.onSelect(user)
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
