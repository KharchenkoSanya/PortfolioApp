import UIKit

final class UserComposer {
    static func build() -> UIViewController {
        let presenter = UsersPresenter()
        let usersVC = UsersTableViewController()
        usersVC.presenter = presenter
        return usersVC
    }
}
