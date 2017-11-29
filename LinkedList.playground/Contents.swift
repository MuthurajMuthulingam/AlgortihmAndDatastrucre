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
            temp = temp?.next
        }
        temp?.next = newNode
    }
    
    func node(ForData data:M) -> Node<M> {
        return Node(data: data)
    }
    
    func isEmpty() -> Bool {
        return head == nil
    }
    
    func getHead() -> Node<M>? {
        return self.head
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
                    temp?.next = temp?.next?.next
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
            next = next?.next
        }
        
        head = prev
    }
    
    func hasCycle() -> Bool {
        var hasCycle = false
        // implement a logic to find a cycle
        if !isEmpty() && head?.next?.data == head?.data { // point to same node
            hasCycle = true
        } else {
            var temp = head
            var forwardTemp = temp?.next?.next
            while forwardTemp != nil {
                if temp?.data == forwardTemp?.data {
                    hasCycle = true
                    break
                }
                temp = temp?.next
                forwardTemp = forwardTemp?.next?.next
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
myLinkedlist.insert(Node: 0)
print("\(myLinkedlist.delete(NodeFromList: 3))")
print("\(myLinkedlist.print())")
print("\(myLinkedlist.reverse())")
print("\(myLinkedlist.print())")
print("\(myLinkedlist.hasCycle())")
/*myLinkedlist.insertAsHead(Node: 0)
print("\(myLinkedlist.isEmpty())")
print("\(myLinkedlist.print())")
print("\(myLinkedlist.findMidValue())")
print("reversed list : \(myLinkedlist.print())")
print("Test")*/

func reverseLinkedListUsingRecursion() {
   // TODO: Complete Logic
}

func mergeSortedLinkedList<T:Comparable>(node1:Node<T>,node2:Node<T>) -> Node<T>? {
    // Base condition
    var newHead:Node<T>? = nil
    var sortedNode:Node<T>? = nil
    var tempNode1:Node<T>? = node1
    var tempNode2:Node<T>? = node2
    if node1.data >= node2.data {
       sortedNode = node2
        tempNode2 = node2.next
    } else {
        sortedNode = node1
        tempNode1 = node2.next
    }
    newHead = sortedNode
    
    while sortedNode != nil {
        if tempNode1 != nil && tempNode2 != nil {
            if (tempNode2?.data)! >= (tempNode1?.data)! {
                sortedNode?.next = tempNode1
                tempNode1 = tempNode1?.next
            } else {
                sortedNode?.next = tempNode2
                tempNode2 = tempNode2?.next
            }
            sortedNode = sortedNode?.next
        } else if tempNode1 == nil {
            sortedNode?.next = tempNode2
            tempNode2 = tempNode2?.next
        } else {
            sortedNode?.next = tempNode1
            tempNode1 = tempNode1?.next
        }
    }
    return newHead
}

func print<T:Comparable>(Node node:Node<T>?) {
    var temp:Node<T>? = node
    while temp != nil {
        print("\(temp?.data)")
        temp = temp?.next
    }
}


let linkedList1 = LinkedList<Int>()
linkedList1.insert(Node: 1)
linkedList1.insert(Node: 2)
let node1 = linkedList1.getHead()

let linkedList2 = LinkedList<Int>()
linkedList2.insert(Node: 3)
linkedList2.insert(Node: 4)
let node2 = linkedList2.getHead()
let mergedList = mergeSortedLinkedList(node1: node1!, node2: node2!)
print("\(print(Node: mergedList))")
