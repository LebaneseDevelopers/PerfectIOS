//
//  Request.swift
//  ProjectSample
//
//  Created by Hadi Dbouk on 2/11/18.
//  Copyright © 2018 Hadi Dbouk. All rights reserved.
//

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
