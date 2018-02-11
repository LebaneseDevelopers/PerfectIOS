import RxSwift

class Api {

    func getAllUsers() -> Observable<[User]> {
        let request = Request(path: "https://jsonplaceholder.typicode.com/users",
            method: .get,
            bodyParams: nil,
            headers: nil)

        let usersObservable: Observable<[User]> = ApiCall.Get(request: request)
        return usersObservable
    }
}
