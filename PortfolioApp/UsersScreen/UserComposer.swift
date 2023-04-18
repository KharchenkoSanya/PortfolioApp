import UIKit

final class UserComposer {
    
    private init() {}
    
    static func build() -> UIViewController {
        let presenter = UsersPresenter()
        let usersVC = UsersTableViewController()
        usersVC.presenter = presenter
        presenter.view = usersVC
        return usersVC
    }
}
