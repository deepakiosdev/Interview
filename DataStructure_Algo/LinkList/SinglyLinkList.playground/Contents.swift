
import Foundation

//https://github.com/bizz84/CrackingTheCodingInterview/blob/master/CrackingTheCodeInterview.playground/Sources/Chapter2.swift

//////////////LeetCode/////////////////

 //* Definition for singly-linked list.
  public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init() { self.val = 0; self.next = nil; }
      public init(_ val: Int) { self.val = val; self.next = nil; }
      public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    
    func description(_ headN: ListNode?) {
        var string = ""
        var headNode = headN
        while headNode != nil {
            if string.isEmpty {
                string = "\(String(describing: headNode!.val))"
            } else {
                string += " -> \(String(describing: headNode!.val))"
            }
            headNode = headNode?.next
        }
        print("LinkList: \(string)")
    }
    
  }

/*
 https://leetcode.com/problems/remove-duplicates-from-sorted-list/
 
 83. Remove Duplicates from Sorted List
 Easy

 3313

 160

 Add to List

 Share
 Given the head of a sorted linked list, delete all duplicates such that each element appears only once. Return the linked list sorted as well.

  

 Example 1:


 Input: head = [1,1,2]
 Output: [1,2]
 Example 2:


 Input: head = [1,1,2,3,3]
 Output: [1,2,3]
  

 Constraints:

 The number of nodes in the list is in the range [0, 300].
 -100 <= Node.val <= 100
 The list is guaranteed to be sorted in ascending order.
 */

func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    var current = head?.next
    var previous = head
    
    while current != nil {
        
        if current?.val == previous?.val {
            previous?.next = current?.next
        } else {
            previous = current
        }
        current = current?.next
    }
    return head
}

/*
 https://leetcode.com/problems/remove-duplicates-from-sorted-list-ii/
 82. Remove Duplicates from Sorted List II
 Medium

 3618

 132

 Add to List

Given the head of a sorted linked list, delete all nodes that have duplicate numbers, leaving only distinct numbers from the original list. Return the linked list sorted as well.

 Example 1:

 Input: head = [1,2,3,3,4,4,5]
 Output: [1,2,5]
 Example 2:


 Input: head = [1,1,1,2,3]
 Output: [2,3]
  

 Constraints:

 The number of nodes in the list is in the range [0, 300].
 -100 <= Node.val <= 100
 The list is guaranteed to be sorted in ascending order.
 */

func deleteDuplicates1(_ head: ListNode?) -> ListNode? {
   return nil
}


//https://leetcode.com/problems/middle-of-the-linked-list/

func middleNode(_ head: ListNode?) -> ListNode? {
    if head == nil {
        return head
    }
    
    var fast: ListNode? = head
    var slow: ListNode? = head
    
    while fast != nil && fast?.next != nil {
        fast = fast?.next?.next
        slow = slow?.next
    }
    return slow
}

//https://leetcode.com/problems/linked-list-cycle/
func hasCycle(_ head: ListNode?) -> Bool {
    if head == nil {
        return false
    }
    
    var fast: ListNode? = head
    var slow: ListNode? = head
    
    while fast != nil && fast?.next != nil {
        fast = fast?.next?.next
        if slow === fast {
            return true
        }
        slow = slow?.next
    }
    return false
}


//https://leetcode.com/problems/linked-list-cycle-ii/submissions/
//Not working need to solve
func detectCycle(_ head: ListNode?) -> ListNode? {
    if head == nil {
        return head
    }
    
    var fast: ListNode? = head
    var slow: ListNode? = head
    
    while fast != nil && fast?.next != nil {
        fast = fast?.next?.next
        if slow === fast {
            slow?.next = nil
            return slow
        }
        slow = slow?.next
    }
    return nil
}


func linkListLength(_ head: ListNode?)-> Int {
    var headNode = head
    var length = 0
    
    while headNode != nil {
        length += 1
        headNode = headNode?.next
    }
    return length
}

