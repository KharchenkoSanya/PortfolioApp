import UIKit
import RswiftResources

final class UsersTableViewCell: UITableViewCell, ReuseIdentifierType {
    public typealias ReusableType = UsersTableViewCell
    @IBOutlet private weak var nameTitleValue: UILabel!
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
    
    @IBOutlet private weak var albumButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        userNameStatic.text = R.string.texts.userUserNameStatic()
        emailStatic.text = R.string.texts.userEmailStatic()
        phoneStatic.text = R.string.texts.userPhoneStatic()
        websiteStatic.text = R.string.texts.userWebsiteStatic()
        companyStatic.text = R.string.texts.userCompanyStatic()
        addressStatic.text = R.string.texts.userAddressStatic()
    }

    @IBAction func postsButton(_ sender: Any) {
        let controller = PostsTableViewController()
        
        
    }
    
    func setup(user: UserData) {
        nameTitleValue.text = user.name
        userNameValue.text = user.username
        emailValue.text = user.email
        phoneValue.text = user.phone
        websiteValue.text = user.website
        companyValue.text = user.name
        addressValue.text = [user.address.city,
                             user.address.street,
                             user.address.suite,
                             user.address.zipcode].joined(separator: ", ")
    }
}
