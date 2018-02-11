//
//  HttpError.swift
//  ProjectSample
//
//  Created by Hadi Dbouk on 2/11/18.
//  Copyright © 2018 Hadi Dbouk. All rights reserved.
//

import Alamofire

class HttpError: Error {
    
    init(code httpResponseCode: Int) {
        self.httpResponseCode = httpResponseCode
    }
    var httpResponseCode: Int = 200
}

public enum HttpErrorCode: Int {
    case FAILED_TO_DECODE_DATA = 444
}
