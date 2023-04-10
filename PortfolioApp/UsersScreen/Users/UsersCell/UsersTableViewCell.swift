import UIKit

final class UsersTableViewCell: UITableViewCell {
    @IBOutlet private weak var nameTitle: UILabel!
    @IBOutlet private weak var userNameStatic: UILabel!
    @IBOutlet private weak var emailStatic: UILabel!
    @IBOutlet private weak var phoneStatic: UILabel!
    @IBOutlet private weak var websiteStatic: UILabel!
    @IBOutlet private weak var companyStatic: UILabel!
    @IBOutlet private weak var addressStatic: UILabel!
    @IBOutlet private weak var userNameValue: UILabel!
    @IBOutlet private weak var emailValue: UILabel!
    @IBOutlet private weak var phoneValue: UILabel!
    @IBOutlet private weak var websiteValue: UILabel!
    @IBOutlet private weak var companyValue: UILabel!
    @IBOutlet private weak var addressValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(user: User) {
        userNameStatic.text = "username"
        nameTitle.text = user.name
        userNameValue.text = user.username
        emailValue.text = user.email
        phoneValue.text = user.phone
        websiteValue.text = user.website
        companyValue.text = user.name
        addressValue.text = "\(user.address.city), \(user.address.street), \(user.address.suite), \(user.address.zipcode),"
    }
}
