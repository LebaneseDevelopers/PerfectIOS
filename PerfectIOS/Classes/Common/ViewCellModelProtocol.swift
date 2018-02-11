//
//  ViewCellModelProtocol.swift
//  ProjectSample
//
//  Created by Hadi Dbouk on 2/11/18.
//  Copyright © 2018 Hadi Dbouk. All rights reserved.
//

import Foundation

protocol ViewCellModelProtocol {
    var model: Any? { get }
    func onSelect()
}
