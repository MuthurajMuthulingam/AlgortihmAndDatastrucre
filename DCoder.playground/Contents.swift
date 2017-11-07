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

func printPower(Number n:Int) {
    for i in 0...n {
        print("\(pow(2, i))", separator: "", terminator: ",")
    }
}

printPower(Number: 5)

func printAllPrimeNumber(FromNumber from:Int,ToNumber to:Int) {
    for i in from...to {
        var isPrime = true
        for j in 2..<i {
            if i%j == 0 {
                isPrime = false
                break
            }
        }
        var message = "is not prime"
        if isPrime {
            message = "is prime"
        }
        print("\(i) \(message)")
    }
}

print("prime Numbers : \(printAllPrimeNumber(FromNumber: 2, ToNumber: 20))")

func countVowels(str:String) -> Int {
    let vowels:[Character] = ["a","e","i","o","u"]
    var count = 0
    for char in str.characters {
        if vowels.contains(char) {
            count += 1
        }
    }
    return count
}

countVowels(str: "aeio")

func modernFibanacci(fromFirst first:Int,Second second:Int,N n:Int) -> Int {
    var j=second
    var sum = first+j
    var k=0
    while(k<(n-3)) {
        let temp = sum
        sum = (sum*sum) + j
        j = temp
        k += 1
    }
    return sum
}

print("Modern Fib : \(modernFibanacci(fromFirst: 0, Second: 1, N: 8))")
