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

//print("factorial using recurion : \(findFactorialUsingRecursion(number: 9))")