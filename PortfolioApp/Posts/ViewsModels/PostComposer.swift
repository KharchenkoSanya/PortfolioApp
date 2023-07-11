import UIKit

final class PostComposer {
    
    private init() {}
    
    static func build(postID: Int) -> UIViewController {
        let postsViewModel = PostsViewModel(postID: String(postID))
        let postsTableViewController = PostsTableViewController(viewModel: postsViewModel)
        return postsTableViewController
    }
}
