//
//  ViewController.swift
//  ProjectSample
//
//  Created by Hadi Dbouk on 2/10/18.
//  Copyright © 2018 Hadi Dbouk. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

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

