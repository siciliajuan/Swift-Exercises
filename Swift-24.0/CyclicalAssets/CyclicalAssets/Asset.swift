//
//  Asset.swift
//  CyclicalAssets
//
//  Created by juan sicilia on 14/6/17.
//  Copyright © 2017 juan sicilia. All rights reserved.
//

import Foundation

class Asset: CustomStringConvertible {
    let name: String
    let value: Double
    weak var owner: Person?
    
    var description: String {
        if let actualOwner = owner {
            return "Asset(\(name), worth \(value), owned by \(actualOwner))"
        } else {
            return "Asset(\(name), worth \(value), not owned by anyone)"
        }
    }
    
    init( name: String, value: Double) {
        self.name = name
        self.value = value
    }
    
    deinit {
        return print("\(self) is being deallocated")
    }
}
