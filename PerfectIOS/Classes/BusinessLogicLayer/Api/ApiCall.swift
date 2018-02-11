//
//  File.swift
//  ProjectSample
//
//  Created by Hadi Dbouk on 2/11/18.
//  Copyright © 2018 Hadi Dbouk. All rights reserved.
//

import RxSwift
import Alamofire

class ApiCall {

    public static func Get<T>(request: Request) -> Observable<T> where T: Decodable {
        return Observable.create {
            observer in

            let request = Alamofire.request(request.path,
                method: request.method,
                parameters: request.bodyParams,
                encoding: JSONEncoding.default,
                headers: request.headers)
                .validate(statusCode: 200..<300)
                .responseData {
                    response in

                    switch response.result {

                    case .success(_):

                        let decoder = JSONDecoder()

                        do {
                            let data = try decoder.decode(T.self, from: response.data!)
                            observer.onNext(data)
                            observer.onCompleted()
                        }
                        catch {
                            let httpError = HttpError(code: HttpErrorCode.FAILED_TO_DECODE_DATA.rawValue)
                            observer.onError(httpError)
                        }

                    case .failure(let error):
                        if let httpStatusCode = response.response?.statusCode {
                            let httpError = HttpError(code: httpStatusCode)
                            observer.onError(httpError)
                        }
                        else {
                            observer.onError(error)
                        }
                    }
            }

            return Disposables.create(with: request.cancel)
        }.observeOn(MainScheduler.instance)
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
    }
}
