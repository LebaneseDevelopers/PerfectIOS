//
//  GenericTableDelegate.swift
//  ProjectSample
//
//  Created by Hadi Dbouk on 2/11/18.
//  Copyright © 2018 Hadi Dbouk. All rights reserved.
//

import UIKit

class GenericTableDelegate<Cell: UITableViewCell>: NSObject, UITableViewDelegate where Cell:  ConfigurableCell {
    
    private let source:GenericTableDataSource<Cell>!
    
    init(with source:GenericTableDataSource<Cell>) {
        self.source = source
        super.init()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        source.items.value?[indexPath.row].onSelect()
    }
}
