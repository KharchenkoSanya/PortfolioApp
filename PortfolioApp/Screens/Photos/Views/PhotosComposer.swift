import UIKit

final class PhotosComposer {
    
    private init() {}
    
    static func build(userID: Int) -> UIViewController {
        let photosViewModel = PhotosViewModel(userID: userID)
        let photosTableViewController = PhotoCollectionViewController(viewModel: photosViewModel)
        return photosTableViewController
    }
}
