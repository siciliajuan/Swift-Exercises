//
//  main.swift
//  CyclicalAssets
//
//  Created by juan sicilia on 14/6/17.
//  Copyright © 2017 juan sicilia. All rights reserved.
//

import Foundation

var bob: Person? = Person(name: "Bob")

print("Created \(bob)")

var laptop: Asset? = Asset(name: "Shiny Laptop", value: 1500.0)
var hat: Asset? = Asset(name: "Cowboy Hat", value: 175.0)
var backpack: Asset? = Asset(name: "Blue Backpack", value: 45.0)

bob?.takeOwnershipOfAsset(laptop!)
bob?.takeOwnershipOfAsset(hat!)

bob = nil

print("the bob variable is now \(bob)")

laptop = nil
hat = nil
backpack = nil

