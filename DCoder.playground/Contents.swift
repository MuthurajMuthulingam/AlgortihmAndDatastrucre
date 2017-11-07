//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


/// print Tables
func printTable(Number n:Int) {
    var sum = 0
    for _ in 0...10 {
        sum = sum+n
        print(sum)
    }
}

print("Table : \(printTable(Number: 10))")

func isTriangleEqualable(Base b:Int, Height h:Int, Side s:Int) -> Bool {
    // sum = b+h+h
    // area = (b*h)/2
    // if sum == area return true else false
    let sum = b+h+s
    let area = (b*h)/2
    return (sum == area)
}

print("\(isTriangleEqualable(Base: 6, Height: 8, Side: 10))")

func isLoveOrHate(Number n1:Int, Number n2:Int) {
    if (abs(n1-n2) == 6) || (abs(n1+n2) == 6){
        print("Love")
    } else {
        print("Hate")
    }
}

print("\(isLoveOrHate(Number: 3, Number: 3))")

func countMatches(ForTeams n:Int) -> Int {
    // each team play twice against other team
    if n>=2{
        return n*(n-1)
    }
    return n
}

print("\(countMatches(ForTeams: 100))")

func findArea(Radius r:Double) ->Double {
    return 3.14*r*r
}

print(findArea(Radius: 5))

func binaryToDecimal(binaryValueString s:String) -> Int {
    var finalValue = 0
    for (index,char) in s.characters.reversed().enumerated() {
        if let charNumber = Int("\(char)"), charNumber == 1 {
           finalValue += Int(pow(2, Double(index)))
        }
    }
    return finalValue
}
let binaryNumberString = "1111"
print("binary to decimal : \(binaryNumberString) => \(binaryToDecimal(binaryValueString: binaryNumberString))")

func decimalToBinary(decimalNumber number:Int) -> String {
    var finalString = ""
    var temp = number
    while temp>1 {
        let remainder = temp%2
        finalString += "\(remainder)"
        temp /= 2
    }
    finalString += "\(temp)"
    let reversed:[Character] = finalString.characters.reversed()
    finalString = "\(reversed)"
    return finalString
}

let number = 10
print("Decimal to binary : \(number) => \(decimalToBinary(decimalNumber: number))")

func findFirstUniqueNumber()  {
    //TODO: Implement Logic
}