//https://leetcode.com/problems/intersection-of-two-linked-lists/
//https://www.youtube.com/watch?v=8CACsqPWpHo
func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
    
    var nodeA: ListNode? //Bigger node
    var nodeB: ListNode?
    
    let lenghtOfListA = linkListLength(headA)
    let lenghtOfListB = linkListLength(headB)
    var lengthDiff = 0
    
    if lenghtOfListA > lenghtOfListB {
        lengthDiff = lenghtOfListA - lenghtOfListB
        nodeA = headA
        nodeB = headB
        
    } else {
        lengthDiff = lenghtOfListB - lenghtOfListA
        nodeA = headB
        nodeB = headA
    }
    
    while lengthDiff != 0 {
        
        if nodeA == nil {
            return nil
        }
        
        nodeA = nodeA?.next
        lengthDiff -= 1
    }
    
    
    while nodeA != nil && nodeB != nil {
        
        if nodeB === nodeA {
            return nodeA
        }
        nodeA = nodeA?.next
        nodeB = nodeB?.next
    }
    
    return nil
}


//////////////////////

class Node<T> {
    var value: T
    var next: Node?
    
    init(_ value: T) {
        self.value = value
    }
}

/*
extension Node: CustomStringConvertible {
   
    var description: String {
        
        var headNode:Node? = self
        var str = ""
        while headNode != nil {
            if str.isEmpty {
                str += "\(headNode!.value)"
            } else {
                str += "-> \(headNode!.value)"

            }
            headNode = headNode?.next
        }
        return str
    }
}
*/

class LinkList<T> {
    
    var head: Node<T>?
    var tail: Node<T>?

    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first: Node<T>? {
        return head
    }
    
    static func from(array: [Int]) -> LinkList<T>? {
        let ll = LinkList<T>()
        for item in array {
            ll.insert(item as! T)
        }
      return ll
    }
    
    var count: Int {
        var length = 0
        var headNode = head
        while headNode != nil {
            length += 1
            headNode = headNode?.next
        }
        return length
    }

    @discardableResult
    func append(_ value: T)-> Node<T>? {
        let newNode = Node(value)

        if var headNode = head {
            while headNode.next != nil {
                headNode = headNode.next!
            }
            headNode.next = newNode
        } else {
            head = newNode
        }
        return newNode
    }
    
    
    //OR//Have doubt in this method
    func insert(_ value: T) {
        
        let newNode = Node.init(value)
        if let tail = tail {
            tail.next = newNode
        } else {
            head = newNode
        }
        tail = newNode
    }
    
    func insert(at index: Int, value: T) {
        let newNode = Node(value)

        if index == 0 {
            newNode.next = head
            head = newNode
        } else {
            var previousNode = head
            var localIndex = 0

            while previousNode != nil {
                
                if localIndex == index - 1 {
                    newNode.next = previousNode?.next
                    previousNode?.next = newNode
                    break
                }
                localIndex += 1
                previousNode = previousNode?.next!
            }
        }
       
    }
    
    func delete(at index: Int) {
        
        if isEmpty || index >= self.count {
            print("Could not delete")
            return
        }

        if index == 0 {
            head = head?.next
        } else {
            var headNode = head
            var localIndex = 0

            while headNode != nil {
                
                if localIndex == index - 1 {
                    headNode?.next = headNode?.next?.next
                    return
                }
                localIndex += 1
                headNode = headNode?.next!
            }
        }
    }
    

    public func removeAll() {
        head = nil
        tail = nil
    }
    
    func nodeAtIndex(_ index: Int) -> Node<T>? {
        
        guard index > -1 && index < self.count else {
            print("Invalid index node could not found at:\(index)")
            return nil
        }
        
        var headNode = head
        var localIndex = 0
        
        while headNode != nil {
            if localIndex == index {
                return headNode
            }
            
            headNode = headNode?.next
            localIndex += 1
        }
        return nil
    }
    
    func description(_ headN: Node<T>?) {
        var string = ""
        var headNode = headN
        while headNode != nil {
            if string.isEmpty {
                string = "\(String(describing: headNode!.value))"
            } else {
                string += " -> \(String(describing: headNode!.value))"
            }
            headNode = headNode?.next
        }
        print("LinkList: \(string)")
    }
 
}

