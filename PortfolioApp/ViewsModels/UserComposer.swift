import UIKit

final class UserComposer {
    
    private init() {}
    
    static func build() -> UIViewController {
        let presenter = MainViewModel()
        let usersVC = MainViewController()
        usersVC.presenter = presenter
        presenter.view = usersVC
        return usersVC
    }
}
