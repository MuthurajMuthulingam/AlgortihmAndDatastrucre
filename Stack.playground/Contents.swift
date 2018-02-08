//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//MARK: - Stack
/// Stack using Array
class StackUsingArray<M> {
    private let MAX_LIMIT = 10
    private var top:Int = -1
    private var stack:[M] = []
    
    func push(Item:M) -> Bool {
        // check stack overflow
        if stack.count == MAX_LIMIT {
            return false
        }
        top = top+1
        stack.append(Item)
        return true
    }
    
    func pop() -> M? {
        // check Stack underflow
        if top == -1 {
            return nil
        }
        let item = stack[top]
        stack.remove(at: top)
        top = top-1
        return item
    }
    
    func peak() -> Int {
       return top
    }
}

/// Implement Stack using Array
func stackUsingArray() {
    let s = StackUsingArray<Character>()
    print("Peak : \(s.peak())")
    print("Push : \(s.push(Item: "a"))")
    //print("Peak : \(s.peak())")
    print("Pop : \(s.pop())")
    print("Peak : \(s.peak())")
}

print("Stack using Array : \(stackUsingArray())")

/// Stack using Linked List
//class StackUsingLinkedList {
//    private let MAX_LIMIT = 10
//    private
//}

/// Implement Stack using Linked list
func stackUsingLinkedList() {
    
}

/// Find Symbols are balanced, using Stack
func findSymbolsAreBalancedUsingStack(symbolString:String) -> Bool {
    var isValid = true
    var validOpen:String = "({["
    var validClose:String = ")}]"
    var myStack:StackUsingArray = StackUsingArray()
    // check each char by char
    // compare against open and close chars
    // if open char then push in to stack
    // if close char then pop out of stack
    // after inserting all char check the stack is empty or not
    // if empty then return true, otherwise false
    return isValid
}


