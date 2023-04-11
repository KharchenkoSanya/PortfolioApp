import UIKit

final class UserComposer {
    static func build() -> UIViewController {
        let presenter = UsersPresenter()
        let usersVC = UsersTableViewController(nib: R.nib.usersTableViewController)
        usersVC.presenter = presenter
        presenter.view = usersVC
        return usersVC
    }
}
