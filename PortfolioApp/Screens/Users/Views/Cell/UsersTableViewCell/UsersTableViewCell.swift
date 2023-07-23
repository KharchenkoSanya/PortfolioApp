import UIKit

final class UsersTableViewCell: UITableViewCell {
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
    
    var onPostButtonTap: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        userNameStatic.text = "User.title".localized
        emailStatic.text = "User.emailStatic".localized
        phoneStatic.text = "User.phoneStatic".localized
        websiteStatic.text = "User.websiteStatic".localized
        companyStatic.text = "User.companyStatic".localized
        addressStatic.text = "User.addressStatic".localized
    }
    
    @IBAction func postsButton(_ sender: Any) {
        onPostButtonTap?()
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
