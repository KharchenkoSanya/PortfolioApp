import UIKit

final class MainViewController: UITableViewController {
    private var models: [UserData] = []
    var onRefresh: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        onRefresh?()
    }
    
    @objc
    internal func refreshAction() {
        onRefresh?()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = models[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: UsersTableViewCell.identifier, for: indexPath) as! UsersTableViewCell
        cell.setup(user: user)
        cell.onPostButtonTap = { [weak self] in
            guard let self else { return }
            let controller = PostComposer.build(userID: user.id)
            self.navigationController?.pushViewController(controller, animated: true)
        }
        return cell
    }
    
    private func configureTableView() {
        title = "User.title".localized
        tableView.refreshControl = UIRefreshControl()
        tableView.estimatedRowHeight = 175
        tableView.rowHeight = UITableView.automaticDimension
        tableView.refreshControl?.addTarget(self, action: #selector(refreshAction), for: .valueChanged)
        tableView.register(.init(nibName: UsersTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: UsersTableViewCell.identifier)
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
