import UIKit

final class PostComposer {
    
    private init() {}
    
    static func build() -> UIViewController {
        let postsViewModel = PostsViewModel()
        let postsTableViewController = PostsTableViewController()
//        postsViewModel.postData = postsTableViewController.display
//        postsViewModel.isLoadingData = postsTableViewController.display
        return postsTableViewController
    }
}
