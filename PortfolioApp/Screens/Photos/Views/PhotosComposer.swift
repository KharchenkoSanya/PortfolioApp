import UIKit

final class PhotosComposer {
    
    private init() {}
    
    static func build(userID: Int) -> UIViewController {
        let photosViewModel = PhotosViewModel(userID: userID)
        let photosCollectionViewController = PhotoCollectionViewController(viewModel: photosViewModel)
        return photosCollectionViewController
    }
}
