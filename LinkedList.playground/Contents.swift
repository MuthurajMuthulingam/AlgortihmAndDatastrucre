//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// MARK: - Linked List
// Node class
class Node<M:Comparable> {
    var data:M
    var next:Node<M>?
    
    init(data:M) {
        self.data = data
    }
}

class LinkedList<M:Comparable> {
    private var head:Node<M>?
    
    func insertAsHead(Node data:M) {
        let newNode = node(ForData: data)
        // Always insert at beginning, Time : O(1)
        // List is empty, insert it as head
        if head == nil {
            head = newNode
            return
        }
        // else, insert always at beginning
        let temp = head
        head = newNode
        head?.next = temp
    }
    
    func insert(Node data:M) {
        // Time : O(N)
        // This will traverse till end of Linkedlist and then insert a node at EOL
        // hence the Time required  : O(N)
        let newNode = node(ForData: data)
        if head == nil {
            head = newNode
            return
        }
        // As second node
        var temp = head
        if  temp?.next == nil {
            temp?.next = newNode
            temp = temp?.next
            return
        }
        // traverse to last node at Linkedlist
        while temp?.next != nil {
            temp = head?.next
        }
        temp?.next = newNode
    }
    
    func node(ForData data:M) -> Node<M> {
        return Node(data: data)
    }
    
    func isEmpty() -> Bool {
        return head == nil
    }
    
    func delete(NodeFromList data:M) -> Bool {
        var isSuccess = false
        if !isEmpty() && head?.next == nil,
            let headNodeData = head?.data,
            headNodeData == data { // consist only one node
            head = nil
            isSuccess = true
        } else {
            var temp = head
            while temp != nil {
                if let dataFromNextNode = temp?.next?.data,
                    data == dataFromNextNode {
                    // make it nil when you find a data
                    temp?.next = nil
                    isSuccess = true
                    break
                }
                temp = temp?.next
            }
        }
        return isSuccess
    }
    
    func findMidValue() -> M? {
        // base condition
        if isEmpty() {
           return nil
        } else if head?.next == nil {
            return head?.data
        } else {
           var temp = head
           var forwardTemp = temp?.next?.next
            while forwardTemp != nil {
                temp = temp?.next
                forwardTemp = forwardTemp?.next?.next
            }
            if forwardTemp == nil {
                return temp?.data
            }
        }
        return nil
    }
    
    func reverse() {
        // base condition
        // consist only one node or Empty
        if isEmpty() || (head?.next == nil) {
            return
        }
        
        // Initial values
        var prev:Node<M>? = nil
        var current:Node<M>? = head
        var next:Node<M>? = head?.next
        
        while current != nil {
            current?.next = prev
            prev = current
            current = next
            next = current?.next
        }
        
        head = current
    }
    
    func hasCycle() -> Bool {
        var hasCycle = false
        // Algorithm
        // iterate one head at one node per itereation
        // second head as two node per iteration
        // if second head points to nil at some point then return NO
        // if at any point first and second head points to same node then return YES
        if !isEmpty(),head?.next != nil  {
            if head?.data == head?.next?.data {
                // refers to same node
                hasCycle = true
            }
            var firstHead = head
            var secondHead = head?.next?.next
            while secondHead != nil {
                if firstHead?.data == secondHead?.data {
                   hasCycle = true
                    break
                }
                
                firstHead = firstHead?.next
                secondHead = secondHead?.next?.next
            }
        }
        return hasCycle
    }
    
    func print() {
        if head == nil {
            debugPrint("LinkedList is Empty")
            return
        }
        var temp = head
        while temp != nil {
            debugPrint("\(temp?.data)")
            temp = temp?.next
        }
    }
}

let myLinkedlist = LinkedList<Int>()
myLinkedlist.insert(Node: 0)
myLinkedlist.insertAsHead(Node: 1)
myLinkedlist.insert(Node: 2)
myLinkedlist.insert(Node: 3)
myLinkedlist.insert(Node: 4)
print("\(myLinkedlist.print())")
print("Has Cycle : \(myLinkedlist.hasCycle())")

func findCycleInLinkedList() {
    
}

func reverseLinkedListUsingRecursion() {
    
}