extension LinkList {
    
    //https://www.geeksforgeeks.org/reverse-first-k-elements-given-linked-list/
    func reverseLinklist() {
        
        var headNode:Node<T>? = head
        var tail: Node<T>?
        
        while headNode != nil {
            let nextNode = headNode?.next
            headNode?.next = tail
            tail = headNode
            headNode = nextNode
        }
        head = tail
    }
    
    //https://www.youtube.com/watch?v=SX5zx4cPLoM
    //https://www.geeksforgeeks.org/reverse-even-elements-in-a-linked-list/
   
    func reverseEvenIndexElement() {
        
        var odd: Node<T>? = head
        
        // If linklist have less than 3 elements nothing need to be done.
        if odd == nil || odd?.next == nil || odd?.next?.next == nil {
            return
        }
        
        var even: Node<T>?

        while odd?.next != nil {
            let nextNode = odd?.next
            odd?.next = nextNode?.next
            
            nextNode?.next = even
            even = nextNode
            
            odd = odd?.next
        }

        //print("even:\(description(even))")
        //print("head:\(description(head))")

       odd = head
        while even != nil {
            //Store the even next node in temp variable
            let temp = even?.next
            
            //Insert the even node b/w two odd nodes
            even?.next = odd?.next
            odd?.next = even
            
            //Move the head to the next odd node
            odd = odd?.next?.next
            even = temp

        }
        print("reverseEvenIndexElement----:\(description(head))")
    }
    
    func reverseFirstKElement(_ k: Int) {
        
        var tempNode:Node<T>? = head
        var count = 0
        
        while tempNode != nil {
            count += 1
            if count == k {
                break
            }
            tempNode = tempNode?.next
        }
        let jointPoint = tempNode?.next
        tempNode?.next = nil

        //Reverse first K element
        var reverseLinkList: Node<T>?
        var headNode:Node<T>? = head
        
        while headNode != nil {
            let next = headNode?.next
            headNode?.next = reverseLinkList
            reverseLinkList = headNode
            headNode = next
        }
        head = reverseLinkList
        
        while reverseLinkList?.next != nil {
            reverseLinkList = reverseLinkList?.next
        }
        reverseLinkList?.next = jointPoint
 
        print("2-----head?.description:\(description(head)))")
    }
    
    //https://leetcode.com/problems/odd-even-linked-list/submissions/
    func oddEvenList() {
        
        var odd: Node<T>? = head
        
        // If linklist have less than 2 elements nothing need to be done.
        if odd == nil || odd?.next == nil {
            return
        }
        
        var even: Node<T>?

        while odd?.next != nil {
            let nextNode = odd?.next
            odd?.next = nextNode?.next
            
            nextNode?.next = even
            even = nextNode
            
            odd = odd?.next
        }
        
        //reverse even nodes
        var reverseEvenNodes: Node<T>?
        var evenHead: Node<T>? = even
        while evenHead != nil {
            let nextNode = evenHead?.next
            
            evenHead?.next = reverseEvenNodes
            reverseEvenNodes = evenHead
            
            evenHead = nextNode
        }
        
        even = reverseEvenNodes
        var temp :Node<T>? = head
        while temp?.next != nil {
            temp = temp?.next
        }
        temp?.next = even
        
        print("oddEvenList:\(description(head))")
    }
    
    //Avove solution is fine
    func oddEvenList1() {
        
        var odd: Node<T>? = head
        
        // If linklist have less than 2 elements nothing need to be done.
        if odd == nil || odd?.next == nil {
            return
        }
        
        var even: Node<T>?

        while odd?.next != nil {
            let nextNode = odd?.next
            odd?.next = nextNode?.next
            odd?.next = nextNode?.next
            
            if even == nil {
                nextNode?.next = even
                even = nextNode
            } else {
                nextNode?.next = nil
                var evNode = even
                while evNode?.next != nil {
                    evNode = evNode?.next
                }
                evNode?.next = nextNode
            }
            
            odd = odd?.next
        }
        description(even)
       
        var temp :Node<T>? = head
        while temp?.next != nil {
            temp = temp?.next
        }
        temp?.next = even
        //description(head)
    }
    
