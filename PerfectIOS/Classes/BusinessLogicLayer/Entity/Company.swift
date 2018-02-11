import Foundation

struct Company: Codable {

    let name: String?
    let catchPhrase: String?
    let bs: String?

    enum CodingKeys: String, CodingKey {
        case name, catchPhrase, bs
    }
}
