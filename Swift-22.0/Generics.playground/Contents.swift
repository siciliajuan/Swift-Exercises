//: Playground - noun: a place where people can play

import Cocoa

struct Stack<Element>: SequenceType {
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
    
    func generate() -> StackGenerator<Element> {
        return StackGenerator(stack: self)
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

print(checkIfEqual(1, 1))
print(checkIfEqual("a string", "a string"))
print(checkIfEqual("a string", "a diferent string"))


func checkIfDescriptionsMatch<T: CustomStringConvertible, U: CustomStringConvertible> (_ first: T, _ second: U) -> Bool {
    return first.description == second.description
}

print(checkIfDescriptionsMatch(Int(1), UInt(1)))
print(checkIfDescriptionsMatch(1, 0.1))
print(checkIfDescriptionsMatch(Float(1.0), Double(1.0)))



// Associated Type


// Here we use associatedType to create a generic that gonna be reset by the 
// Object that implements this protocol
protocol GeneratorType {
    associatedtype Element
    
    mutating func next() -> Element?
}

struct StackGenerator<T>: GeneratorType {
    // It isn't needed as works by inference
    //typealias Element = T
    
    var stack: Stack<T>
    
    mutating func next() -> T? {
        return stack.pop()
    }
}

var myStack = Stack<Int>()
myStack.push(10)
myStack.push(20)
myStack.push(30)
var myStackGenerator = StackGenerator(stack: myStack)
while let value = myStackGenerator.next() {
    print("got \(value)")
}



// Here we use associated type to force the return of the function
// generate() to be something that implements GeneratorType Protocol
protocol SequenceType {
    associatedtype Generator: GeneratorType
    func generate() -> Generator
}

for value in myStack {
    print("for-on loop: got \(value)")
}




