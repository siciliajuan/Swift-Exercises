//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

// FIRST TRY!


func padding(amount: Int) -> String {
    var paddingString = ""
    guard amount > 0 else {
        return paddingString
    }
    for _ in 0 ..< amount {
        paddingString += " "
    }
    return paddingString
}
//
//func printTable(rowLabels: [String], columnLabels: [String], data: [[Int]]) {
//    // Create an array of the width of each row label
//    let rowLabelWidths = rowLabels.map{$0.characters.count}
//    // Determine length of longest row label
//    guard let maxRowLabelWidth = rowLabelWidths.max() else {
//        return
//    }
//    // Create first row containing column headers
//    var firstRow: String = padding(amount: maxRowLabelWidth) + " |"
//    // Alse keep track of the width of each column
//    var columnWidths = [Int]()
//    for columnLabel in columnLabels {
//        let columnHeader = " \(columnLabel) |"
//        firstRow += columnHeader
//        columnWidths.append(columnHeader.characters.count)
//    }
//    print(firstRow)
//    for (i, row) in data.enumerated() {
//        // Pad the row label out so they are all the same length
//        let paddingAmount = maxRowLabelWidth - rowLabelWidths[i]
//        var out = rowLabels[i] + padding(amount: paddingAmount) + " |"
//        for (j, item) in row.enumerated() {
//            let itemString = " \(item) |"
//            let paddingAmount = columnWidths[j] - itemString.characters.count
//            out += padding(amount: paddingAmount) + itemString
//        }
//        // Done - print it!
//        print(out)
//    }
//}
//
//let rowLabels = ["Joe", "Karen", "Fred"]
//
//let columnsLabels = ["Age", "Years of Experience"]
//
//let data = [
//    [30, 6],
//    [40, 18],
//    [50, 20]
//]
//
//printTable(rowLabels: rowLabels, columnLabels: columnsLabels, data: data)

// SECOND TRY

struct Person {
    let name: String
    let age: Int
    let yearsOfExperience: Int
}

protocol TabularDataSource {
    var numberOfRows: Int { get }
    var numberOfColumns: Int { get }
    func labelForRow(row: Int) -> String
    func labelForColumn(column: Int) -> String
    func itemForRow(row: Int, column: Int) -> Int
}

struct Department: TabularDataSource, CustomStringConvertible {
    
    let name: String
    var people = [Person]()
    
    var description: String {
        get {
            return "Department (\(name))"
        }
    }
    
    init(name: String) {
        self.name = name
    }
    
    mutating func addPerson(person: Person) {
        people.append(person)
    }
    
    var numberOfRows: Int {
        get {
            return people.count
        }
    }
    
    var numberOfColumns: Int {
        get{
            return 2
        }
    }
    
    func labelForRow(row: Int) -> String {
        return people[row].name
    }
    
    func labelForColumn(column: Int) -> String {
        switch column {
        case 0 :
            return "Age"
        case 1 :
            return "Years of Experience"
        default:
            fatalError("Invalid column")
        }
    }
    
    func itemForRow(row: Int, column: Int) -> Int {
        switch column {
        case 0:
            return people[row].age
        case 1:
            return people[row].yearsOfExperience
        default:
            fatalError("Invalid column")
        }
    }
}

var department = Department(name: "Engineering")
department.addPerson(person: Person(name: "Joe", age: 3000, yearsOfExperience: 6))
department.addPerson(person: Person(name: "Karen", age: 40, yearsOfExperience: 18))
department.addPerson(person: Person(name: "Fred", age: 50, yearsOfExperience: 20))


func printTable(dataSource:  TabularDataSource & CustomStringConvertible) {
    print("Table: \(dataSource.description)")
    // Create arrays of the row and column labels
    let rowLabels = (0 ..< dataSource.numberOfRows).map{dataSource.labelForRow(row: $0)}
    let columnLabels = (0 ..< dataSource.numberOfColumns).map{dataSource.labelForColumn(column: $0)}
    // Create an array of the width of each row label
    let rowLabelWidths = rowLabels.map{$0.characters.count}
    // Determine length of longest row label
    guard let maxRowLabelWidth = rowLabelWidths.max() else {
        return
    }
    // Create first row containing column headers
    var firstRow: String = padding(amount: maxRowLabelWidth) + " |"
    // Alse keep track of the width of each column
    var columnWidths = [Int]()
    for columnLabel in columnLabels {
        let columnHeader = " \(columnLabel) |"
        firstRow += columnHeader
        columnWidths.append(columnHeader.characters.count)
    }
    print(firstRow)
    for i in 0 ..< dataSource.numberOfRows {
        // Pad the row label out so they are all the same length
        let paddingAmount = maxRowLabelWidth - rowLabelWidths[i]
        var out = rowLabels[i] + padding(amount: paddingAmount) + " |"
        for j in 0 ..< dataSource.numberOfColumns {
            let item = dataSource.itemForRow(row: i, column: j)
            let itemString = " \(item) |"
            let paddingAmount = columnWidths[j] - itemString.characters.count
            out += padding(amount: paddingAmount) + itemString
        }
        // Done - print it!
        print(out)
    }
}

printTable(dataSource: department)
