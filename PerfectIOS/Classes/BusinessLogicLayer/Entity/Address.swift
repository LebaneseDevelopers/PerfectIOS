import Foundation


struct Address: Codable {

    let street: String?
    let suite: String?
    let city: String?
    let zipcode: String?
    /// I could have named this geo as in the json however
    /// for the sake of the example I will name it geolocation
    let geolocation: Geolocation?

    enum CodingKeys: String, CodingKey {
        case street, suite, city, zipcode
        case geolocation = "geo"
    }

}
