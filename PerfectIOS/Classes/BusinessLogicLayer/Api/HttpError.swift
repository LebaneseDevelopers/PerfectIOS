import Alamofire

enum HTTPError: Int, Error {
    
    case unauthorizedError = 401
    case decodeError = 444
    
    var code: Int {
        switch self {
        default:
            return self.rawValue
        }
    }
    
    var description: String {
        switch self {
        case .decodeError:
            return "Failed to decode object."
        case .unauthorizedError:
            return "Unauthorized call made to server."
        }
    }
    
    //TODO: Add implementation of localization for errors lets support arabic and english for now
    //Going to need to add localizable string classes etc
    var localizedDescription: String {
        switch self {
        default:
            return self.description
        }
    }
    
}
