//: Playground - noun: a place where people can play

import Cocoa

var population: Int = 5422
var message: String
var hasPostOffice: Bool = false

if population < 10000 {
    message = "\(population) is a small town"
} else {
    message = "\(population) is pretty big!"
}

print(message)

if !hasPostOffice {
    print("Where do we buy stamps?")
}

// Operadores ternarios

/*
 
var myVar = option == comparation ? value1 : value2
 
*/


message = population < 10000 ? "\(population) is a small town" : "\(population) is pretty big!"

print(message)


//  WE CAN USE ELSE IF STATEMENT TO AVOID NESTED IF ELSE