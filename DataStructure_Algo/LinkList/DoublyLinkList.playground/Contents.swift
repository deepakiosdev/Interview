import UIKit
//https://www.raywenderlich.com/947-swift-algorithm-club-swift-linked-list-data-structure
//https://itnext.io/linkedlist-in-swift-code-a-linkedlist-data-structure-in-swift-playgrounds-97fe2ed9b8f1


//Singly linked lists, are linked lists where each node only has a reference to the next node.

/*
Doubly linked lists, are linked lists where each node has a reference to the previous and next node.
You need to keep track of where the list begins and ends. That’s usually done with pointers called head and tail.
*/


// 1
public class Node<T> {
  // 2
  var value: T
  var next: Node<T>?
  weak var previous: Node<T>?

  // 3
  init(value: T) {
    self.value = value
  }
}


// 1. Change the declaration of the Node class to take a generic type T
public class LinkedList<T> {
    // 2. Change the head and tail variables to be constrained to type T
    fileprivate var head: Node<T>?
    private var tail: Node<T>?
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    // 3. Change the return type to be a node constrained to type T
    public var first: Node<T>? {
        return head
    }
    
    // 4. Change the return type to be a node constrained to type T
    public var last: Node<T>? {
        return tail
    }
    
    // 5. Update the append function to take in a value of type T
    public func append(value: T) {
        let newNode = Node(value: value)
        if let tailNode = tail {
            newNode.previous = tailNode
            tailNode.next = newNode
        } else {
            head = newNode
        }
        tail = newNode
    }
    
    // 6. Update the nodeAt function to return a node constrained to type T
    public func nodeAt(index: Int) -> Node<T>? {
        if index >= 0 {
            var node = head
            var i = index
            while node != nil {
                if i == 0 { return node }
                i -= 1
                node = node!.next
            }
        }
        return nil
    }
    
    func insert(value: T, atIndex index: Int) {
        
        let newNode = Node(value: value)
        if index == 0 {
            newNode.next = head
            head?.previous = newNode
            head = newNode
        } else {
            let previousNode = nodeAt(index: index-1)
            let nextNode = previousNode?.next
            
            newNode.previous = previousNode
            newNode.next = nextNode
            previousNode?.next = newNode
            nextNode?.previous = newNode
        }
    }
    
    public func removeAll() {
        head = nil
        tail = nil
    }
    
    // 7. Update the parameter of the remove function to take a node of type T. Update the return value to type T.
    public func remove(node: Node<T>) -> T {
        let prev = node.previous
        let next = node.next
        
        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        next?.previous = prev
        
        if next == nil {
            tail = prev
        }
        
        node.previous = nil
        node.next = nil
        
        return node.value
    }
    
    public func removeAt(_ index: Int) -> T? {
        guard let nodeToRemove = nodeAt(index: index) else { return nil }
        
        return remove(node: nodeToRemove)
    }
    
    public var printList: String {
        var s = "["
        var node = head
        while node != nil {
            s += "\(node!.value)"
            node = node!.next
            if node != nil { s += ", " }
        }
        return s + "]"
    }
    
    public var count: Int {
        guard var node = head else {
            return 0
        }
        
        var count = 1
        while let next = node.next {
            node = next
            count += 1
        }
        return count
    }
}


let dogBreeds = LinkedList<String>()
dogBreeds.append(value: "Labrador")
dogBreeds.append(value: "Bulldog")
dogBreeds.append(value: "Beagle")
dogBreeds.append(value: "Husky")

let numbers = LinkedList<Int>()
numbers.append(value: 5)
numbers.append(value: 10)
numbers.append(value: 15)

print(numbers.printList)
numbers.removeAll()
print(numbers.printList)
