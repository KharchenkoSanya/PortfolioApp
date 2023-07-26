import UIKit

final class PostsComposer {
    
    private init() {}
    
    static func build(userID: Int) -> UIViewController {
        let postsViewModel = PostsViewModel(userID: userID)
        let postsTableViewController = PostsTableViewController(viewModel: postsViewModel)
        return postsTableViewController
    }
}
