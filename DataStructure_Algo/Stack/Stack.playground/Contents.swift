import Foundation

/*
 Stack Implementation
 **/

struct Stack<T> {
    private var array: [T] = []
    
    mutating func push(_ elem: T) {
        array.append(elem)
    }
    
    mutating func pop() -> T? {
        return array.popLast()
    }
    
    func peek() -> T? {
        return array.last
    }
}

extension Stack: CustomDebugStringConvertible {
    var debugDescription: String {
        let tSeparator: String = "---Top---\n"
        let bSeparator: String = "\n---Bottom---\n"
        let elems = array.map { "\($0)" }.reversed().joined(separator: "\n")
        return tSeparator + elems + bSeparator
    }
}

var myStack = Stack<Int>()

myStack.push(5)
myStack.push(8)
myStack.push(19)
print(myStack)
myStack.peek()
myStack.pop()
print(myStack)