    func findMiddle() -> Node<T>? {
        
        if head == nil {
            return head
        }
        
        var fast: Node<T>? = head
        var slow: Node<T>? = head
        
        while fast != nil && fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }
        return slow
    }
}

//Cycle
extension LinkList {
    
    func createCycle(at postion: Int) -> Bool{
        var headNode:Node<T>? = head
        var cyclicNode:Node<T>?
        var count = 1
        
        while headNode?.next != nil {
            
            if count == postion {
                cyclicNode = headNode
            }
            headNode = headNode?.next
            count += 1
        }
        headNode?.next = cyclicNode
        print("Cycle created")
        return true
    }
    
    func createCycle1(at index: Int) {
        
        let cyclicNode = self.nodeAtIndex(index)
        var headNode = head
        while headNode?.next != nil {
            headNode = headNode?.next
        }
        headNode?.next = cyclicNode
    }
    
    func hasCycle() -> Bool {
        
        if head == nil {
            return false
        }
        
        var slow:Node<T>? = head
        var fast:Node<T>? = head
        
        while fast != nil && fast?.next != nil {
            
            slow = slow?.next
            fast = fast?.next?.next
            if slow === fast {
                return true
            }
        }
        
        return false
    }
    
    
    //Not working need to be fix
    func removeCycle() {
        
        var isCycleExist = false
        
        var fastNode = head
        var slowNode = fastNode
        fastNode = fastNode?.next
        
        while fastNode?.next != nil {
            
            if slowNode === fastNode {
                isCycleExist = true
                print("Cycle detected... at value: \(String(describing: slowNode?.value))")
                break
            }
            fastNode = fastNode?.next?.next
            slowNode = slowNode?.next
        }
        
        if !isCycleExist {
            print("Cycle does not exist")
            return
        }
        
        fastNode = head
        
        while fastNode != nil {
            slowNode = slowNode?.next
            if slowNode === fastNode {
                fastNode?.next = nil
                print("Cycle broken for :\(String(describing: slowNode?.value))")
                break
            }
            fastNode = fastNode?.next
        }
    }
    
}

let cyclicLL = LinkList<Int>()
cyclicLL.append(10)
cyclicLL.append(20)
cyclicLL.append(30)
cyclicLL.append(40)
cyclicLL.append(50)
cyclicLL.append(60)
//cyclicLL.insert(at: 3, value: 40)
//cyclicLL.insert(at: 4, value: 50)
//cyclicLL.insert(at: 5, value: 60)

//ll.reverseLinkList()
//ll.reverseEvenIndex()
//ll.reverseEvenIndexAndMoveToEnd()
//print(ll.nodeAtIndex(0)?.value)

cyclicLL.createCycle(at: 3)
print(cyclicLL.hasCycle())
cyclicLL.removeCycle()
//cyclicLL.description()





/*

let linkList = LinkList<Int>()

linkList.append(4)
linkList.append(2)
linkList.append(5)
linkList.append(1)

linkList.description()

linkList.append(7)
linkList.append(9)
linkList.description()
linkList.insert(at: 2, value: 40)
linkList.insert(at: 1, value: 00)
linkList.insert(at: 0, value: 10)
linkList.description()
print("Length of Link list:\(linkList.count)")
print("delete operation")
linkList.delete(at: 9)
//linkList.delete(at: 1)
linkList.description()
linkList.removeAll()
linkList.description()

*/

let ll = LinkList<Int>()
ll.append(10)
ll.append(20)
ll.append(30)
ll.append(40)
ll.append(50)
ll.append(60)
ll.append(70)
//ll.insert(at: 5, value: 0)
//ll.insert(at: 2, value: 3)
//ll.description
//ll.delete(at: 8)
//ll.description()
ll.reverseEvenIndexElement()
//ll.reverseLinklist()
//ll.reverseFirstKElement(3)
//ll.oddEvenList()
//ll.description()

