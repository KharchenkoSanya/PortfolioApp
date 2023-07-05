import UIKit

final class UserComposer {
    
    private init() {}
    
    static func build() -> UIViewController {
        let viewModel = MainViewModel()
        let usersMainVC = MainViewController()
        usersMainVC.onRefresh = viewModel.onRefresh
        viewModel.viewData = usersMainVC.display
        viewModel.isLoadingData = usersMainVC.display
        return usersMainVC
    }
}
