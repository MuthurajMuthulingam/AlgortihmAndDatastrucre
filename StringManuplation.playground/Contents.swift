//: Playground - noun: a place where people can play

import UIKit
import Foundation

var str = "Hello, playground"

func findTwoChars(InString s:String, count:Int)->Int{
    // base condition
    // count < 2 return 0
    // count == 2 then check both are same, if so return 0 or return 2
    // check alternate char if same
    // check     next char, if different then update second char
    
    // Base cases
    if count < 2{ return 0}
    else if count == 2 {
        if (s.characters.first == s.characters.last) { return 0 }
        return count
    } else { // count > 2
        let iteration:Int = count/3
        let n = 1
        //var i = 0,j=2,k=1
        while n<=iteration {
            
        }
        return 0
    }
}
print("remove : \(findTwoChars(InString: "Muthuraj", count: 8))")

//    func remove(Char c:Character, FromString s:String) -> String{
//        var string = s
//        for index in string.characters {
//            if index == c,let char = string.index(of: index) {
//                string.remove(at: char)
//            }
//        }
//        return string
//    }
//

var numbers:[Double] = []
if let countString = readLine(), let count = Int(countString) {
    var i=0
    while i<count {
        if let numberString = readLine(), let number = Double(numberString) {
            numbers.append(number)
        }
        i = i+1
    }
}
print("Array : \(numbers)")

