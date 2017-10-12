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
