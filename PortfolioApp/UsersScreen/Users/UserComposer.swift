import UIKit

final class UserComposer {
    static func build() -> UIViewController {
        var presenter = UsersPresenter()
        let usersVC = UsersTableViewController(nibName: "UsersTableViewController", bundle: nil)
        usersVC.presenter = presenter
        presenter.view = usersVC
        return usersVC
    }
}
