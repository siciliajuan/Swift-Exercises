//: Playground - noun: a place where people can play

import Cocoa

var volunteerCounts = [1,3,40,32,2,53,77,13]

// Using function as parameter

func sortAscending(i: Int, j: Int) -> Bool{
    return i < j
}

volunteerCounts.sort(by: sortAscending)

// Using clousure sintax

volunteerCounts.sort( by: {(i: Int, j: Int) -> Bool in
return i < j
})

// Using inference

volunteerCounts.sort( by: {i,j in i < j})

// Using sorthand sintax

volunteerCounts.sort( by: {$0 < $1})