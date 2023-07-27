import UIKit

final class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var photoImage: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(photo: PhotosData) {
        photoImage.downloaded(URLAddress: photo.url)
    }
}
