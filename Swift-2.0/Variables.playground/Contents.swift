//: Playground - noun: a place where people can play

import Cocoa

var numberOfStopLights = 4  // type inference it means that swift automaticaly fing the type of a variable (It isn't needed to specify the type)

numberOfStopLights += 2

/*
 You can set a variable specifying the type or not
 
 var myVar = 4
 
 or
 
 var myVar: Int = 4    // This is type anotation
 
 */

// Contants vs variables

/*
 
 We define variables using the reserved word var nad constants using the reserved word let
 
*/

let myConst = 4
var myVar: Int
myVar = 518

// Strings

var townName: String = "Knowhere"

// Add a variable or constant to a String

var townDescription: String = "\(townName) has a population of 5288"

// Print in the console

print(townDescription)