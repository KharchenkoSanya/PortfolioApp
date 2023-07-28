import UIKit

final class PhotoCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var photoImage: UIImageView!
    
    func setup(photo: PhotosData) {
        photoImage.layer.cornerRadius = 25.0
        photoImage.downloaded(URLAddress: photo.url)
    }
}
