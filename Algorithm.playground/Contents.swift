//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// MARK: - Algorithm collection

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

// find duplicate
// x is a item, where 0<x<=n-1
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
                for j in (2...newNumber){
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
print("Prim Numbers : \(getAllPrimes(Between: 1, highestNumber: 1000))")

// factorial
func findFactorial(OfNumber number:Int) -> Int {
    var fact = 1
    for i in 1...number {
        fact = fact*i
    }
    return fact
}

print("Factorial : \(findFactorial(OfNumber: 9))")

// fibanacci series
func findFibannaci(ofNumber number:Int) -> Int {
    // base cases
    if number <= 1 {
        return 1
    }
    // other scenarios
    var i = 2
    var j = 1
    var sum = j
    print("0 \n\(j) \n\(sum)")
    while i<=number {
        let temp = sum
        sum = sum+j
        j = temp
        print("\(sum)")
        i = i+1
    }
    return sum
}

print("Fibanacci : \(findFibannaci(ofNumber: 13))")

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

// find Binary equalent
func findBinary(OfNumber number:Int)-> String{
    // base condition
    if number < 2 {
        return "\(number)"
    }
    // other conditions
    var temp = number
    var finalStr:String = ""
    while temp > 1 {
        let rem = number%2
        finalStr = finalStr + "\(rem)"
        temp = temp/2
    }
   return "\(temp)" + finalStr
}

print("find Binary : \(findBinary(OfNumber: 2))")

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

/// Print string pramid
func printStringPramid() {
    // TODO : Implement Logic here
    /*
     *
     * *
     * * *
     * * * *
     * * * * *
 */
    // 5 rows here. so outer loop iterate 5 times
    // inner loop count will be based on the value from outer loop
    // outer loop : i=1; i<=5; i++
    // inner loop : j=1;j<=i; j++
    for i in 1...5 {
        for _ in 1...i {
            print(("*  "), separator: "", terminator: "")
        }
        print("\n")
    }
}

print("print pramid : \(printStringPramid())")

func printPramid() {
    /*
       reverse order
     */
    for i in 1...5 {
        var j=5
        var k = j-i
        // print Space
        while k>=1 {
            print("  ", separator: "", terminator: "")
            k=k-1
        }
        // print "*"
        for _ in 1...i {
            print(("*" ), separator: "", terminator: "")
        }
        print("") // default "\n"
    }
}

print("Print reverse pramid : \(printPramid())")

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

func findSmallestPairSum(OfArray arr:[Int]) -> Int {
    // left Array
   var minSum = 0
    var minSumNumberCount = 0
    // right array
    var maxSum = 0
    var maxSumNumberCount = 0
    var i = 0
    var j = arr.count - 1
    while i<=j {
        // left sum
        minSum = minSum + arr[i]
        minSumNumberCount = minSumNumberCount + 1
        // right sum
        maxSum = maxSum+arr[j]
        maxSumNumberCount = maxSumNumberCount + 1
        
        if minSum > maxSum {
            minSumNumberCount = minSumNumberCount - 1
            break
        }
        i = i+1
        j = j-1
    }
    
    print("Count : \(minSumNumberCount)")
    return minSumNumberCount
//    var minSum = 0
//    var finalCount = 0
//    var currentMinSum = 0
//    var numberCount = 0
//    for num in arr {
//        let sum = currentMinSum+num
//        if sum < currentMinSum {
//           numberCount = numberCount+1
//           currentMinSum = sum
//        }
//        minSum = min(currentMinSum, minSum)
//        finalCount = numberCount
//    }
//    return (minSum,finalCount)
}

print("Min Sum : \(findSmallestPairSum(OfArray: [5, -2, 3, 8, 6]))")

//print("Find Pair of number mathces sume : \(findPairNumbers(Array: [1,2,3,4,5,6,7,8], sum: 15, sorted: false))")
//print("find pair of sum in unsorted array : \(findPairNumbers(Array: [2,3,1,5,7,11,5,4,54], sum: 9, sorted: false))")
//print("Max Sum : \(findMaximumSum(OfArray: [2,-2,1,2,-5,5]))")

func findGCD(OfNumber number1:Int,OfNumber number2:Int) -> Int {
    if number2 > number1 {
       var rem = 0
       var a = number2
       var b = number1
       while b>0 {
            rem = a%b
            a=b
            b=rem
        }
        return a
    }
    return -1
}

print("GCD of \(2) and \(5) is \(findGCD(OfNumber: 2, OfNumber: 5))")

func findLCM(ofNummber number1:Int, number2:Int) -> Int {
    if number2 > number1 {
        let gcd = findGCD(OfNumber: number1, OfNumber: number2)
        let lcm = (number1*number2)/gcd
        return lcm
    }
    return -1
}

print("LCM of \(2) and \(5) is \(findLCM(ofNummber: 2, number2: 5))")

func rightShiftArray() {
    //TODO : implement a logic
}

func leftShiftArray(arr:[Int], times n:Int) -> [Int] {
    // [1,2,3,4,5] shift this 2 times
    // result should be, [3,4,5,1,2]
    var resultArray:[Int] = []
    // base cases
    if !arr.isEmpty && arr.count > n {
        // algorithm
        // iterate array once
        // replace item at index
        for i in 0..<arr.count {
            let calculatedIndex = i+n
            if calculatedIndex >= arr.count {
               resultArray.append(arr[calculatedIndex - arr.count])
            } else {
               resultArray.append(arr[calculatedIndex])
            }
        }
    }
    return resultArray
}

func printFIZZBUZZ(n:Int) {
    // Algorithm
    // Print FIZZ , if i divided by 3
    // Print BUZZ, if i divided by 5
    // print FIZZBUZZ, if i divided by 3,5
    for i in 1...n {
        if (i%3 == 0) && (i%5 == 0) {
            // print FIZZBUZZ
            print("FIZZBUZZ")
        } else if (i%3 == 0) {
            // print FIZZ
            print("FIZZ")
        } else if (i%5 == 0) {
            // print BUZZ
            print("BUZZ")
        } else {
            // print i
            print("\(i)")
        }
    }
}

print("Left shift Array : \(leftShiftArray(arr: [1,2,3,4,5], times: 2))")
print("Print FIZZBUZZ : \(printFIZZBUZZ(n: 15))")

//MARK: - Strings
func maxOcurranceOfContigiousChar(string:String) -> (count:Int,char:Character?) {
    // TODO : Implement Logic here
    // Algorithm
    // Brute force approach : iterate through nested loops and find each contiguos char count. Time : O(N^2)
    // optimal solution
    var currentCount = 0
    var maxCount = 0
    var maxOccurChar:Character? = nil
    var currentChar:Character? = nil
    var prevChar:Character? = nil
    
    // iterate
    for char in string.characters {
        currentChar = char
        if prevChar == currentChar {
            currentCount = currentCount+1
        }
        // assign Max count
        if maxCount < currentCount {
            maxCount = currentCount
            maxOccurChar = currentChar
        }
        // assign prev char as current char
        prevChar = currentChar
    }
    return (maxCount,maxOccurChar)
}

print("Maximum contiguaous char count : \(maxOcurranceOfContigiousChar(string: "aaabbbcda"))")

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

/// Find given strings are Anagram or not
func isAnagram(str1:String, str2:String) -> Bool {
    //TODO: Implement Logic
    // check both strings has same length, otherwise return false
    
    // Method : 1
    // Sort both strings using best algorithm, Time : O(LOGN)
    // compare both string char by char
    
    // Method : 2
    // Using ASCII char
    // have a new Array of length 26
    // iterate through one string and increament value of that index
    // iterate through second string and decreament value of that index
    // if at any point, value reaches neagative then return false, otherwaise continue iteration
    // end of loop make it true and return the value
    let isAnagram = true
    // implmenent logic
    return isAnagram
}

/// find char count
func charCount(OfString str1:String) -> [Character:Int] {
    var countDict:[Character:Int] = [:]
    for char in str1.characters {
        var val = 1
        if let count = countDict[char] {
            val = count+1
        }
        countDict[char] = val
    }
    return countDict
}

/// find char count needs to be removed from strings to make it anangrams
func charCountForMakingItAnagrams(str1:String, str2:String) -> Int {
    let charCountOfStr1 = charCount(OfString: str1)
    let charCountOfStr2 = charCount(OfString: str2)
    if charCountOfStr1.keys.count == charCountOfStr2.keys.count { // both char keys are same
       var deltaValue = 0
        for key in charCountOfStr2.keys {
            if let count1 = charCountOfStr2[key],
                let  count2 = charCountOfStr1[key] {
                deltaValue = deltaValue + abs(count1-count2)
            }
         }
        return deltaValue
    }
    return -1
}

print("delta Count : \(charCountForMakingItAnagrams(str1: "ADD", str2: "DAS"))")

//MARK: - Sorting
func mySwapFunction<T:Equatable>(Values value1:inout T,value2:inout T) {
    let temp = value1
    value1 = value2
    value2 = temp
}

/*// Sort 0,1
func sortBinaryNumber(Array arr:[Int]) ->[Int] {
    var sortedArray:[Int] = arr
    var i=0
    var j=arr.count - 1
    while i<=j {
        if sortedArray[i] > sortedArray[j] {
            sortedArray[i] = 0
            sortedArray[j] = 1
            i = i+1
            j = j-1
        } else if sortedArray[i] == 1 && sortedArray[j] == 1 {
            j = j-1
        } else if sortedArray[i] == 0 && sortedArray[j] == 0 {
            i = i+1
        } else {
            i = i+1
            j = j-1
        }
    }
    return sortedArray
}

func increament(Value value:Int) -> Int {
    return value+1
}

func sort012(Array arr:[Int]) -> [Int] {
    // keep low,mid,high
    // compare mid and high
    //
    var sortedArray:[Int] = arr
    var low=0,mid = 0,high = arr.count-1
    while mid<=high {
        switch sortedArray[mid]{
        case 0:
            // swap a[mid] and a[low]
            mySwapFunction(Values: &sortedArray[low], value2: &sortedArray[mid])
            // increament value
            low = increament(Value: low)
            mid = increament(Value: mid)
            break
        case 1:
            mid = increament(Value: mid)
            break
        case 2:
            // swap
            mySwapFunction(Values: &sortedArray[mid], value2: &sortedArray[high])
            // increament values
            mid = increament(Value: mid)
            // decreament high
            high = high-1
            break
        default:
            break
        }
    }
    return sortedArray
}

print("Sort 0,1 : \(sortBinaryNumber(Array: [0,1,0,1,0,1,0,0,0,1,0]))")
print("sort 0,1,2: \(sort012(Array: [0,2,1,0,1,2,2,1]))")*/

// Merge Sort
func sortUsingMergeSort(unsortedArray:[Int]) -> [Int] {
   var sortedArray = unsortedArray
//    // do sort the array
//    // base condition
//    if sortedArray.count > 1 {
//       let low = 0
//       let high = sortedArray.count - 1
//       let mid = low+high/2
//       // iterative approach
//        while low<=high {
//            if sortedArray[mid] > sortedArray[high] {
//                mySwapFunction(Values: &sortedArray[mid], value2: &sortedArray[high])
//            } else if sortedArray[mid] < sortedArray[low] {
//                mySwapFunction(Values: &sortedArray[mid], value2: &sortedArray[low])
//            }
//        }
//    }
    return sortedArray
}

//MARK: - Searching
// binary search vs linear search
func findNumber(array:[Int],number:Int) -> Bool {
    // linear search : Time : O(N)
    for n in array {
        if n == number {
            return true
        }
    }
    return false
}

func binarySearchToCheckInSortedArray(array:[Int], Number number:Int,low l:Int,high h:Int) -> Bool {
    // Binary Search : Time :O(LOGN)
    var isPresent = false
    // check the number is present inside array
    let mid = (l+h)/2
    if number == array[mid] { // at Mid position on array
       isPresent = true
    } else if number < array[mid] { // less than mid value
      isPresent = binarySearchToCheckInSortedArray(array: array, Number: number, low: l, high: (mid-1))
    } else if number > array[mid] { // greater than mid value
       isPresent = binarySearchToCheckInSortedArray(array: array, Number: number, low: (mid+1), high: h)
    }
    return isPresent
}

func findNumberUsingBinarySearch(Array arr:[Int], Number number:Int) -> Bool {
    // Base conditions
    if arr.count == 0 {
        return false
    }
    if arr.count == 1 {
        return arr.first == number
    }
    return binarySearchToCheckInSortedArray(array: arr, Number: number, low: 0, high: (arr.count - 1))
}

print("Linear search element : \(findNumber(array: [1,2,3,4,5,6,7], number: 6))")
print("Binary search : \(findNumberUsingBinarySearch(Array: [8], Number: 8))")

// print Two dimentional array in spiral form
func printArrayInSpiralForm() {
    let sampleArray = [[1,2,3,4],[5,6,7,8],[9,0,1,2]]
    // max row pointer and current row pointer
    // max coloumn pointer and current coloumn pointer
    var coloCount = 4
   // var rowCount =
    
    // iterate first row
    var row  = 0
    let rowArray = sampleArray[row]
    for val in rowArray {
        print("\(val)")
    }
    
    // iterate first coloumn
    //var col =
}

