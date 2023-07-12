import Foundation

struct UserData: Decodable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let phone: String
    let website: String
    let address: AddressData
    let company: CompanyData
}
