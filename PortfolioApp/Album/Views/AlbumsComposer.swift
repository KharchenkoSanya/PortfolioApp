import UIKit

final class AlbumsComposer {
    
    private init() {}
    
    static func build(userID: Int) -> UIViewController {
        let albumsViewModel = AlbumsViewModel(userID: userID)
        let albumsTableViewController = AlbumsTableViewController(viewModel: albumsViewModel)
        return albumsTableViewController
    }
}
