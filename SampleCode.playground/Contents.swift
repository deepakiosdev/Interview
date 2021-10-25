import UIKit

/*
 https://medium.com/swiftcommmunity/what-do-mean-escaping-and-nonescaping-closures-in-swift-d404d721f39d#:~:text=Closures%20are%20self%2Dcontained%20blocks,and%20used%20in%20your%20code.&text=x%2C%20closure%20parameter%20was%20%40escaping,In%20Swift%203.
 Escaping and Non Escaping Closure
 */

class NonEscapingClosureTest {
    
    func getSumOf(array:[Int], handler: ((Int)->Void)) {
        //step 2
        var sum: Int = 0
        for value in array {
            sum += value
        }
        
        //step 3
        handler(sum)
    }
    
    func doSomething() {
        //setp 1
        self.getSumOf(array: [1,2,3]) { (sum) in
            print("Non EscapingClosure sum:\(sum)")
            //step 4, finishing the execution
        }
    }
}

let nonEscapingClosureTest = NonEscapingClosureTest()

nonEscapingClosureTest.doSomething()


class EscapingClosureTest {
    
    var complitionHandler: ((Int)->Void)?
    
    func getSumOf(array:[Int], handler: @escaping ((Int)->Void)) {
        //step 2
        //here I'm taking for loop just for example, in real case it'll be something else like API call
        var sum: Int = 0
        for value in array {
            sum += value
        }
        //step 3
        self.complitionHandler = handler
        self.complitionHandler!(sum) //Can use like this
    }
    
    func doSomething() {
        //setp 1
        self.getSumOf(array: [1,2,3]) { (sum) in
            print("Storage EscapingClosure sum:\(sum)")
            //step 4, finishing the execution
        }
    }
    
    func printClosureResult() {
        complitionHandler!(20)
        if let closure = complitionHandler {
            closure(111)
        }
    }
    
}

let escapingClosureTest = EscapingClosureTest()

escapingClosureTest.doSomething()
escapingClosureTest.printClosureResult()

class AsyncEscapingClosureTest {
    
    var sum: Int = 0

    func getSumOf(array:[Int], handler: @escaping ((Int)->Void)) {
        //step 2
        for value in array {
            sum += value
        }
        //step 3
       
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            handler(self?.sum ?? 0)
        }
        
    }
    
    func doSomething() {
        //setp 1
        self.getSumOf(array: [0,1,2]) { (sum) in
            print("Async EscapingClosure sum:\(sum)")
            //step 4, finishing the execution
        }
    }
}

let asyncEscapingClosureTest = AsyncEscapingClosureTest()
asyncEscapingClosureTest.doSomething()

//////////////Hashable/////////////////////


/*
 Hashable
 
 */

struct iPad: Hashable {
    var serialNumber: String
    var capacity: Int
}

func testHashable() {
    let iPad1 = iPad.init(serialNumber: "1", capacity: 4)
    let iPad2 = iPad.init(serialNumber: "1", capacity: 64)

    if iPad1 == iPad2 {
        print("Equal")
    }
    print("iPad1.hashValue:\(iPad1.hashValue)")
    print("iPad2.hashValue:\(iPad2.hashValue)")
}

testHashable()


///////////Capture List//////////////


var thing = "cars"

let closure = { [thing] in
  print("I love \(thing)")
}

thing = "airplanes"

closure()  // I love cars

////
/*
 The capture list creates a copy of thing when you declare the closure. This means that captured value doesn't change even if you assign a new value to thing.
 If you omit the capture list in the closure, then the compiler uses a reference instead of a copy. Therefore, when you invoke the closure, it reflects any change to the variable. You can see this in the following code:
 */
var thing1 = "cars"

let closure1 = {
  print("I love \(thing1)")
}

thing1 = "airplanes"

closure1() // Prints: "I love airplanes"


///////////Value type test//////////////

var array1 = [1, 2, 3, 4, 5]
var array2 = array1
array2.append(6)
var len = array1.count

