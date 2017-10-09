//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// MARK: - Algorithm collection
/*
/// find minimum value
func findMinimumValue(FromArray a:[Int]) -> Int {
    // iterate once throughout array.
    // compare it with local value
    var minimum = 0
    for number in a {
        if minimum > number { // assign minimum
            minimum = number
        }
    }
    return minimum
}

/// find second minimum value
func findSecondMinimum(FromArray a:[Int]) -> Int {
    var secondMinimum = Int.max
    var minimum = Int.max
    for number in a {
        if minimum > number {
           secondMinimum = minimum
           minimum = number
        } else if secondMinimum > number {
           secondMinimum = number
        }
    }
    return secondMinimum
}

print("Minimum : \(findMinimumValue(FromArray: [2,3,5,1,4,0]))")
print("second Minimum : \(findSecondMinimum(FromArray: [2,3,5,1,4,0]))")

/// find is there any duplicate available in  array
func isDuplicateAvailable(InArray arr:[Int]) -> Bool {
    // NOTE : Brute force approach by nested loop -> Basic approach 1, O(N^2)
    // Keep a set datastructure and iterate once a array -> Inprovised , Time : O(N)+O(LOGN) -> O(N), Space  : O(N)
    // Encoding : change the sign of index at that item. iff, items => 0 to n-1
    var isDuplicate = false
    var mySet = Set<Int>()
    for number in arr {
        if mySet.contains(number) {
            isDuplicate = true
            break
        } else {
            mySet.insert(number)
        }
    }
    return isDuplicate
}

/// find duplicate using encoding appraoch
func isDuplicateUsingEncoding(Array arr:[Int]) -> Bool {
    var isDuplicate = false
    var myArray = arr
    for (index,_) in arr.enumerated() {
        let modifiedIndex = arr[index] - 1
        if myArray[modifiedIndex] < 0 {
            isDuplicate = true
            break
        } else {
            myArray[modifiedIndex] = -myArray[modifiedIndex]
        }
    }
    return isDuplicate
}

/// count number of duplicates
func countDuplicates(InArray arr:[Int]) -> [Int:Int] {
    var myDict:[Int:Int] = [:]
    for number in arr {
        if let count = myDict[number] {
            myDict[number] = count+1
        } else {
          myDict[number] = 1
        }
        
    }
    return myDict
}

/// count number of duplicates
func findMaxCountDuplicates(InArray arr:[Int]) -> (number:Int,count:Int) {
    var myDict:[Int:Int] = [:]
    var maximumCount:Int = 0
    var number:Int = 0
    for num in arr {
        if let count = myDict[num] {
            myDict[num] = count+1
        } else {
            myDict[num] = 1
        }
        // update maximum
        if let unwrappedNumber = myDict[num],
            unwrappedNumber > maximumCount {
            maximumCount = unwrappedNumber
            number = num
        }
    }
    return (number,maximumCount)
}


print("find is duplicate : \(isDuplicateAvailable(InArray: [1,4,3,2,5,6,5]))")
print("find is duplicate using encoding : \(isDuplicateUsingEncoding(Array: [1,4,3,2,5,6]))")
print("Count : \(countDuplicates(InArray: [1,4,3,2,5,6,5]))")
print("Max count : \(findMaxCountDuplicates(InArray: [1,4,3,2,5,6]))")

//MARK: - Polindrome , Prime Number

/// Given number is Prime
func isPrimeNumber(number:Int) -> Bool {
    // Given number is prime, if number is only divided by 1 and iteself
    var isPrime = true
    // optimize solution
    let newNumber = Int(sqrt(Double(number)))
    if newNumber > 2 {
        for i in (2..<newNumber){
            if number%i == 0 {
                isPrime = false
                break
            }
        }
    }
    return isPrime
}

/// All Prime numbers in given range
func getAllPrimes(Between lowestNumber:Int, highestNumber:Int) -> [Int] {
    var primeNumbers:[Int] = []
    if lowestNumber < highestNumber {
        for i in (lowestNumber...highestNumber) {
            var isPrime = true
            // optimize solution
            let newNumber = Int(sqrt(Double(i)))
            if newNumber > 2 {
                for j in (2..<newNumber){
                    if i%j == 0 {
                        isPrime = false
                        break
                    }
                }
            }
            if isPrime {
                primeNumbers.append(i)
            }
        }
    }
    return primeNumbers
}

print("Check is Prime : \(isPrimeNumber(number: 3))")
print("Prim Numbers : \(getAllPrimes(Between: 1, highestNumber: 1000))") */

