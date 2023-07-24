import UIKit

final class UsersComposer {
    
    private init() {}
    
    static func build() -> UIViewController {
        let mainViewModel = UsersViewModel()
        let mainViewController = UsersTableViewController(usersViewModel: mainViewModel)
        return mainViewController
    }
}
