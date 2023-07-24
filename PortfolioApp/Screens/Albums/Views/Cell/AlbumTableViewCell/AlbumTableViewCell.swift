import UIKit

final class AlbumTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    func setup(album: AlbumData) {
        titleLabel.text = album.title
    }
}
