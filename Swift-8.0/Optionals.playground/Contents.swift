//: Playground - noun: a place where people can play

import Cocoa

var errorCodeString: String?

var result: String

//errorCodeString = "404"

if let theError = errorCodeString {
    result = theError
    print(result)
} else {
    print("Stop joking me motherfucker!")
}


var tempValue = errorCodeString?.uppercased()



// In the case we want to set the value of a optional if it has value or nil if not, we use ??


var tempValue2 = errorCodeString ?? "Stop motherfucker!!!"