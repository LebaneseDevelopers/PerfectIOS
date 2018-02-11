//
//  Company.swift
//  CodableExample
//
//  Created by Serj Agopian on 2/10/18.
//  Copyright © 2018 Serj Agopian. All rights reserved.
//

import Foundation

struct Company: Codable {
    
    let name: String?
    let catchPhrase: String?
    let bs: String?
    
    enum CodingKeys: String, CodingKey {
        case name, catchPhrase, bs
    }
}
