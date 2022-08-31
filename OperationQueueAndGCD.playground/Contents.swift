import UIKit
import Foundation

//===============================
class MyOperation: Operation {
    
    override func main() {
        
      if isCancelled {
        return
      }
    }
}

class OperationQueueVsGCD {
    
    let operationQueue: OperationQueue = {
     var queue = OperationQueue()
     queue.name = "Download queue"
     queue.maxConcurrentOperationCount = 2 //This is unique feture as compare to GCD
     return queue
   }()

    
    func opeationQueuesMethods() {
        operationQueue.isSuspended = true
        operationQueue.qualityOfService = .default
        operationQueue.cancelAllOperations()
        
        //methods
        operationQueue.isSuspended
        operationQueue.operationCount
        operationQueue.progress

    }
  
    func opeationMethods() {
        ///
        let operation = MyOperation()
        operation.qualityOfService = .default
        operation.cancel()
        
        //State monitoring, This is unique feture as compare to GCD
        operation.isReady
        operation.isExecuting
        operation.isFinished
        operation.isCancelled
        
        //Add and remove dependency
        let anotherOp = MyOperation()
        anotherOp.addDependency(operation)
        anotherOp.removeDependency(operation)
        
    }
   
    func methodsOfGCD() {
        
        let concurrentQueue = DispatchQueue.init(label: "MyQueue", qos: .background, attributes: .concurrent)
        
        
        //Suspend and resume Like this
        concurrentQueue.suspend()
        concurrentQueue.resume()
        
        //Can cancel using DispatchWorkItem
        let workItem = DispatchWorkItem {
            print("Do something")
        }
        concurrentQueue.async(execute: workItem)
        workItem.cancel()
        
        //Add dependency like this.
        //Operation 1
        concurrentQueue.async(flags: .barrier) {
            print("Operation1")
        }

        //Operation 2
        concurrentQueue.async(flags: .barrier) {
            print("Operation2")
        }

        //Operation 3.
        //Operation 3 have dependency on Operation1 and Operation2. Once 1 and 2 will finish will execute Operation 3. Here operation queue work as a serial queue.
        concurrentQueue.async(flags: .barrier) {
            print("Operation3")

        }

    }
   
}

////////NSOperationQueue//////////////

//Add dependecy in Operation Queue

//Third operation should start after finish first two

func testOperationQueueDependency() {
    let operation1 = BlockOperation {
        print("Operation 1 is starting")
        Thread.sleep(forTimeInterval: 1)
        print("Operation 1 is finishing")
    }

    let operation2 = BlockOperation {
        print("Operation 2 is starting")
        Thread.sleep(forTimeInterval: 1)
        print("Operation 2 is finishing")
    }


    let operation3 = BlockOperation {
        print("Operation 3 is starting")
        Thread.sleep(forTimeInterval: 1)
        print("Operation 3 is finishing")
    }


    operation3.addDependency(operation1)
    operation3.addDependency(operation2)


    print("Adding operations")
    let queue = OperationQueue()
    queue.addOperation(operation1)
    queue.addOperation(operation2)
    queue.addOperation(operation3)
    queue.waitUntilAllOperationsAreFinished()
    print("Done!")
}

testOperationQueueDependency()


//===========================================

/*
 https://gist.github.com/Sorix/57bc3295dc001434fe08acbb053ed2bc
 https://stackoverflow.com/questions/1049001/get-notification-when-nsoperationqueue-finishes-all-tasks
 https://medium.com/shakuro/nsoperation-and-nsoperationqueue-to-improve-concurrency-in-ios-e31ee79c98ef
 https://www.appcoda.com/ios-concurrency/
 https://www.raywenderlich.com/5293-operation-and-operationqueue-tutorial-in-swift
 
 https://developer.apple.com/documentation/foundation/nsoperationqueue
 https://developer.apple.com/documentation/foundation/nsoperationqueue/3172535-progress?language=objc
 https://developer.apple.com/documentation/foundation/nsprogress/1410940-totalunitcount?language=objc
 
 */

class MyOperationQueue: OperationQueue {
            
