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