//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//MARK: - Binary Search applications
func leftShift(Array arr:[Int], N n:Int) -> [Int] {
    if n>0 {
        var resultArray:[Int] = []
        for i in 0..<arr.count {
            let count = i+n
            if count >= arr.count {
                resultArray.append(arr[count-arr.count])
            } else {
                resultArray.append(arr[count])
            }
        }
        return resultArray
    }
    return []
}

print("Left Shift : \(leftShift(Array: [1,2,3,4,5,6,7], N: 2))")

func findNumberUsingBinarySearch(SortedArray arr:[Int],NumberToFind num:Int) -> Int {
    var resultIndex = -1
    // check array is empty or not
    if !arr.isEmpty {
        // do binary search
        var low = 0
        var high = arr.count-1
        while low<=high {
            let mid = (low+high)/2
            if arr[mid] == num {
                resultIndex = mid
                break
            } else  if arr[mid] < num {
                low = mid+1
            } else {
                high = mid
            }
        }
    }
    return resultIndex
}

print("Find Number : \(findNumberUsingBinarySearch(SortedArray: [1,2,3,4,5,6,7], NumberToFind: 7))")

func countRotationCount(Array arr:[Int]) -> Int {
    var rotationCount = -1
    // actually algorithm is to find the index of lowest elemt in a array
    // where , next and previous element are bigger than current index
    if !arr.isEmpty {
        var low = 0
        var high = arr.count - 1
        let arrCount = arr.count
            while low<=high {
                if arr[low] <= arr[high] {
                    rotationCount = low
                    break
                }
                let mid = low+high/2
                let next = (mid+1)%arrCount
                let prev = (mid+arrCount-1)%arrCount
                if arr[mid] <= arr[next] && arr[mid] <= arr[prev] { // found pivot point, i.e, lowest value point
                    rotationCount = mid
                    break
                } else if arr[mid] <= arr[high] {
                    high = mid-1
                } else if arr[mid] >= arr[low] {
                    low = mid+1
                }
            }
    }
    return rotationCount
}

print("Rotation count : \(countRotationCount(Array: [7,1,2,3,4,5,6]))")

func countOccuranceOfElement(InSortedArray arr:[Int],Number num:Int) -> Int {
    var count = 0
    // count of element = occurance of max index - occurance min index + 1
    // Algorithm, Find a min and max index of elemnt to count using 
    // Bimary search as Array is sorted
    
    return count
}

func findIndexOfElement(InSortedArray arr:[Int],Number num:Int, isLowerIndex:Bool) -> Int {
    var resultIndex = -1
    if !arr.isEmpty {
            // do binary Search
            var low = 0
            var high = arr.count-1
            while low <= high {
                let mid = (low+high)/2
                if arr[mid] == num {
                    resultIndex = mid
                    if isLowerIndex {
                        high = mid-1
                    } else {
                        low = mid+1
                    }
                } else if arr[mid] < num {
                    low = mid+1
                } else {
                    high = mid-1
                }
            }
    }
    return resultIndex
}

let arr = [1,2,3,4,5,6,6,6,7,7]
let numberToFind = 7
let lowerIndex = findIndexOfElement(InSortedArray: arr, Number: numberToFind, isLowerIndex: true)
if lowerIndex > -1 {
    let higherIndex = findIndexOfElement(InSortedArray: arr, Number: numberToFind, isLowerIndex: false)
    let count = (higherIndex-lowerIndex)+1
    print("Count : \(count)")
}
