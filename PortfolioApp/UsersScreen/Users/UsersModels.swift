import Foundation

struct User: Decodable {
    let name: String
    let username: String
    let email: String
    let phone: String
    let website: String
    let address: Address
    let company: Company
}

struct Address: Decodable {
    let city: String
    let street: String
    let suite: String
    let zipcode: String
}

struct Company: Decodable {
    let name: String
}
