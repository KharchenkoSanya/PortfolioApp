import UIKit

final class PostsTableViewCell: UITableViewCell {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var bodyLabel: UILabel!
    
    func setup(post: PostsData) {
        titleLabel.text = post.title
        bodyLabel.text = post.body
    }
}
