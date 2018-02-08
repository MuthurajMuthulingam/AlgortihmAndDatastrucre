//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//MARK: - Recusive approach

// Factorial using recursion
func findFactorialUsingRecursion(number:Int) -> Int {
    if number <= 1 {
        return 1
    }
    return number * findFactorialUsingRecursion(number: (number-1))
}

print("factorial using recurion : \(findFactorialUsingRecursion(number: 9))")

// Fibannaci using recursion
func findFibanacci(number:Int) -> Int {
    // base case
    if number<=1 {
        print("\(number)")
        return 1
    } else {
        let fib = findFibanacci(number: (number-2)) + findFibanacci(number: (number - 1))
        print("\(fib)")
        return fib
    }
}

print("find fiba : \(findFibanacci(number: 6))")

// Fibanacci series by memoization
func findFibanacciUsingMemoization(number:Int, memCache:inout [Int:Int]) -> Int {
    if number <= 1 {
        return number
    } else { // greater than 1
        if let fibValue = memCache[number] { // return stored value
            return fibValue
        } else {
            let fib = findFibanacciUsingMemoization(number: (number-2), memCache: &memCache) + findFibanacciUsingMemoization(number: (number-1), memCache: &memCache)
            memCache[number] = fib
            return fib
        }
    }
}

func fibanacciByMemozation(number:Int) -> Int {
    var memcache = [Int:Int]()
    return findFibanacciUsingMemoization(number: number, memCache: &memcache)
}

print("memcache approach : \(fibanacciByMemozation(number: 10))")
