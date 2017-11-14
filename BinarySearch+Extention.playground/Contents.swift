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
// Find occurances of number in Sorted array
func countOccuranceOfElement(InSortedArray arr:[Int],Number num:Int) -> Int {
    var count = 0
    // count of element = occurance of max index - occurance min index + 1
    // Algorithm, Find a min and max index of elemnt to count using
    // Bimary search as Array is sorted
    let lowerIndex = findIndexOfElement(InSortedArray: arr, Number: num, isLowerIndex: true)
    if lowerIndex > -1 {
        let higherIndex = findIndexOfElement(InSortedArray: arr, Number: num, isLowerIndex: false)
        count = (higherIndex-lowerIndex)+1
    }
    
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
print("Count of \(numberToFind) in \(arr) is \(countOccuranceOfElement(InSortedArray: arr, Number: numberToFind))")

//MARK: - Rotated Sorted Array

func countRotationCount(Array arr:[Int]) -> Int {// find lowest in rotated sorted array
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
                if arr[mid] <= arr[next] && arr[mid] <= arr[prev] { // found pivot point, i.e, lowest value index
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

// find element in sorted rotated element
func findElement(InSortedRotatedArray arr:[Int], ElementToFind num:Int) -> Int {
    var numberIndex = -1
    if !arr.isEmpty {
        var low = 0
        var high = arr.count - 1
        while(low<=high) {
            let mid = (low+high)/2
            if arr[low] <= arr[high] { // No Rotation at all
                // do actual binary search
                if arr[mid] == num {
                    numberIndex = mid
                    break
                } else if arr[mid]<num {
                    low = mid+1
                } else {
                    high = mid-1
                }
            } else { // Array is Rotated
                    // one half of array is sorted, 
                    // need to find that half, then apply normal comparision
                if arr[mid]<=arr[high] { // right half is sorted
                    if num>arr[mid] && num<=arr[high] {
                        low = mid+1
                    } else {
                        high = mid-1
                    }
                } else { // left half is sorted
                    if num<arr[mid] && num>=arr[low] {
                        high = mid-1
                    } else {
                        low = mid+1
                    }
                    
                }
            }
        }
    }
    return numberIndex
}
let num = 7
let sortedRotated = [7,1,2,3,4,5,6]
print("Find \(num) in Array : \(sortedRotated), resultIndex : \(findElement(InSortedRotatedArray: sortedRotated, ElementToFind: num))")
