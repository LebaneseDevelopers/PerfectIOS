import Alamofire

class Request {

    var path: String
    var method: HTTPMethod
    var bodyParams: [String: Any]?
    var headers: [String: String]?

    init(path: String,
        method: HTTPMethod,
        bodyParams: [String: Any]?,
        headers: [String: String]?
    ) {
        self.path = path
        self.method = method
        self.bodyParams = bodyParams
        self.headers = headers
    }
}
