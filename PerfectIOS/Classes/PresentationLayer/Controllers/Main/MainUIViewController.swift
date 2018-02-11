import UIKit
import RxSwift

class MainVC: UIViewController {

    fileprivate var disposableBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let api = Api()
        api
            .getAllUsers()
            .subscribe {
                event in
                switch event {
                case .next(let users):
                    print(users)
                case .completed:
                    print("completed")
                case .error(let error):
                    print(error)
                }
        }.disposed(by: disposableBag)
    }
}

