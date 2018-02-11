//
//  GenericTableDataSource.swift
//  ProjectSample
//
//  Created by Hadi Dbouk on 2/11/18.
//  Copyright © 2018 Hadi Dbouk. All rights reserved.
//

import UIKit
import RxCocoa
import Then

class GenericTableDataSource<Cell: UITableViewCell>: NSObject, UITableViewDataSource
where Cell: ConfigurableCell {

    let items: BehaviorRelay<[ViewCellModelProtocol]?>
    
    init(with items: BehaviorRelay<[ViewCellModelProtocol]?>) {
        self.items = items
        super.init()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.value?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueCell(ofType: Cell.self).then {
            (cell) in
            cell.configure(items.value![indexPath.row])
        }
    }
}
