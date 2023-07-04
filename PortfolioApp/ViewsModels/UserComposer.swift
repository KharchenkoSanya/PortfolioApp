import UIKit

final class UserComposer {
    
    private init() {}
    
    static func build() -> UIViewController {
        let viewModel = MainViewModel()
        let usersMainVC = MainViewController()
        usersMainVC.viewModel = viewModel
        viewModel.view = usersMainVC
        return usersMainVC
    }
}
