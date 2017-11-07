//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// MARK: - Algorithms by Leetcode
func findMaximumConsecutiveOnesInArray(Array arr:[Int]) -> Int {
    var maxCount = 0
    var localMaxCount = 0
    for num in arr {
        if num == 1 {
            localMaxCount += 1
            maxCount = max(localMaxCount, maxCount)
        } else {
            localMaxCount = 0
        }
    }
    return maxCount
}

print("Find MAX One count : \(findMaximumConsecutiveOnesInArray(Array: [0,1,0,1,1,1]))")

func findMajorityElement(InArray arr:[Int]) -> Int {
    var majorityElementCount = 0
    var majorityEle = 0
    var numberCount:[Int:Int] = [:]
    // find count of each element
    for num in arr {
        if let count = numberCount[num] {
            numberCount[num] = count+1
        } else {
            numberCount[num] = 1
        }
        // update majority count
        if numberCount[num]! > majorityElementCount {
            majorityElementCount = numberCount[num]!
            majorityEle = num
        }
    }
    return majorityEle
}

func majorityElement(_ nums: [Int]) -> Int {
    var major = nums.first!
    var sum = 0
    for num in nums {
        if num == major {
            sum += 1
        } else {
            sum -= 1
        }
        print("Num : \(num) and major : \(major) and sum  : \(sum)")
        if sum == 0 {
            major = num
            sum = 1
        }
    }
    
    return major
}

print("Majority Element : \(findMajorityElement(InArray: [1,2,3,4,5,6,5,6,6,5,5]))")
print("Majority : \(majorityElement([1,2,3,4,5,6,5,6,6,5,5]))")
