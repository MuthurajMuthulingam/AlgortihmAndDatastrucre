//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func finddifferenceInDiagonal() {
    let t = Int(readLine()!)!
    for _ in 0..<t{
        // read the integer n
        let n = Int(readLine()!)!
        // declare 1d array
        var arr: [Int] = []
        arr = readLine()!.components(separatedBy: " ").map{ Int($0)! }
        print("Array : \(arr)")
    }
    
    
    // iterate only diagonal values of nested array (two dimentional array)
    /*var leftDiogonalSum = arr[0][0]
    let start = n-1
    var rightDiogonalSum = arr[start][0]
    for i in 1..<arr.count {
        leftDiogonalSum = leftDiogonalSum + arr[i][i]
        rightDiogonalSum = rightDiogonalSum + arr[start - i][i]
    }
    let difference = abs(leftDiogonalSum - rightDiogonalSum)
    print(difference)*/
}


func findMaximumSum(Array arr:[Int]) -> (maxSum:Int,maxSeq:Int) {
    if arr.isEmpty {
        return (0,0)
    }
    
    var currentSum = arr[0]
    var currentMaxSumSeq = arr[0]
    var finalMaxSumSeq = 0
    var finalSum = arr[0]
    for i in 1..<arr.count {
        let newSum = currentSum+arr[i]
        if newSum >= arr[i] {
            currentSum = currentSum+arr[i]
            if arr[i] > 0 {
               currentMaxSumSeq = currentMaxSumSeq+arr[i]
            }
        } else {
            currentSum = arr[i]
            currentMaxSumSeq = arr[i]
        }
        
        finalSum = max(finalSum, currentSum)
        finalMaxSumSeq = max(finalMaxSumSeq, currentMaxSumSeq)
    }
    if finalMaxSumSeq == 0 {
        finalMaxSumSeq = finalSum
    }
    return (finalSum,finalMaxSumSeq)
}
let result = findMaximumSum(Array: [2,-1,2,3,4,-5])
print("\(result.maxSum) \(result.maxSeq)")

// left rotation
func leftRotate(arr:[Int], n:Int) -> [Int] {
    var rotatedArray:[Int] = []
    for i in 0..<arr.count {
        let newIndex = n+i
        if newIndex < arr.count {
            rotatedArray[i] = arr[newIndex]
        } else {
            rotatedArray[i] = arr[newIndex - arr.count]
        }
    }
    return rotatedArray
}

if let countString = readLine(),
   let arr = readLine() {
    let numberCount = countString.components(separatedBy: " ")
    let numberArray = arr.components(separatedBy: " ").map{Int($0)}
        if numberCount.count == 2 {
            let n = Int(numberCount[0])
            let rotationCount = Int(numberCount[1])
        }
    debugPrint("number array : \(numberArray)")

}

let index = "test".index("test".endIndex, offsetBy: -2)
let test = "test".substring(from: index)
let time = "test".substring(to: index)
let split = "17:05:20".components(separatedBy: ":")
var finalArray = split.flatMap{Int($0)}
if finalArray.count == 3 {
    var hour = finalArray[0]
    let min = finalArray[1]
    let sec = finalArray[2]
    hour = hour+12
    finalArray[0] = hour
}
let finalStringArray = finalArray.map{String($0)}
let finalString = finalStringArray.joined(separator: ":")

func nextLine() -> String? {
    return readLine()
}

func values(from string:String, seperator:String) -> [Int] {
    return string.components(separatedBy: seperator).flatMap{Int($0)}
}

func isWithinRange<T: Comparable & Equatable>(low:T, high:T, value:T) -> Int {
    var finalValue = 0
    if (low <= value) && (low <= high) { finalValue = 1}
    return finalValue
}

func testing() {
    guard let houseRange = nextLine(),
        let treePoint = nextLine(),
        let throughCount = nextLine(),
        let aCount = nextLine(),
        let oCount = nextLine() else {  return }
    let seprator = " "
    let houseRangeValues = values(from: houseRange, seperator: seprator)
    let treeRangeValues = values(from: treePoint, seperator: seprator)
    let _ = values(from: throughCount, seperator: seprator)
    let aCountValues = values(from: aCount, seperator: seprator)
    let oCountValues = values(from: oCount, seperator: seprator)
    
    if treeRangeValues.count == 2 && houseRangeValues.count == 2 { // two tree ranges
        let aTree = treeRangeValues[0]
        let finalACount = aCountValues.map{$0+aTree}.flatMap{isWithinRange(low: houseRangeValues[0], high: houseRangeValues[1], value: $0)}.reduce(0, +)
        let finalOCount = oCountValues.map{$0+aTree}.flatMap{isWithinRange(low: houseRangeValues[0], high: houseRangeValues[1], value: $0)}.reduce(0, {$0+$1})
        print("\(finalACount) \(finalOCount)")
    }
    
}


print("Test: \(testing())")
