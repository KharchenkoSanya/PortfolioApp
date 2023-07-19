import UIKit
import RswiftResources

final class AlbumTableViewCell: UITableViewCell, ReuseIdentifierType {
    public typealias ReusableType = AlbumTableViewCell
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    func setup(album: AlbumData) {
        titleLabel.text = album.title
    }
}
