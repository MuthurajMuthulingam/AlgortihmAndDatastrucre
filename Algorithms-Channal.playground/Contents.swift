//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func findNumber(InArray array:[Int], numberToFind num:Int) -> Int {
    for (index,number) in array.enumerated() {
        if num == number {
            return index
        }
    }
    return -1
}

findNumber(InArray: [1,2,3,4,5], numberToFind: 5)






func findMaximum(FromArray array:[Int]) -> (Int,Int) {
    var largestNumber = 0
    var largestNumIndex = -1
    for (index,num) in array.enumerated() {
        if largestNumber < num {
            largestNumber = num
            largestNumIndex = index
        }
    }
    
    return (largestNumber,largestNumIndex)
}

findMaximum(FromArray: [2,4,5,7])




























