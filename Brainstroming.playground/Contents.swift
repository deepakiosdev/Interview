import UIKit

/************Closure**********/
func testClouser() {
    var clouserArray: [()-> ()] = []
    var i = 0
    
    for _ in 1...5 {
        clouserArray.append {
            print(i)
        }
        i += 1
    }
    
    clouserArray[0]() //5
    clouserArray[3]() //5

}

testClouser()

/*
 Both the commands will print 5. The reason being i Has already been mutated to 5 before the functions are executed.
 */


//////////////////////

func testClouser1() {
    var clouserArray: [()-> ()] = []
    
    for item in 1...5 {
        clouserArray.append {
            print(item)
        }
    }
    
    clouserArray[0]() //1
    clouserArray[3]() //4

}

testClouser1()


var a = 0
var b = 0

let closure = {
    print(a, b)
}

a = 6
b = 9
//closure() // output -: 6 9

/////////////////////
var c = 0
var d = 0

let smartClosure: () -> () = { [c, d]
 print(c, d)
}

c = 8
d = 10
smartClosure() //output -: 8 10

/////////////
var e = 0
var f = 0

let smartClosure1: () -> () = { [e, f] in
 print(e, f)
}

e = 12
f = 14
smartClosure1() //output -: 0 0
/*
 When you enter variables in the just before the keyword 'in', the closure is no longer referencing the original variables Instead, the closure steals that shit and creates its own copy within the closure block.
 */

////////////////
/*
 Question - Have I released my `parentString` from memory or not?

 
 Answer - NO. We have not released the memory of the parent string. Substrings refer to the parent string's memory location until and unless they are explicitly converted to a String. This is the very reas
 */
func testStringMutation() {
    var parentString: String? = "Hello world"
    let subString = parentString?.prefix(6)
    parentString = nil
   // print("testStringMutation: \(parentString)")
    //print("testStringMutation: \(subString)")

}
testStringMutation()

////////////////Tuple Comparision/////////

/*
 Question - Tuple Comparision
 Answer -
 "Tuples are compared from left to right, one value at a time until the comparison finds two values that aren’t equal. Those two values are compared, and the result of that comparison determines the overall result of the tuple comparison.
*/

func tupleComparision() {
    let firstTuple = (1, 5)
    let secondTuple = (3, 2)
    
    print(firstTuple < secondTuple) //true

    let thirdTuple = (4, 19)
    
    print(secondTuple < thirdTuple) // true
    
    print(firstTuple)
}

tupleComparision()


////////////////Retain Cycle/////////

class Master {
  lazy var detail: Detail = Detail.init(master: self)
    
    init() {
        print("Master init")
    }
    
    deinit {
        print("Master deinit")
    }
}

class Detail {
    
    var master: Master? //This create retain cycle to avoid it declare it as weak
    //weak var master: Master?

    init(master: Master) {
        self.master = master
        print("Detail init")
    }
    
    deinit {
        print("Detail deinit")
    }
    
    func testPrint() {
        print("test print")
    }
}

func createMaster() {
    var master: Master = Master()
    var detail = master.detail
   //detail.master = nil
}

createMaster()



var value: Int = 2

let concurrentQueue = DispatchQueue(label: "queue", attributes: .concurrent)

concurrentQueue.async() {
    for i in 0...30 {
        value = i
        print("\(value) ✴️")
    }
}

concurrentQueue.async {
    print(value)
}

concurrentQueue.async() {
    for i in 0...50 {
        value = i
        print("\(value) Deepak")
    }
}

//All the above task will finished then this block will start and when this will execute no other task will execute in this queue
concurrentQueue.async(flags: .barrier) {
    for j in 4...6 {
        value = j
        print("\(value) ✡️")
    }
}

concurrentQueue.async {
    value = 14
    print(value)
}
