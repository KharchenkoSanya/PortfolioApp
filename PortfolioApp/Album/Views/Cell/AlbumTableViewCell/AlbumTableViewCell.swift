import UIKit
import RswiftResources

class AlbumTableViewCell: UITableViewCell, ReuseIdentifierType {
    public typealias ReusableType = AlbumTableViewCell
    
    @IBOutlet weak var titleLabel: UILabel!
    
}