    public var numberOfOperations: Int = 0 {
        didSet {
            //print("numberOfOperations:\(numberOfOperations)")

            if numberOfOperations == 0 {
                print("++++++++++All operations completed++++++++++")
                NotificationCenter.default.post(name: .init("MyOperationQueueOperationsCompleted"), object: nil)
            }
        }
    }
    
    public var isEmpty: Bool {
        return numberOfOperations == 0
    }
    
    override func addOperation(_ op: Operation) {
        super.addOperation(op)
        
        numberOfOperations += 1
    }
    
    override func addOperations(_ ops: [Operation], waitUntilFinished wait: Bool) {
        super.addOperations(ops, waitUntilFinished: wait)
        
        numberOfOperations += ops.count
    }
    
    public func decrementOperationCount() {
        numberOfOperations -= 1
    }
}

class AsyncOperation: Operation {
    
    let queue: MyOperationQueue

    enum State: String {
        case Ready, Executing, Finished
        
        fileprivate var keyPath: String {
            return "is" + rawValue
        }
    }
    
    var state = State.Ready {
        willSet {
            willChangeValue(forKey: newValue.keyPath)
            willChangeValue(forKey: state.keyPath)
        }
        
        didSet {
            print("Current state:\(state)")
            didChangeValue(forKey: oldValue.keyPath)
            didChangeValue(forKey: state.keyPath)
            
            if state == .Finished {
                queue.decrementOperationCount()
            }
        }
    }
    
    override var isReady: Bool {
        return super.isReady && state == .Ready
    }
    
    override var isExecuting: Bool {
        return state == .Executing
    }
    
    override var isFinished: Bool {
        return state == .Finished
    }
    
    override var isAsynchronous: Bool {
        return true
    }
    
    public init(queue: MyOperationQueue) {
        self.queue = queue
        super.init()
    }
    
//    override func start() {
//        if isCancelled {
//            state = .Finished
//            return
//        }
//
//        main()
//        state = .Executing
//    }
//
    override func start() {
        if self.isCancelled {
            state = .Finished
        } else {
            state = .Ready
            main()
        }
    }

    override func cancel() {
        state = .Finished
    }
    
     func finished() {
        state = .Finished
    }
    
    override func main() {
        if self.isCancelled {
            state = .Finished
        } else {
            state = .Executing
        }
        // fatalError("Subclasses must override main without calling super.")
    }
}

extension AsyncOperation {

    func printNumber(_ number: Int) {
        DispatchQueue.global(qos: .userInitiated).asyncAfter(deadline: .now() + 0.1) {
            print("number:\(number)")
            self.finished()
        }
    }
    
}


class MyOperationQueueTest {
    
    let myQueue = MyOperationQueue()
    let totalOperation = 20
    var count = 0

    init() {
        myQueue.name = "com.test.deepak"
        //myQueue.maxConcurrentOperationCount = 30
        NotificationCenter.default.addObserver(self, selector: #selector(allOprationsCompleted), name: NSNotification.Name(rawValue: "MyOperationQueueOperationsCompleted"), object: nil)
    }
    
    @objc private func allOprationsCompleted() {
        print("allOprationsCompleted......")
    }
    
    func addOperations() {
        count += 1
        let asyncOperation = AsyncOperation.init(queue: myQueue)
        asyncOperation.printNumber(count)
        myQueue.addOperation(asyncOperation)
        asyncOperation.completionBlock = {
            print("Operation completed, cancelled:\(asyncOperation.isCancelled)")
        }
    }
    
    func testOperationQueue() {
        for _ in 1...totalOperation {
            addOperations()
        }
    }
}

let testOperationQueue = MyOperationQueueTest()
testOperationQueue.testOperationQueue()

////////////Another code///////////


/// Subclass of `Operation` that adds support of asynchronous operations.
/// 1. Call `super.main()` when override `main` method.
/// 2. When operation is finished or cancelled set `state = .finished` or `finish()`
open class AsynchronousOperation: Operation {
    public override var isAsynchronous: Bool {
        return true
    }
    
    public override var isExecuting: Bool {
        return state == .executing
    }
    
    public override var isFinished: Bool {
        return state == .finished
    }
    
