import UIKit

final class UsersTableViewCell: UITableViewCell {
    @IBOutlet weak var mainNameLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var userNameInfoLabel: UILabel!
    @IBOutlet weak var emailInfoLabel: UILabel!
    @IBOutlet weak var phoneInfoLabel: UILabel!
    @IBOutlet weak var websiteInfoLabel: UILabel!
    @IBOutlet weak var companyInfoLabel: UILabel!
    @IBOutlet weak var addressInfoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
