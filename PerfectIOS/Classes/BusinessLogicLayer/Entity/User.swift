import Foundation

/// Making user object Codable since you will most probably send a user object
/// as JSON as well (Encodable), not only Decode it from JSON (Decodable).
/// Thus Codable makes it both Encodable and Decodable
/// It is prefered to make objects structs. Unless you want an object to be passed around as reference
/// Also make all the properties let declerations unless you plan on mutating them
struct User: Codable {

    /// Set properties as optional so that the decoding succeeds even if the
    /// Property doesn't exist
    /// If you are sure that the property will always exist you can remove the optional!
    let id: Int?
    let name: String?
    let username: String?
    let email: String?
    let address: Address?
    let phone: String?
    let website: String?
    let company: Company?

    enum CodingKeys: String, CodingKey {
        case id, name, username, email, address, phone, website, company
    }

}
