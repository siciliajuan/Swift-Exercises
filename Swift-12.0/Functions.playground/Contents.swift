//: Playground - noun: a place where people can play

import Cocoa

func printGreetings(_ name: String) {
    print("Hello \(name), playground")
}

printGreetings("Pepe")

func division(denominator den: Double, numerator num: Double) -> Double {
    return num/den
}

division(denominator: 2, numerator: 10)

func printPersonalGreetings(names: String...) {
    for name in names {
        print("Hello \(name), have a nice day")
    }
}

printPersonalGreetings(names: "Pepe", "Ana")


func seyHet(name: String = "Alfredo") {
    print(name)
}

seyHet(name:"Alfonso")
seyHet()


func myInOutFunction(externo interno: inout String) {
    print(interno)
}

var ole = "olé"
myInOutFunction(externo: &ole)