import UIKit

final class UserComposer {
    
    private init() {}
    
    static func build() -> UIViewController {
        let mainViewModel = MainViewModel()
        let mainViewController = UsersTableViewController()
        mainViewController.onRefresh = mainViewModel.onRefresh
        mainViewModel.viewData = mainViewController.display
        mainViewModel.isLoadingData = mainViewController.display
        return mainViewController
    }
}
