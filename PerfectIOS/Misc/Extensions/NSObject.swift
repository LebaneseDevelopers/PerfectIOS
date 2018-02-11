//
//  NSObject.swift
//  ProjectSample
//
//  Created by Hadi Dbouk on 2/10/18.
//  Copyright © 2018 Hadi Dbouk. All rights reserved.
//

import Foundation

public extension NSObject {
    
    public class var nameOfClass: String {
        return NSStringFromClass(self)
            .components(separatedBy:".")
            .last!
    }
    
    public var nameOfClass: String{
        return NSStringFromClass(type(of: self))
            .components(separatedBy:".")
            .last!
    }
}
