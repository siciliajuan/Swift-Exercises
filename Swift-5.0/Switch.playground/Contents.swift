//: Playground - noun: a place where people can play

import Cocoa

// Switch statement

/*
 
 Grammar
 
 switch myVar {
    case value1:
        // something great to do
    case value2:
        // something great to do
    case value3:
        // something great to do
    default:
        // some default behabiour
 }
 
 
 - A switch statement needs so solve all posibles values of the variable or contant we are checking in its cases, in other case xcode is gonna throws an exception
 
 - In Swift the switch statement doesn't fallthrow to the next case as in most languages where you need to put a break line to stop the fallthrow, in Swift is the oposite, by default is gonna stop and if you want to fallthrow you have to put the fallthrow instruction.
 
 - We can capture a case value in a constant or varible 
    - I ponerles un where
 
 */

var statusCode: Int = 404
var errorString: String = "the request failed with the error:"
switch statusCode {
case 400, 401, 403, 404:
    errorString = "There was somethinng wrong with the request."
    fallthrough
default:
    errorString += " Please review the request and try again"
}

// Use range of values instead a unique value

errorString = "the request failed with the error:"
switch statusCode {
case 100, 101:
    errorString += " Informational, 1xx."
case 204:
    errorString += " Successful but no content, 204."
case 300...307:
    errorString += " There was somethinng wrong with the requestRedirection, 2xx";
case 400...417:
    errorString += " Cient error, 4xx."
case 500...505:
    errorString += " Server error, 5xx."
case let unkownsCode:
    errorString = " \(unkownsCode) is not a known error code"
}



// Tuplas

var myTuple = (5,6)
myTuple.1
var myTuple2: (value1:Int,value2:Int,value2:String) = (7,8,"dfsefd")
myTuple2.0
myTuple2.value1


// if case where

let age = 43

//if case 5...50 = age where age >=13 {
//    print("Aleluya!")
//}


let point = (x: 1, y: 4)

switch point {
case let q1 where (point.x > 0) && (point.y > 0):
    print("\(q1) is in the quadrant 1")
default:
    break;
}
