import UIKit

final class AlbumComposer {
    
    private init() {}
    
    static func build(userID: Int) -> UIViewController {
        let albumsViewModel = AlbumsViewModel(userID: userID)
        let albumsTableViewController = AlbumTableViewController(viewModel: albumsViewModel)
        return albumsTableViewController
    }
}
