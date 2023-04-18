import Foundation

struct Address: Decodable {
    let city: String
    let street: String
    let suite: String
    let zipcode: String
}
