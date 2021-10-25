import UIKit

class MinMaxStack {
    
    var minMaxStack = [[String: Int]]()
    var stack = [Int]()
    
    func peek() -> Int? {
        return stack.last
    }
    
    func pop() -> Int? {
        minMaxStack.popLast()
        return stack.popLast()
    }
    
    func push(number: Int) {
        var newMinMax = ["min": number, "max": number]
        
        if let lastMinMax = minMaxStack.last {
            //            newMinMax["min"] = min(lastMinMax["min"]!, newMinMax["min"]!)
            //            newMinMax["max"] = max(lastMinMax["max"]!, newMinMax["max"]!)
            newMinMax["min"] = min(lastMinMax["min"]!, number)
            newMinMax["max"] = max(lastMinMax["max"]!, number)
        }
        minMaxStack.append(newMinMax)
        stack.append(number)
    }
    
    func getMin() -> Int? {
        return minMaxStack.last?["min"]
    }
    
    func getMax() -> Int? {
        return minMaxStack.last?["max"]
    }
}

var minMaxStack: MinMaxStack = MinMaxStack()
minMaxStack.push(number: 10)
minMaxStack.push(number: 3)
minMaxStack.push(number: 20)
print(minMaxStack.stack)
print(minMaxStack.getMax()!)
print(minMaxStack.getMin()!)


///https://leetcode.com/problems/min-stack/
///T - O(1), S - O(N)
class MinStack {
    
    var minStack = [Int]()
    var stack = [Int]()
    
    func push(_ x: Int) {
        stack.append(x)
        if minStack.isEmpty || x <= minStack.last! {
            minStack.append(x)
        }
        
    }
    
    func pop() {
        guard !stack.isEmpty else {
            return
        }
        
        let removedElem = stack.popLast()
        
        if let last = minStack.last, last == removedElem {
            minStack.popLast()
        }
    }
    
    func top() -> Int {
        return stack.isEmpty ? -1 : stack.last!
        
    }
    
    func getMin() -> Int {
        return minStack.isEmpty ? -1 : minStack.last!
    }
}