    public override func start() {
        if self.isCancelled {
            state = .finished
        } else {
            state = .ready
            main()
        }
    }
    
    open override func main() {
        if self.isCancelled {
            state = .finished
        } else {
            state = .executing
        }
    }
    
    public func finish() {
        state = .finished
    }
    
    // MARK: - State management
    
    public enum State: String {
        case ready = "Ready"
        case executing = "Executing"
        case finished = "Finished"
        fileprivate var keyPath: String { return "is" + self.rawValue }
    }
    
    /// Thread-safe computed state value
    public var state: State {
        get {
            stateQueue.sync {
                return stateStore
            }
        }
        set {
            let oldValue = state
            willChangeValue(forKey: state.keyPath)
            willChangeValue(forKey: newValue.keyPath)
            stateQueue.sync(flags: .barrier) {
                stateStore = newValue
            }
            didChangeValue(forKey: state.keyPath)
            didChangeValue(forKey: oldValue.keyPath)
        }
    }
    
    private let stateQueue = DispatchQueue(label: "AsynchronousOperation State Queue", attributes: .concurrent)
    
    /// Non thread-safe state storage, use only with locks
    private var stateStore: State = .ready
}

func testAnotherOperation() {
    var someArray = [Int]()
    let queue = OperationQueue()

    for _ in 1...2 {
        // For test purposes I've added `finish()` inside that async operation to finish that operation
        let operation = AsynchronousOperation()
        operation.completionBlock = {
            // We concurrently modifing a shared array from all operations
            // Setting data is not thread-safe, at some point we will receive a crash
            someArray.append(1)
        }
        queue.addOperation(operation)
    }

    queue.waitUntilAllOperationsAreFinished()
    print(someArray)
}
testAnotherOperation()





/////////GCD//////////
// https://medium.com/swift-india/parallel-programming-with-swift-part-2-4-46a3c6262359


//Using Dispatch barrier can add dependency
func testDispatchBarrier() {
    var value: Int = 2

    let concurrentQueue = DispatchQueue(label: "queue", attributes: .concurrent)

    concurrentQueue.async() {
        for i in 0...3 {
            value = i
            print("\(value) ✴️")
        }
    }

    concurrentQueue.async {
        print(value)
    }

    concurrentQueue.async() {
        for i in 0...200 {
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

}


func testSemaphore() {
    var value: Int = 2

    let concurrentQueue = DispatchQueue(label: "queue", attributes: .concurrent)
    let semaphore = DispatchSemaphore(value: 1)

    for j in 0...4 {
        concurrentQueue.async {
            print("\(j) waiting")
            semaphore.wait()
            print("\(j) wait finished")
            value = j
            print("\(value) ✡️")
            print("\(j) Done with assignment")
            semaphore.signal()
        }
    }
}
/*
 print("\(j) wait finished")
 value = j
 print("\(value) ✡️")
 print("\(j) Done with assignment")
 
 These statement execute togather or synchornasly
 */
testSemaphore()

//Do not use playground for testing
func performAsyncTaskIntoConcurrentQueue(with completion: @escaping () -> ()) {
    let concurrentQueue = DispatchQueue(label: "com.queue.Concurrent", attributes: .concurrent)

        let group = DispatchGroup()
        for i in 1...5 {
            group.enter()
            concurrentQueue.async {
            //concurrentQueue.sync { //Task will complete in same order they started 1, 2, 3, 4, 5

                let imageURL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/0/07/Huge_ball_at_Vilnius_center.jpg")!
                let _ = try! Data(contentsOf: imageURL)
                print("###### Image \(i) Downloaded ######")
                group.leave()
            }
        }
        
        /* Either write below code or group.notify() to execute completion block
         group.wait()
         DispatchQueue.main.async {
         completion()
         }
         */
        
        group.notify(queue: DispatchQueue.main) {
            completion()
        }
}

print("###### Download all images asynchronously and notify on completion ######")
print("############")
print("############\n")

performAsyncTaskIntoConcurrentQueue(with: {
    print("\n############")
    print("############")
    print("###### All images are downloaded")
})

