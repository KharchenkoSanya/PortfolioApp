import UIKit

final class UserComposer {
    
    private init() {}
    
    static func build() -> UIViewController {
        let mainViewModel = UsersViewModel()
        let mainViewController = UsersTableViewController(usersViewModel: mainViewModel)
        return mainViewController
    }
}
