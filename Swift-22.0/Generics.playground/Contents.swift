//: Playground - noun: a place where people can play

import Cocoa

struct Stack<Element> {
    var items = [Element]()
    
    mutating func push(_ newItem: Element) {
        self.items.append(newItem)
    }
    
    mutating func pop() -> Element? {
        guard !self.items.isEmpty else {
            return nil
        }
        return self.items.removeLast()
    }
    
    func map<U>(_ f: (Element) -> (U)) -> Stack<U> {
        var mappedItems = [U]()
        for item in items {
            mappedItems.append(f(item))
        }
        return Stack<U>(items: mappedItems)
    }
}

var intStack = Stack<Int>()

intStack.push(1)
intStack.push(2)
var doubleStack = intStack.map({2 * $0})

print(intStack.pop())
print(intStack.pop())
print(intStack.pop())

print(doubleStack.pop())
print(doubleStack.pop())

var stringStack = Stack<String>()

stringStack.push("This is a string")
stringStack.push("another string")

print(stringStack.pop())

// METHODS WITH GENERICS

func myMap<T,U>(_ items: [T], _ f: (T) -> (U)) -> [U] {
    var result = [U]()
    for item in items {
        result.append(f(item))
    }
    return result
}

let strings = ["one", "two", "three"]
func myFunction(_ item: String) -> Int {
    return item.characters.count
}
var stringLengths = myMap(strings, myFunction)
print(stringLengths)
// The same but with inference
stringLengths = myMap(strings) {$0.characters.count}
print(stringLengths)


// As we cannot know what a type is able we need mecanism to verify that implements 
// the behabiour we expected, we do that using protocols

func checkIfEqual<T: Equatable>(_ first: T, _ second: T) -> Bool {
    return first == second
}







