//
//  Person.swift
//  CyclicalAssets
//
//  Created by juan sicilia on 14/6/17.
//  Copyright © 2017 juan sicilia. All rights reserved.
//

import Foundation

class Person: CustomStringConvertible {
    let name: String
    var assets = [Asset]()
    
    var description: String {
        return "Person (\(name))"
    }
    
    init (name: String) {
        self.name = name
    }
    
    deinit {
        print("\(self) is being deallocated")
    }
    
    func takeOwnershipOfAsset(_ asset: Asset) {
        asset.owner = self
        assets.append(asset)
    }
}