/// polindrome 
func isPolindrome(number:Int) -> Bool {
    var isPolindrome = false
    var reversedNumber = 0
    if number > 10 { // base condition
        var temp:Int = number
        while temp>0 {
            let rem = temp%10
            reversedNumber = (reversedNumber*10) + rem
            temp = temp/10
        }
        if reversedNumber == number {
            isPolindrome = true
        }
    }
    return isPolindrome
}

print("polindrome : \(isPolindrome(number: 122))")

//MARK: - Next level
/// find pair of numbers matches given sum
func findPairNumbers(Array arr:[Int],sum:Int,sorted:Bool) -> Bool {
    // Approach 1 : Brute force approach, iterate using nested loop. Time => O(N^2)
    // Sorted array or not
    // if not sorted, Sort it. Time => O(LOGN)
    // then keep two pointers max, min 
    // find sum of min and max
    // if sum > givenSum then decreamnet max by 1
    // if sum < givenSum then increament min by 1
    // else return the found result. Time => O(NLOGN)
    
    var isAvailable = false
    if sorted { // Sorted Array Approach
        var j=arr.count - 1
        var i=0
        while i<j {
            let elementsSum = arr[i] + arr[j]
            if elementsSum > sum { // sum is greater than given Sum
               j=j-1
            } else if elementsSum < sum { // sum is less than given Sum
                i = i+1
            } else { // Sum is equal
                isAvailable = true
                break
            }
        }
    } else { // unsorted Array approach
        var complements:Set<Int> = []
        for number in arr {
            if(number < sum) {
                let complement = sum - number
                print("comp: \(complement) and set: \(complements)")
                if complements.contains(complement) {
                    isAvailable = true
                    break
                } else {
                   complements.insert(number)
                }
            }
        }
    }
    
    return isAvailable
}

/// Maximum sum of given array with negative numbers
func findMaximumSum(OfArray arr:[Int]) -> Int {
    var maxSum = 0
    var currentSum = 0
    for num in arr {
        currentSum = max(currentSum+num, num)
        maxSum = max(maxSum, currentSum)
    }
    return maxSum
}

//print("Find Pair of number mathces sume : \(findPairNumbers(Array: [1,2,3,4,5,6,7,8], sum: 15, sorted: false))")
print("find pair of sum in unsorted array : \(findPairNumbers(Array: [2,3,1,5,7,11,5,4,54], sum: 9, sorted: false))")
print("Max Sum : \(findMaximumSum(OfArray: [2,-2,1,2,-5,5]))")

//MARK: - Strings
func maxOcurranceOfContigiousChar(string:String) {
    
}

/// String Polindrome
func isPolindrome(string:String) -> Bool {
    var isPolindrome = false
    if string.characters.count > 2 { // base condition
        // keep two pointers to array, from first and last index
        // check both char at specific index, return true
        // otherwise false, if not satisfied
    }
    return isPolindrome
}


//MARK: - Sorting
// Sort 0,1
func sortBinaryNumber(Array arr:[Int]) ->[Int] {
    var sortedArray:[Int] = arr
    var i=0
    var j=arr.count - 1
    while i<=j {
        if sortedArray[i] == 1 || sortedArray[j] == 0{
           sortedArray[i] = 0
           sortedArray[j] = 1
        }
        i = i+1
        j = j-1
    }
    return sortedArray
}

func sort012(Array arr:[Int]) -> [Int] {
    var sortedArray:[Int] = []
    return sortedArray
}

print("Sort 0,1 : \(sortBinaryNumber(Array: [0,1,0,1,0,1,0,0,0,1,0]))")

//MARK: - Searching
func findNumberInSortedArray(array:[Int],number:Int) -> Bool {
    return true
}
