import UIKit
import RswiftResources

final class PostsTableViewCell: UITableViewCell, ReuseIdentifierType {
    public typealias ReusableType = PostsTableViewCell
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var bodyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(post: PostsData) {
        titleLabel.text = post.title
        bodyLabel.text = post.body
    }
}
