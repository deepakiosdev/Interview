import Foundation
import UIKit

/*
 ///////Walmart///////////
 */


/*
 Question 1 - Two sum problem
 */

/*
 Question 2 - Blind person have 4 tablets in bottle, 2 red and 2 blue. He have to eat one from each(1 red and one blue). All tables are symmetrical in size. How to solve that he should have one blue and one red each time
 
 Solution - Break all four tablets in equal part and keep half of each in bottle and half of each he can take.

*/


/*

 Question 3 - There were 200 fish in an aquarium, 99% of which were red. How many red fish must be removed to make the percentage of red fish 98%?
 
 Solution -
 
 Given - Number of red fish = 99% of 200 = 198

 Therefore, there are 198 red fishes in the aquarium and the 2 remaining fishes are of different colour.

 Let the number of red fish removed be x.

 Therefore,

 198 - x = 98% of (200 - x)
 198 - x = 98/100*(200 - x)
 19800 - 100x = 19600 - 98x
 19800 - 19600 = 100x - 98x
 200 = 2x
 x = 100

 Ans - 100 red fishes to be removed to make the percentage of red fishes 98%
 */



/*Question - Find missing number in a unsorted range.
 e.g. [4, 2, 6, 7, 9, 11, 3, 5, 10]

 //here min is 2 and max is 11
 answer is - 8
 https://codereview.stackexchange.com/questions/150966/detect-the-missing-number-in-a-randomly-sorted-array
 */

//𝑆=(𝑎1+𝑎𝑛)∗𝑛/2
func missingNumber(numbers:[Int], min: Int, max: Int) -> Int {
    
    let sumOfNumbers = numbers.reduce(0, +)
    let expectedSum = (min + max) * (numbers.count + 1) / 2
    let missingNumber = expectedSum - sumOfNumbers
    print("missingNumber:\(missingNumber)")
    return missingNumber
}
/*
 
 Complexity Analysis:
 Time Complexity: O(n).
 Only one traversal of the array is needed.
 Space Complexity: O(1).
 No extra space is needed
 Note - this appraoch have overflow issue
 */

//let arr = [0, 4, 2, 6, 7, 9, 11, 3, 5, 10, 1]
let arr = [4, 2, 6, 7, 9, 11, 3, 5, 10]
missingNumber(numbers: arr, min: 2, max: 11)



/*
 https://www.geeksforgeeks.org/find-the-missing-number/
 Similar problem
 You are given a list of n-1 integers and these integers are in the range of 1 to n. There are no duplicates in the list. One of the integers is missing in the list. Write an efficient code to find the missing integer.
 */

// numbers represents the array
// n : Number of elements in array.

/*
 Using formula
 Sum of natural numbers = n(n+1)/2
 */
func missingNumber(numbers:[Int], n: Int) -> Int {
    
   var total = (n + 1) * (n + 2) / 2

    for num in numbers {
        total -= num
    }
    print("Missing number in range 1 to n:\(total)")
    return total
}

missingNumber(numbers: [1, 2, 4, 6, 3, 7, 8], n: 7)

//////OR///////
//Number should be in range [1...n] does not include 0
func missingNumber(numbers:[Int]) -> Int {
    // let n = numbers.count //Start from 0  [0,1,2,3,4]
    let n = numbers.count + 1 //Start from 1 [1,2,3,4]
    var total = n * (n + 1) / 2

    for num in numbers {
        total -= num
    }
    print("Missing number in range without passing lenght of array:\(total)")
    return total
}

missingNumber(numbers: [1]) // 2
missingNumber(numbers: [2]) // 1
missingNumber(numbers: [2,4,1]) // 3
missingNumber(numbers: [3,1]) // 2
missingNumber(numbers: [1,2,3,4,5,7,8,9,10]) // 6
missingNumber(numbers: [9,8,7,6,5,3,2,1]) // 4
missingNumber(numbers: [1, 2, 4, 6, 3, 7, 8]) //5


/*
 Approach:
 XOR has certain properties
 Assume a1 ^ a2 ^ a3 ^ …^ an = a and a1 ^ a2 ^ a3 ^ …^ an-1 = b
 Then a ^ b = an

 Algorithm:
 Create two variables a = 0 and b = 0
 Run a loop from 1 to n with i as counter.
 For every index update a as a = a ^ i
 Now traverse the array from start to end.
 For every index update b as b = b ^ array[i]
 Print the missing number as a ^ b.
 
 https://www.techiedelight.com/find-missing-number-array/
 We know XOR of two equal numbers cancels each other. Take advantage of this fact to find missing number in limited range array.
The idea is compute XOR of all the elements in given array and compute XOR of all the elemens from 1 to n + 1. where n is size of array. Now missing number is XOR of theese two
 
*/

//You are given a list of n-1 integers and these integers are in the range of 1 to n. There are no duplicates in the list. One of the integers is missing in the list. Write an efficient code to find the missing integer.

func missingNumberUsingXOR(numbers:[Int]) -> Int {
    
    guard numbers.count > 0 else {
        return -1
    }
    var xor = 0 //For xor of all the elements in array
    let length = numbers.count
    
    for index in 0..<length  {
        xor = xor ^ numbers[index]
    }
    
    for index in 1...(length + 1)  {
        xor = xor ^ index
    }
    
    print("missingNumberUsingXOR---: \(xor)")

    return xor
}


missingNumberUsingXOR(numbers: [1]) // 2
missingNumberUsingXOR(numbers: [2]) // 1
missingNumberUsingXOR(numbers: [2,4,1]) // 3
missingNumberUsingXOR(numbers: [3,1]) // 2
missingNumberUsingXOR(numbers: [1,2,3,4,5,7,8,9,10]) // 6
missingNumberUsingXOR(numbers: [9,8,7,6,5,3,2,1]) // 4
missingNumberUsingXOR(numbers: [9,6,4,2,3,5,7,10,1]) // 8

///////OR//////

func missingNumberUsingXOR1(numbers:[Int]) -> Int {
    
    guard numbers.count > 0 else {
        return -1
    }
    var resultOfGivenNumbsXOR = 0 //For xor of all the elements in array
    var resultOfAllNumbsXOR = 0  //For xor of all the elements from 'min' to (array lenght + 1)
    let length = numbers.count
    
    for index in 0..<length {
        resultOfGivenNumbsXOR = resultOfGivenNumbsXOR ^ numbers[index]
    }
    
    for index in 1...(length + 1) {
        resultOfAllNumbsXOR = resultOfAllNumbsXOR ^ index
    }
    
    let missingNumber = resultOfGivenNumbsXOR ^ resultOfAllNumbsXOR
    print("missingNumberUsingXOR1: \(missingNumber)")

    return missingNumber
}


missingNumberUsingXOR1(numbers: [1]) // 2
missingNumberUsingXOR1(numbers: [2]) // 1
missingNumberUsingXOR1(numbers: [2,4,1]) // 3
missingNumberUsingXOR1(numbers: [3,1]) // 2
missingNumberUsingXOR1(numbers: [1,2,3,4,5,7,8,9,10]) // 6
missingNumberUsingXOR1(numbers: [9,8,7,6,5,3,2,1]) // 4
missingNumberUsingXOR1(numbers: [9,6,4,2,3,5,7,10,1]) // 8


/*
 https://leetcode.com/problems/missing-number/
 
 Given an array nums containing n distinct numbers in the range [0, n], return the only number in the range that is missing from the array.

 Follow up: Could you implement a solution using only O(1) extra space complexity and O(n) runtime complexity?

  

 Example 1:

 Input: nums = [3,0,1]
 Output: 2
 Explanation: n = 3 since there are 3 numbers, so all numbers are in the range [0,3]. 2 is the missing number in the range since it does not appear in nums.
 Example 2:

 Input: nums = [0,1]
 Output: 2
 Explanation: n = 2 since there are 2 numbers, so all numbers are in the range [0,2]. 2 is the missing number in the range since it does not appear in nums.
 Example 3:

 Input: nums = [9,6,4,2,3,5,7,0,1]
 Output: 8
 Explanation: n = 9 since there are 9 numbers, so all numbers are in the range [0,9]. 8 is the missing number in the range since it does not appear in nums.
 Example 4:

 Input: nums = [0]
 Output: 1
 Explanation: n = 1 since there is 1 number, so all numbers are in the range [0,1]. 1 is the missing number in the range since it does not appear in nums.
 
 */

/*
 Approach:
 We can harness the fact that XOR is its own inverse to find the missing element in linear time.

 Because we know that nums contains n numbers and that it is missing exactly one number on the range [0..n−1], we know that n definitely replaces the missing number in nums. Therefore, if we initialize an integer to n and XOR it with every index and value, we will be left with the missing number. Consider the following example (the values have been sorted for intuitive convenience, but need not be):
 
 Index    0    1    2    3
 Value    0    1    3    4
 missing
 ​    
 =4∧(0∧0)∧(1∧1)∧(2∧3)∧(3∧4)
 =(4∧4)∧(0∧0)∧(1∧1)∧(3∧3)∧2
 =0∧0∧0∧0∧2
 =2

 */

func missingNumber1(_ nums: [Int]) -> Int {
    
    var missing = nums.count
    
    for index in 0..<nums.count  {
        missing = missing ^ (index ^ nums[index])
        
    }
    print("missing: \(missing)")
    
    return missing
}



missingNumber1([0]) // 1
missingNumber1([1]) // 0
missingNumber1([2]) // 3 - Failing // It should be 1
missingNumber1([3,0,1]) // 2
missingNumber1([0,1]) // 2
missingNumber1([9,6,4,2,3,5,7,0,1]) // 8
/*
 Complexity Analysis

 Time complexity : O(n)

 Assuming that XOR is a constant-time operation, this algorithm does constant work on n iterations, so the runtime is overall linear.

 Space complexity : O(1)

 This algorithm allocates only constant additional space.
 */



////Using Gauss formula/////////

func missingNumberUsingGauss(_ numbers:[Int]) -> Int {
    
    let n = numbers.count
    var total = n * (n + 1) / 2
    
    for num in numbers {
        total -= num
    }
    print("Missing number using gauss in numbers:\(numbers), \(total)")
    return total
}

missingNumberUsingGauss([0]) // 1
missingNumberUsingGauss([1]) // 0
missingNumberUsingGauss([0, 2]) // 1
missingNumberUsingGauss([3, 0, 1]) // 2
missingNumberUsingGauss([0, 1]) // 2
missingNumberUsingGauss([9, 6, 4, 2, 3, 5, 7, 0, 1]) // 8
///////Walmart End///////////

//////////////////OLA, Imocha test////////////


func countZerosInDecimalNumberBankingSystem(_ num: Int) -> Int {
    var number = num
    var count = 0
    while number > 0 {
        
        if number % 10 == 0 {
            count += 1
        }
        count += 1
        number /= 10
    }
    print(count)
    return count
}

countZerosInDecimalNumberBankingSystem(100)


//123 = 1*100 + 2*10 + 3 (3 Zero)
//109 = 1*100 + 0*10 + 9 (4 Zero)
//100 = 1*100 + 0*10 + 0 (5 Zero)


/*
 https://www.geeksforgeeks.org/mirror-characters-string/
 Given a string and a number N, we need to mirror the characters from the N-th position up to the length of the string in alphabetical order. In mirror operation, we change ‘a’ to ‘z’, ‘b’ to ‘y’, and so on.
 Examples:
  

 Input : N = 3
         paradox
 Output : paizwlc
 We mirror characters from position 3 to end.

 Input : N = 6
         pneumonia
 Output : pneumlmrz
 */

func mirrorString(_ str: String, fromPosition: Int) -> String {
           //let alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o","p" ,"q", "r", "s", "t", "u", "v", "w","x", "y", "z"]
    //let reverseAlphabet = ["z", "y", "x", "w", "v", "u", "t", "s", "r", "q", "p", "o", "n", "m", "l", "k", "j", "i", "h", "g", "f", "e", "d", "c","b","a"]
    
    let alphabetDict = ["a" : "z", "b" : "y", "c" : "x", "d" : "w", "e" : "v", "f" : "u", "g" : "t", "h" : "s", "i" : "r", "j" : "q", "k" : "p", "l" : "o", "m" : "n", "n" : "m", "o" : "l", "p" :"k" ,"q" : "j", "r" : "i", "s" : "h", "t" : "g", "u" : "f", "v" : "e", "w" : "d","x" : "c", "y" : "b", "z" : "a"]
    let charArry = Array(str)
    var mirrorString = str.prefix(fromPosition - 1)
    for index in (fromPosition - 1)..<charArry.count {
        let char = String(charArry[index])
        mirrorString += alphabetDict[char]!
    }
    return String(mirrorString)
}

let str = "deepak" //devkzp , postion = 3
//let str = "paradox" //paizwlc postion = 3
//let str = "pneumonia" //pneumlmrz , postion = 6,

print(mirrorString(str, fromPosition: 3))


//////////////////OpenText, Codility Text////////////


/*
 https://www.geeksforgeeks.org/minimum-number-deletions-no-two-consecutive/
 https://leetcode.ca/2020-03-26-1578-Minimum-Deletion-Cost-to-Avoid-Repeating-Letters/
 https://leetcode.com/problems/minimum-deletion-cost-to-avoid-repeating-letters/
 Given a string 's' and an array of integers 'cost' where cost[i] is the cost of deleting the ith character in s.

 Return the minimum cost of deletions such that there are no two identical letters next to each other.

 Notice that you will delete the chosen characters at the same time, in other words, after deleting a character, the costs of deleting other characters will not change.

  

 Example 1:

 Input: s = "abaac", cost = [1,2,3,4,5]
 Output: 3
 Explanation: Delete the letter "a" with cost 3 to get "abac" (String without two identical letters next to each other).
 Example 2:

 Input: s = "abc", cost = [1,2,3]
 Output: 0
 Explanation: You don't need to delete any character because there are no identical letters next to each other.
 Example 3:

 Input: s = "aabaa", cost = [1,2,3,4,1]
 Output: 2
 Explanation: Delete the first and the last character, getting the string ("aba").
  

 Constraints:

 s.length == cost.length
 1 <= s.length, cost.length <= 10^5
 1 <= cost[i] <= 10^4
 */

func minCost(_ s: String, _ cost: [Int]) -> Int {
    
    let charArray = Array(s)
    var costArray = cost
    var minCost = 0
    for index in 0..<charArray.count - 1 {
        
        if charArray[index] == charArray[index + 1] {
            if costArray[index] > costArray[index + 1] {
                (costArray[index], costArray[index + 1]) = (costArray[index + 1], costArray[index])
            }
            
            minCost += costArray[index]
        }
    }
    print(minCost)
    return minCost
}


//let string = "abaac"
//let cost = [1,2,3,4,5]
//Output - 3

//let string = "aaabbbabbbb"
         //[a,a,a, b,b,b,a,b,b,b,b"]
//let cost = [3,5,10,7,5,3,5,5,4,8,1] //3(0)+5(1) + 5(4)+3(5) +4(8)+5(7)+1(10)
//Output - 26

//let string = "acaaaacccc"
//let cost = [9,3,9,8,8,3,2,7,6,6]
 //Output - 33

let string = "aaaaaaaaaaaaaa"
let cost = [1,3,6,5,4,5,4,4,2,8,3,10,6,6]
//Output - 57
minCost(string, cost)



/*
 Question
 
 How to return a palindrome of specified length and specified distinct characters
 (int a = the number of characters in the String) (int b = the number of distinct characters in the String
 
 http://5.9.10.113/63039743/how-to-return-a-palindrome-of-specified-length-and-specified-distinct-characters

 OR Almost same problem
 https://www.hackerearth.com/problem/algorithm/avoid-prefix-palindromes-cdd47bd7-780d0bca/
 https://www.tutorialspoint.com/program-to-count-number-of-palindromes-of-size-k-can-be-formed-from-the-given-string-characters-in-python
 A special palindrome is a palindrome of size which contains at most distinct characters such that any prefix of size between and is not a palindrome.

 You need to count the number of special palindromes.

 For example, abba is a special palindrome with N = 4 and K = 2 and ababa is not a special palindrome because aba is a palindrome and its a prefix of ababa.

 If N = 3 and K = 3, possible special palindromes are aba, aca, bab, bcb, cac and cbc. So the answer will be 6.

 Input format

 A single line comprising two integers  and

 */

public func palindromeOfSpecifiedLength(_ N : Int, _ K : Int) -> String {

    if N < 1 || K > 26 {
        return ""
    }
    
    let charArray = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o","p" ,"q", "r", "s", "t", "u", "v", "w","x", "y", "z"]
    let requiredArry = charArray[0..<K]

    var charIndex = 0
    var palindrome = ""
    var mid = 0
    if N % 2 == 0 { //For even length palindrome
        mid = (N + 1) / 2
    } else { //For odd length palindrome
        palindrome = requiredArry[0]
        charIndex = 1
        mid = N / 2
    }

    for _ in 0..<mid {

        if charIndex > K - 1 {
            charIndex = 0
        }
        let char = requiredArry[charIndex]
        palindrome = char + palindrome + char //Append characters in left and right side of string
        charIndex += 1
    }

    print("palindromeOfSpecifiedLength: \(palindrome)")
    return palindrome
}


/*
 /////////InVideo///////////
 */

/*
 Question 1 - Output of program
 */
func dispatchQueueTesting() {
    
    let concurrentQueue = DispatchQueue.init(label: "mycustomquee", qos: .background, attributes: .concurrent)
    
    concurrentQueue.async {
        
        print("before async")
        DispatchQueue.main.async {
            print("async")
        }
        print("after async")
        
        print("before sync")
        DispatchQueue.main.sync {
            print("sync")
        }
        print("after sync")
    }
}

dispatchQueueTesting()
/*
 output - Both output possible
 
before async
after async
async
before sync
sync
after sync
 
 OR May be -
 
 before async
 after async
 before sync
 async
 sync
 after sync
 
 
*/

/*
 Question 2 - Difference b/w bond and frame. Have a view of size = (width:100, hight: 100) What will be size and bonds of view after scale it by factor of two.
 
 Answer - Boud will remain same but size will change by multiple of scaling factor. New size will be
 size = (width:200, hight: 200)
 bounds = (width:100, hight: 100)
 
 
 let myView = UIView()
 myView.frame = CGRect(x: 150, y: 400, width: 100, height: 100)
 myView.backgroundColor = .red
 print("Before scale myView.bonds:\(myView.bounds), frame:\(myView.frame)")
 myView.transform = CGAffineTransform.identity.scaledBy(x: 2, y: 2)
 print("after scale myView.bonds:\(myView.bounds), frame:\(myView.frame)"
 
 Output is -
 Before scale myView.bonds:(0.0, 0.0, 100.0, 100.0), frame:(150.0, 400.0, 100.0, 100.0)
 after scale myView.bonds:(0.0, 0.0, 100.0, 100.0), frame:(100.0, 350.0, 200.0, 200.0)
 
 */

//>>>>>>>>>>Second Round
//Question 1-

enum MediaType {
    case Video
    case Audio
    case Text
}

struct Clip {
    var type: MediaType
    var duration: Float//Seconds
    
    init(type: MediaType, duration: Float) {
        self.type = type
        self.duration = duration
    }
}

let clips = [Clip.init(type: .Audio, duration: 30), Clip.init(type: .Video, duration: 20)]
//Now i need a variable like this "clips.duration" that return total duration of all the clips. How will you implement

extension Array where Element == Clip {
    
    var duration: Float {
        
        /*var sum:Float = 0.0
        for clip in self {
            sum += clip.duration
        }
        return sum*/
        //Or
        
        return reduce(0) { clipTime, clip in
            return (clipTime + clip.duration)
        }
    }
}

//Note if take Clip as a class then
/*extension Array where Element: Clip {
    
    var duration: Float {
        var sum:Float = 0.0
        for clip in self {
            sum += clip.duration
        }
        return sum
    }
}
*/

print("clips.duration:\(clips.duration)")


/*
 /////////Tact.io///////////
 */

//Question 1 -

struct Point: Comparable {
    //Note this statement was not present in question so it will through error
    static func < (lhs: Point, rhs: Point) -> Bool {
        lhs.x == rhs.x
    }
    
    var x: Int
}

struct X {
    
    var point: Point {
        didSet {
            print("point.x inside:\(point.x)")
            point.x = 0
        }
    }
}

let point = Point.init(x: 5)
var y = X.init(point: point)

let result = y.point.x == point.x
print(y.point.x)
print(point.x)
print(result) // true

// Things to be conside that until we not set value of "y.point" didSet method will not call so value reamin same whatever we intialized.
y.point = Point.init(x: 10)
print("y.point.x:\(y.point.x)") // 0
print("point.x:\(point.x)") //5


//Question 2 -

var language = "Objc"
let code = { [language]
    print("language:\(language)")
}
language = "swift"
let newCode = code
newCode()

/*Question 3 - What all are thread safe
  a) NSCache
  b) Array
  c) Dictionary
 
 Answer -
 The NSCache is thread-safe according to Apple docs.
*/

//Question 4
protocol Athelete {
    func play()
}

extension Athelete {
    
    func play() {
        completePlay()
    }
    
    func completePlay() {
        print("1")
    }
}

class Player: Athelete {
    
    func play() {
        completePlay()
    }
    
    func completePlay() {
        print("2")
    }
}

class Cricketer: Player {
    
   override func completePlay() {
        print("3")
    }
}

let bumrah = Cricketer()
bumrah.play() //3
bumrah.completePlay() //3

//Question 5

/*This was real question remaings are practive question of defer
 
https://www.hackingwithswift.com/new-syntax-swift-2-defer
 */
func calculator() -> Int {
    var counter = 5
    defer {
        counter += 1
        print("insde counter:\(counter)") //16
    }
    counter *= 3
    print("counter:\(counter)")
    return counter
}

calculator() //15

func calculator1() -> Int {
    var counter = 5
    if counter > 1 {
        defer {
            counter += 1
        }
    }
    
    counter *= 3
    return counter
}

calculator1() // 18

func testDefer() {
    print("Step 1")

    do {
        defer { print("Step 2") }
        print("Step 3")
        print("Step 4")
    }

    print("Step 5")

}

/*
 Step 1
 Step 3
 Step 4
 Step 2
 Step 5
 */


func testDeferInLoop() {
    for i in 1...3 {
        print ("In \(i)")
        defer { print ("Deferred \(i)") }
        print ("Out \(i)")
    }

}
testDeferInLoop()

/*
 In 1
 Out 1
 Deferred 1
 In 2
 Out 2
 Deferred 2
 In 3
 Out 3
 Deferred 3
 */

func deferTest()  {
    print("Start")
    var value: String?
    defer {
        if let v = value {
            print("Ending execution of \(v)")
        }
    }
    value = "defer function"
    print("End")
}

/*
Start
End
Ending execution of defer function
*/


//Question 6
func testTactQueue() {
    let queue = DispatchQueue.init(label: "tact queue")
    print("Async start")
   
    queue.async {
        print("1")
        
        queue.async {
            print("2")
        }

        queue.async {
            print("3")
        }
    }
    print("Async end")

    queue.sync {
        print("4")

    }
}

testTactQueue()
/*
 Async start
 1
 Async end    //From here to upside order will same. Below order can be change
 2
 4
 3
 */

//Note - This will create deadlock
func testTactQueue1() {
    let queue = DispatchQueue.init(label: "tact queue")
    print("Async start")
   
    queue.async {
        print("1")
        
        queue.async {
            print("2")
        }

        queue.async {
            print("3")
        }
    }
    print("Async end")

    DispatchQueue.main.sync {
        print("4")
    }
}

//testTactQueue1()


/*Question 7 - Do not remember exact question
 
 Which pattern NSNotificationCenter implemented?
 a) Singleton
 b) Factory
 c) Adopter
 d) Delegation (forgot the name but i think it was delegate)
 
 Answer - Singleton
 */

/*Question 8 - Which sorting algo is example of divide-and-conquer
 
 Ans - Quick Sort; Merge Sort;
 
 Binary Search is also exaple of divide-and-conquer
 
 */


/*Question 9 - What is time complactiy of binary search?
 Answer -  by geek for geek log2 (n)
 By wikipedia - in worst case O(log n)
 
 */

/*
 /////////Agoda///////////
 */

/*
 Question 1-
 Find a pair with maximum product in array of Integers
 https://www.geeksforgeeks.org/return-a-pair-with-maximum-product-in-array-of-integers/
 
 Answer see - MaxProduct
*/

/*
 /////////Jio///////////
 */


/*
 Question 1- Find max sum of two numbers in array
 
 Input: arr[] = [1, 4, 3, 6, 7, 0]
 Output -: 13
 
 Input: arr[] = [7, 4, 3, 6, 7]
 Output -: 14
 

 ****Question 2- Stock Buy Sell to Maximize Profit
 
 https://www.geeksforgeeks.org/stock-buy-sell/

 The cost of a stock on each day is given in an array, find the max profit that you can make by buying and selling in those days. For example, if the given array is {100, 180, 260, 310, 40, 535, 695}, the maximum profit can earned by buying on day 0, selling on day 3. Again buy on day 4 and sell on day 6. If the given array of prices is sorted in decreasing order, then profit cannot be earned at all.
 
 Input array - [100, 180, 260, 310, 40, 535, 695]
 output is - [[0,3], [4, 6]]
 */

func maximizeProfitOnMultipeBuySell(_ prices:[Int]) -> Int {
    
   // var buySellArray = [[Int]]()
    
    var maxProfit = 0
    for index in 1..<prices.count {
        let profit = prices[index] - prices[index - 1]
        if profit > 0 {
            maxProfit  += profit
            //buySellArray.append([index - 1, index])
        }
    }
    print("maxProfit:\(maxProfit)")
    //print("buySellArray:\(buySellArray)")
    return maxProfit
}
let prices = [100, 180, 260, 310, 40, 535, 695]
/*Buy on day: 0     Sell on day: 3
Buy on day: 4     Sell on day: 6*/

//let prices = [700, 600, 500, 400, 300, 200, 100] // [], (max profit = 0)

//let prices = [100, 200, 300, 400, 500, 600, 700] //[[0, 6]] (max profit = 600)
//let prices = [700, 700, 700, 700, 700, 700, 700]// [], (max profit = 0)
//let prices = [7, 1, 5, 3, 6, 4] //[[1, 2], [3, 4]] (max profit = 7)
//let prices = [100, 90, 80, 81] //[[2, 3]],  (max profit = 1)



maximizeProfitOnMultipeBuySell(prices)


func indexsOfMaxProfitOnMultipeBuySell(_ prices:[Int]) -> [[Int]] {
    
    let stocksCount = prices.count

    if stocksCount < 2 {
        return [[0,0]]
    }
    
    var buySellArray = [[Int]]()
    var index = 0

    while index < (stocksCount - 1) {
        
        //Find buy day
        //Find the day when next day price is greater than current day price. Move the index till next day price is lower than current day price
        while index < (stocksCount - 1) && prices[index] >= prices[index + 1] {
            index += 1
        }
        
        if index == stocksCount - 1 {
            break
        }
        let buyDay = index
                
        //Find sell day
       // Move the index till next day price is greater than current day price
        while index < (stocksCount - 1) && prices[index + 1] >= prices[index] {
            index += 1
        }

        buySellArray.append([buyDay, index])
        
    }
    print("buySellArray:\(buySellArray)")
    return buySellArray
}

indexsOfMaxProfitOnMultipeBuySell(prices)


////////////Rakuten//////////////////////////
//https://www.geeksforgeeks.org/converting-roman-numerals-decimal-lying-1-3999/
//https://www.geeksforgeeks.org/converting-decimal-number-lying-between-1-to-3999-to-roman-numerals/
/*
Roman numerals are represented by seven different symbols: I, V, X, L = 50, C = 100, D and M.
Symbol       Value
I             1
V             5
X             10
L             50
C             100
D             500
M             1000
For example, 2 is written as II in Roman numeral, just two one's added together. 12 is written as XII, which is simply X + II. The number 27 is written as XXVII, which is XX + V + II.
Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX.
 
 There are six instances where subtraction is used:
* I can be placed before V (5) and X (10) to make 4 and 9.
* X can be placed before L (50) and C (100) to make 40 and 90.
* C can be placed before D (500) and M (1000) to make 400 and 900.
 
 
Given a roman numeral, convert it to an integer.
Example 1:
Input: s = "III"
Output: 3
 
Example 2:
Input: s = "IV"
Output: 4
 
Example 3:
Input: s = "IX"
Output: 9
 
Example 4:
Input: s = "LVIII"
Output: 58
Explanation: L = 50, V= 5, III = 3.
 
Example 5:
Input: s = "MCMXCIV"
Output: 1994
Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.
 
Constraints:
* 1 <= s.length <= 15
* s contains only the characters ('I', 'V', 'X', 'L', 'C', 'D', 'M').
* It is guaranteed that s is a valid roman numeral in the range [1, 3999]

*/


func getNumberFromRoman1( _ romanString: String) -> Int {
    
    let romanSymbolValues: [Character : Int] = ["I" : 1,
                                                "V" : 5,
                                                "X" : 10,
                                                "L" : 50,
                                                "C" : 100,
                                                "D" : 500,
                                                "M" : 1000]
    
    let romanChars = Array(romanString)
    let charsCount = romanChars.count
    var number = 0
    var currentIndex = 0
    
    while currentIndex < charsCount {
        //print("currentIndex:\(currentIndex)")
        let currentDigit = romanSymbolValues[romanChars[charsCount - currentIndex - 1]]!
        number += currentDigit
        //print("currentDigit:\(currentDigit)")
        
        if currentIndex < (charsCount - 1) {
            let nextDigit = romanSymbolValues[romanChars[charsCount - currentIndex - 2]]!
           // print("nextDigit:\(nextDigit)")
            if nextDigit < currentDigit {
                number -= nextDigit
                currentIndex += 1
            }
        }
        currentIndex += 1
        //print("number:\(number)")
    }
    return number
}

///This one better solution
func getNumberFromRoman( _ romanString: String) -> Int {
    
    let romanSymbolValues: [String : Int] = [
                                                "I" : 1,
                                                "V" : 5,
                                                "X" : 10,
                                                "L" : 50,
                                                "C" : 100,
                                                "D" : 500,
                                                "M" : 1000,
                                                "IV" : 4,
                                                "IX" : 9,
                                                "XL" : 40,
                                                "XC" : 90,
                                                "CD" : 400,
                                                "CM" : 900
                                                            ]
    
    
    var deciamalNumber = 0
    let chars = Array(romanString)
    let count = chars.count
    var index = 0
    
    while index < count {
        var current = "\(chars[index])"
        if index + 1 < count {
            current = "\(current)\(chars[index + 1])"
        }
        
        if let num = romanSymbolValues[current] {
            deciamalNumber += num
            index += 1
        } else if let num = romanSymbolValues["\(chars[index])"] {
            deciamalNumber += num
        }
        index += 1
    }
    
    return deciamalNumber
}

let romanString = "MCMXCIV" //1994
//let romanString = "LVIII" //58
//let romanString = "IX" //9
//let romanString = "IV" //4
//let romanString = "III" //3
print(getNumberFromRoman(romanString))

/*
 Second Round - Veit
 */
//Question 1- Write an extension of UIImageview to download images from url and set on imageView.

extension UIImageView {
    
    
    func downloadImageUsingDataTask(_ urlString: String) {
        //Check Network
        guard urlString.count > 0, let url = URL.init(string: urlString) else {
            return
        }
       
        // data task
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data else {
                return
            }
            DispatchQueue.main.async {
                self?.image = UIImage(data: data)
            }
        }.resume()
    }
    
    
//https://developer.apple.com/documentation/foundation/url_loading_system/downloading_files_from_websites
    
    func downloadImageUsingDownloadTask(_ urlString: String) {
        //Check Network
        guard urlString.count > 0, let url = URL.init(string: urlString) else {
            return
        }
       
        URLSession.shared.downloadTask(with: url) {
            urlOrNil, responseOrNil, errorOrNil in
            // check for and handle errors:
            // * errorOrNil should be nil
            // * responseOrNil should be an HTTPURLResponse with statusCode in 200..<299
            
            guard let fileURL = urlOrNil else { return }
            do {
                let documentsURL = try
                    FileManager.default.url(for: .documentDirectory,
                                            in: .userDomainMask,
                                            appropriateFor: nil,
                                            create: false)
                let savedURL = documentsURL.appendingPathComponent(fileURL.lastPathComponent)
                try FileManager.default.moveItem(at: fileURL, to: savedURL)
            } catch {
                print ("file error: \(error)")
            }
        }.resume()
    }
    

    
    func downloadImageUsingContentOfUrl(_ urlString: String) {
        //Check Network
        guard urlString.count > 0, let url = URL.init(string: urlString) else {
            return
        }
       
        DispatchQueue.global().async {
               // Fetch Image Data
               if let data = try? Data(contentsOf: url) {
                   DispatchQueue.main.async {
                       // Create Image and Update Image View
                       self.image = UIImage(data: data)
                   }
               }
        }
    }
}

//Question 2 - What's wrong in below code? How will you fix?

/*
class Foo {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Bar: Foo {
    var age: Int
    init(name: String, age: Int) {
        super.init(name: name)
        self.age = age //Error - Property 'self.age' not initialized at super.init call
    }
    
    convenience init(age: Int) {
        super.init(name: "default") //Error - Convenience initializer for 'Bar' must delegate (with 'self.init') rather than chaining to a superclass initializer (with 'super.init')
        self.age = age
    }
}
 */

class SolutionFoo {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class SolutionBar: SolutionFoo {
    var age: Int
    init(name: String, age: Int) {
        self.age = age
        super.init(name: name)
        //self.age = age
    }
    
    convenience init(age: Int) {
       // super.init(name: "default")
        self.init(name: "default", age: age)
        //self.age = age
    }
}
////////////Round 3rd Amit and Ragventra/////////
///Write a program to print this (Vertical Histogram problem) -
//http://www.learntosolveit.com/cprogramming/Ex_1.13.2_His_vertical.html

func verticalHistoGram(_ arr: [Int]) {
    
    let maxHieght = arr.sorted().last!

    for row in stride(from: maxHieght, through: 1, by: -1) {

        for column in arr {

          if column >= row {
              print("*", terminator: "")
          } else {
              print(" ", terminator: "")

          }
        }
        print("");
    }
}

func verticalHistoGram1(_ arr: [Int]) {
    let rowsCount = arr.sorted().last!
    
    for row in 1...rowsCount {
        
        for columnValue in arr {
            
            let space = rowsCount - columnValue - row
            if space >= 0 {
                print(" ", terminator: "")
            } else {
                print("*", terminator: "")
            }
        }
        print("");
    }
}

verticalHistoGram([3,2,4])



////////////////Microsoft/////////////
/*Question 1
 
Given two integers A and B, return the number of integers from the range A..B which can be expressed as the product of two consecutive integers, that is X * (X + 1) which is also known as Pronic Number.
 Example 1 :

 A = 6 and B = 20, the function should return 3, These integers are 6 = 2 * 3, 12 = 3 * 4 and 20 = 4 * 5

 Example 2 :

 A = 21 and B = 29, the function should return 0

 Assumptions:

 A and B are integers within the range [1...1000,000,000]
 A <= B
 
 
 Pronic number is a number which is the product of two consecutive integers, that is, a number n is a product of x and (x+1). The task is to check and print Pronic Numbers in a range.
*/
public func pronicCount(_ A : Int, _ B : Int) -> Int {
    
    var count = 0
    let start = Int(sqrt(Double(A)))
    let end = Int(sqrt(Double(B)))
    
    count = end - start - 1
    
    if (start * (start + 1)) >= A {
        count += 1
    }

    if (end * (end + 1)) <= B {
        count += 1
    }
    return count
}

/*Question 1
 
 Find minimum lenght file name if meet certain condition
 1. File name end with "~"
 2. File size less than "7 MB"
 3. File modifed after "1990-01-31"
 */

let filesDetail =
"""
715K 2009-09-23 system.zip~
179K 2013-08-14 to_do_list.xml~
645K 2013-06-19 bluckbuster.mpeg~
536 2010-12-12 notes.html
688M 1990-02-11 delete-this.zip~
23K 1987-05-24 setup.png~
616M 1965-06-06 important.html
14K 1992-05-31 crucial-module.java~
192K 1990-01-31 very_long_filename.dll~
"""

//K = 1024 //= 2(10)
//M = 1024 * 1024   //2(20)
//G = 1024 * 1024 * 1024  //2(30)


func isValidDate(_ dateString: String) -> Bool {
    
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let date = dateFormatter.date(from:dateString)!
    
    let boundaryDate = dateFormatter.date(from:"1990-01-31")!
    return (date > boundaryDate)
}

func isValidFileSize(_ string: String) -> Bool {
    
    let suffix = string.last!
    let sizeOfFile = string.dropLast()

    var multiplier = 1
    if suffix == "K" {
        multiplier = 1024
    } else if suffix == "M" {
        multiplier = 1024 * 1024
    } else if suffix == "G" {
        multiplier = 1024 * 1024 * 1024
    }
    let size = Int(sizeOfFile)! * multiplier
    let requiredSize = 7 * 1024 * 1024
    return (size < requiredSize)
}


func minimumLenghtOfFileName(_ fileDetails: String)-> String {
    
    var minimumLenght = Int.max
    var isMinimumLengthFileFound = false

    for file in fileDetails.split(separator: "\n") {
        //print("file: \(file)")
        let fileComponents = file.split(separator: " ")
        
        //Check file extension
        var fileName = String(fileComponents[2])
        if !fileName.hasSuffix("~") {
            continue
        }
        
        //Check valid file size
        if !isValidFileSize(String(fileComponents[0])) {
            continue
        }

        if isValidDate(String(fileComponents[1])) {
            
            fileName = String(fileName.split(separator: ".").first!)
            isMinimumLengthFileFound = true
            if minimumLenght > fileName.count {
                minimumLenght = fileName.count
            }
        }
    }
    print("minimumLenght----:\(minimumLenght)")
    if isMinimumLengthFileFound {
        return "\(minimumLenght)"
    }
    return "NO FILES"
}


minimumLenghtOfFileName(filesDetail)


/////////First round - Live coading

/*
 //https://www.geeksforgeeks.org/find-the-element-that-appears-once-in-a-sorted-array/
 Find the element that appears once in a sorted array
 Difficulty Level : Medium
 Given a sorted array in which all elements appear twice (one after one) and one element appears only once. Find that element in O(log n) complexity.

 Example:

 Input:   arr[] = [1, 1, 3, 3, 4, 5, 5, 7, 7, 8, 8]
 Output:  4

 Input:   arr[] = [1, 1, 3, 3, 4, 4, 5, 5, 7, 7, 8]
 Output:  8

 */

/*
 Time Complexity: O(n)
Space Complexity: O(1)
 */



enum NumberError: String, Error {
    case InvalidInput = "Invalid input"
    case NumberNotFound = "Number not found"
}

func findElementThatNotAppearTwiceUsingXOR(_ numbers: [Int]) throws -> Int {
    
    var missingNumber = 0
    if numbers.count < 1 || numbers.count % 2 == 0 {
        throw NumberError.InvalidInput
    }

    for num in numbers {
        missingNumber = missingNumber ^ num
    }
    
    print(missingNumber)
    return missingNumber
}

//let arrDoubleElement = [1, 1, 3, 3, 4, 5, 5, 7, 7, 8, 8]
let arrDoubleElement = [1, 1, 3, 3, 4, 4, 5, 5, 7, 7, 8]
let missingNumber = try findElementThatNotAppearTwiceUsingXOR(arrDoubleElement)
print("findElementThatNotAppearTwiceUsingXOR:\(missingNumber)")


///OR////// This solution is better than above
func findElementThatNotAppearTwice(_ numbers: [Int]) throws -> Int {
    
    if numbers.count < 1 || numbers.count % 2 == 0 {
        throw NumberError.InvalidInput
    }
    
    var leftIndex = 0
    var rightIndex = numbers.count - 1
    
    while leftIndex <= rightIndex {
        
        if numbers[leftIndex] != numbers[leftIndex + 1] {
            return numbers[leftIndex]
        }
        
        if numbers[rightIndex] != numbers[rightIndex - 1] {
           return numbers[rightIndex]
        }

        leftIndex += 2
        rightIndex -= 2
    }
    
    throw NumberError.NumberNotFound
}



/*
 An Efficient Solution can find the required element in O(Log n) time. The idea is to use Binary Search. Below is an observation on the input array.
 All elements before the required have the first occurrence at even index (0, 2, ..) and the next occurrence at odd index (1, 3, …). And all elements after the required elements have the first occurrence at an odd index and the next occurrence at an even index.
 1) Find the middle index, say ‘mid’.
 2) If ‘mid’ is even, then compare arr[mid] and arr[mid + 1]. If both are the same, then the required element after ‘mid’ and else before mid.
 3) If ‘mid’ is odd, then compare arr[mid] and arr[mid – 1]. If both are the same, then the required element after ‘mid’ and else before mid.
 */


func findElementThatNotAppearTwice(_ array: [Int], low: Int, high: Int) {
    if low > high {
        return
    }
    
    if low == high {
        print(array[low])
        return
    }
    
    let mid = (low + high) / 2
    
    // If mid is even and element next to mid is
    // same as mid, then output element lies on
    // right side, else on left side
    if mid % 2 == 0 {
        
        if array[mid] == array[mid + 1] {
            findElementThatNotAppearTwice(array, low: mid + 2, high: high)
        } else {
            findElementThatNotAppearTwice(array, low: low, high: mid)
        }
        
    } else {
        if array[mid] == array[mid - 1] {
            findElementThatNotAppearTwice(array, low: mid + 1, high: high)
        } else {
            findElementThatNotAppearTwice(array, low: low, high: mid - 1)
        }
    }
}

let lenght = arrDoubleElement.count
print(findElementThatNotAppearTwice(arrDoubleElement, low: 0, high: lenght - 1))


//////////////////////Synamedia//////////////////////////

//Round 1
/*Question 1-  https://www.quora.com/There-are-9-mangoes-1-mango-weighs-900-grams-You-have-a-weight-machine-but-no-weights-How-do-you-find-out-which-1-mango-is-900-grams
 
 Solution-
 I am assuming its a balance pan but has no weights as mentioned

 first separate the 9 mangoes into 3 equal halves so each part will have 3 mangoes

 now weigh all three parts ,first two parts on either sides of the pan ,if they are equal the ODD mango is in the 3rd part .if they are unequal ODD mango will be in either 1st or 2nd part that weighed more or less in the balance pan

 in both case you will be left with 3 mangoes to weigh

 so you can take that part and weigh 2 of the mangoes on either side of the the pan.

 IF they are equal then the one kept unweighted is the ODD mango,else either of the two which weighed less or more is the ODD mango
 -Max round required to check = 4, minimum = 2

 Question 2 -
 Find thrid largest number in unsorted array.
*/


//Round 1
/*
 
 */

//////////////////////Quest Global//////////////////////////

/*
 Question 1 -
 Given an array of numbers, write a function which continuously
    - Compares first and last element in the array
    - Prints the largest among them and removes it
    - Repeats until the array is empty
E.g.: Given the array [2, 3, 5, 4, 6, 8, 1, 9], it should print:
9, 2, 3, 5, 4, 6, 8 and finally 1 in order


 */

func removeLargestElement( _ numbers: inout [Int])-> [Int] {
    
    if numbers.count < 1 {
        return [Int]()
    }
    
    while numbers.count > 0 {
        
        if numbers[0] > numbers[numbers.count - 1] {
            let remvoedNumber = numbers.remove(at: 0)
            print(remvoedNumber)
        } else if numbers[0] < numbers[numbers.count - 1] {
            let remvoedNumber = numbers.remove(at: numbers.count - 1)
            print(remvoedNumber)
        } else {
            let remvoedNumber = numbers.remove(at: 0)
            print(remvoedNumber)

        }
    }
    
    return numbers
}

var numbs = [2, 3, 5, 4, 6, 8, 1, 9]
removeLargestElement(&numbs)


//////////////////////Cavista mettl test//////////////////////////

/*
 
 Question 1-
 https://leetcode.com/problems/move-zeroes/
 https://www.geeksforgeeks.org/move-zeroes-end-array-set-2-using-single-traversal/
 Given an integer array nums, move all 0's to the end of it while maintaining the relative order of the non-zero elements.

 Note that you must do this in-place without making a copy of the array.

 */

func moveZeroesToEnd(_ nums: inout [Int]) {
    guard nums.count > 1 else {
        return
    }
    var nonZeroIdx: Int = 0
    for (index, num) in nums.enumerated() where num != 0 {
        (nums[nonZeroIdx], nums[index]) = (nums[index], nums[nonZeroIdx])
        nonZeroIdx += 1
    }
}
var numbers = [0,1,0,3,12]
moveZeroesToEnd(&numbers) //[1, 3, 12, 0, 0]


/*
 https://www.geeksforgeeks.org/find-kth-character-of-decrypted-string/
 https://www.geeksforgeeks.org/find-k-th-character-of-decrypted-string-set-2/
 https://leetcode.com/problems/decoded-string-at-index/
 https://www.youtube.com/watch?v=p-GPuy01a7A

 Querstion 2 -
 Find k’th character of decrypted string | Set 1
 
 Given an encoded string where repetitions of substrings are represented as substring followed by count of substrings. For example, if encrypted string is “ab2cd2” and k=4 , so output will be ‘b’ because decrypted string is “ababcdcd” and 4th character is ‘b’.
 Note: Frequency of encrypted substring can be of more than one digit. For example, in “ab12c3”, ab is repeated 12 times. No leading 0 is present in frequency of substring
 
 Input: "a2b2c3", k = 5
 Output: c
 Decrypted string is "aabbccc"

 Input : "ab4c2ed3", k = 9
 Output : c
 Decrypted string is "ababababccededed"

 Input: "ab4c12ed3", k = 21
 Output: e
 Decrypted string is "ababababccccccccccccededed"

 */

//This one is BEST answer
//T- O(N)
//S- O(N)
func decodeAtIndex(_ s: String, _ k: Int) -> String {
   
    var decodedStrSize = 0
    let chars = Array(s)
    var myK = k
    
    for char in s {
        
        if char.isNumber {
            decodedStrSize *= Int(String(char))!
        } else {
            decodedStrSize += 1
        }
    }
    
    for index in stride(from: s.count - 1, through: 0, by: -1) {
        myK %= decodedStrSize
        
        let char = chars[index]

        if myK == 0 && char.isLetter {
            return String(char)
        }
        
        if char.isNumber {
            decodedStrSize /= Int(String(char))!
        } else {
            decodedStrSize -= 1
        }
    }
    
    return ""
}


func decodeAtIndex1(_ s: String, _ k: Int) -> String {
    
    var decprtedString: String = ""
    
    var index = 0
    let charsCount = s.count
    let charsArray = Array(s)
    
    while index < charsCount {
        var subString = ""
        var freq = 0
        var isFoundNumber = false
       
        while index < charsCount {
            
            if charsArray[index].isNumber {
                isFoundNumber = true
                freq = freq * 10 + Int(String(charsArray[index]))!
                index += 1
            } else {
                if isFoundNumber {
                    break
                } else {
                    subString += String(charsArray[index])
                    let totalCount = subString.count + decprtedString.count
                    if totalCount >= k {
                        return String(Array(decprtedString + subString)[k - 1])
                    }
                    index += 1
                }
            }
        }
        
        print("freq:\(freq), subString:\(subString)")
        while freq > 0 {
            decprtedString += subString
            freq -= 1
        }

        print("decprtedString:\(decprtedString)")

        if decprtedString.count >= k {
            let chars = Array(decprtedString)
            print("chars:\(chars)")
            return String(Array(decprtedString)[k - 1])
        }
    }
    
    return ""
}

//decodeAtIndex("a2b2c3", 5) //c
//decodeAtIndex("ab4c2ed3", 9) //c

//decodeAtIndex("ab4c12ed3", 21) //e
//decodeAtIndex("leet2code3", 10) //o

//decodeAtIndex("ha22", 5) //h
//decodeAtIndex("a2345678999999999999999", 1) //a
decodeAtIndex("a2b3c4d5e6f7g8h9", 9) //c (aa bbb cccc ddddd....)



//////////////////////1Mg//////////////////////////
/*
 Question 1-
*/

class Demo {
    var auth: String
    
    init(auth: String) {
        self.auth = auth
    }
    
}

class SubClass: Demo {
    
    var number = "123"
    
    lazy var token: Demo = {
        return Demo(auth: self.number)
    }()
}

let subObj = SubClass(auth: "ABC")
print(subObj.token.auth) //123
subObj.token.auth = "567"
print(subObj.token.auth) //567

/*
 Question 2-
*/

class TestDict {
    func test() {
        
        //let dict = [Any : Int]() // This will throw error
        
        /*
         error: MyPlayground.playground:6:20: error: type 'Any' does not conform to protocol 'Hashable'
                 let dict = [Any : Int]() //error: type 'Any' does not conform to protocol 'Hashable'
                            ^

         error: MyPlayground.playground:6:20: error: protocol 'Any' as a type cannot conform to 'Hashable'
                 let dict = [Any : Int]() //error: type 'Any' does not conform to protocol 'Hashable'
                            ^

         MyPlayground.playground:6:20: note: only concrete types such as structs, enums and classes can conform to protocols
                 let dict = [Any : Int]() //error: type 'Any' does not conform to protocol 'Hashable'
                            ^

         MyPlayground.playground:6:20: note: required by generic struct 'Dictionary' where 'Key' = 'Any'
                 let dict = [Any : Int]() //error: type 'Any' does not conform to protocol 'Hashable'
         */
        
        let dict1 = [AnyHashable : Int]() // While this will work
    }

}

/*
 Question 3-
*/


func test1MgQueue() {
    let serialQueue1 = DispatchQueue.init(label: "com.deepak.test1")
    let serialQueue2 = DispatchQueue.init(label: "com.deepak.test2")

    serialQueue1.async {
        for index in 1..<5 {
            print(index)
        }
    }
    
   /*
    //This will execute once all the privious operation of serialQueue1 will complete.
    serialQueue1.async {
        for index in 100..<105 {
            print("index:\(index)")
        }
    }*/
    
    serialQueue2.async {
        for index in 5..<9 {
            print(index)
        }
    }
}

//test1MgQueue()
/*
 Note -:
 1)  1, 5 will be reamin same reamaining elements sequance will be change every time
 2) Both are independent serial queue out put is not depend on each other

 Output -
 1
 5
 2
 6
 3
 7
 4
 8
 */


func test1MgQueue1() {
    let serialQueue1 = DispatchQueue.init(label: "com.deepak.test1")

    serialQueue1.async {
        for index in 1..<5 {
            print(index)
        }
    }
   
    serialQueue1.async {
        for index in 5..<9 {
            print(index)
        }
    }
}

//test1MgQueue1()

/*
 Output -
 1
 2
 3
 4
 5
 6
 7
 8

 */

//////////////////////Cavista//////////////////////////

/*
 Question 1-
 https://private-91ec4d-axxesshiring.apiary-mock.com/items
 Parse the json and store the objects in array(do not include object those have nil or empty name) and then display Names in Table/CollectionView view then on click of cell open detail page and display time and with listId. Time duration is 35 Mins
*/


/*
 Question 2-

 Write a function to compress a string "aabbbc" to "a2b3c", if a letter is just a single count after a different letter is encountered just display the letter and not the count such as "c" in "aabbbc". You can assume the input is always lower case letters. Time duration is 15 Mins

Test Cases

"a" -> "a"
"aaaabccddd" -> "a4bc2d3"
"abbbc" -> "ab3c"
"eefffgggg" ->"e2f3g4"
"eefffeee" -> "e2f3e3"*/

func compressString(_ str: String)-> String {
    
    guard str.count < 2 else {
        return str
    }
    var encodedString = ""
    var count = 1
    var previousChar = ""
    
    for char in str {
        if previousChar == String(char) {
            count += 1
        } else {
            if count > 1 {
                encodedString = encodedString + String(previousChar) + "\(count)"
            } else {
                encodedString = encodedString + String(previousChar)
            }
            previousChar = String(char)
            count = 1
        }
    }
    
    if count > 1 {
        encodedString = encodedString + String(previousChar) + "\(count)"
    } else {
        encodedString = encodedString + String(previousChar)
    }
    
    return encodedString
}

let srt = "a" // a
//let srt = "aaaabccddd" // a4bc2d3
//let srt = "abbbc" // ab3c
//let srt = "eefffgggg" // e2f3g4
//let srt = "eefffeee" // e2f3e3
//let srt = "aaaabccddd" // a4bc2d3

//print(compressString(srt))

//////////////////////Lookout//////////////////////////

/*
 Question 1-
 */
// Input Array: {"9", "-7", "sh”, "6.5", "time”, "apple”}
// Reorder above array in alphanumerical order (as shown below)
// (1) starting with smallest value to highest value, (2) sort characters from a to z order

// Expected output array: {"-7", "6.5", "9", "apple”, "sh”, "time”}
// Rule: You can’t use any API’s from OS for sorting. Write your own sorting algorithm.
// You can use OS API's for other purposes like string operations.


//////////////////////Cognizant//////////////////////////
//https://www.fullstack.cafe/blog/swift-interview-questions - Most of question asked from here
func toupleTest() {
    
    let list = [Int](1...5)
    var arrayOfTuples = [(Int, Int)]()

    for (index, element) in list.enumerated() {
        arrayOfTuples += [(index, element)]
    }
    print(arrayOfTuples) // prints [(0, 1), (1, 2), (2, 3), (3, 4), (4, 5)]
    /*
     Quesation -
     Can you rewrite this code in a more "swiftier" way?
     */

    //Answer -
    let arrayOfTuples1 = Array(list.enumerated())
    print(arrayOfTuples1) // prints [(offset: 0, element: 1), (offset: 1, element: 2), (offset: 2, element: 3), (offset: 3, element: 4), (offset: 4, element: 5)]

    let arrayOfDictionaries = list.enumerated().map { (a, b) in return [a : b] }
    print(arrayOfDictionaries) // prints [[0: 1], [1: 2], [2: 3], [3: 4], [4: 5]]
}

toupleTest()

//////////////////////McAfee/////////////////////////
///First Round Witten test on Otomeyt

/*
 Question 1- Expected Number of Trials to get N Consecutive Heads while M alraedy tossed and get consecative Heads
 Input - N = 2, M = 1
 Output: 4

 Input: N = 2, M = 0
 Output: 6

 Input: N = 3, M = 3
 Output: 0

 Input: N = 3, M = 2
 Output: 8

 
 Similar question
 ///Expected Number of Trials to get N Consecutive Heads
 Given a number N. The task is to find the expected number of times a coin must be flipped to get N heads consecutively.
 Example:

 Input: N = 2
 Output: 6
 Input: N = 5
 Output: 62
 */

func requiredTossToGetConsecutiveHeads(_ N: Int, M: Int) -> Int {
    
    if M >= N {
        return 0
    }
    let count = M + (Int(pow(Double(2), Double(N - M + 1))) - 2)
    
    return count
}

requiredTossToGetConsecutiveHeads(5, M: 2)

/*
 Question 2 - Question fibonnaci
 */

//////////DevRev(20 Aug 2021) First round with manager Eric////////////////
/*
 Question 1-
    https://www.geeksforgeeks.org/flood-fill-algorithm-implement-fill-paint/
 */


//////////////////Grab, Codility Text(30 Aug)////////////



/*
 Question 1 - https://dotnetfiddle.net/30H12c
 
Given a number N and two reduction operations, count the number of operations required to reduce
N to 0.

You are given a string S of length N which encodes a non-negative number V in a binary form. Two types of operations may be performed on it to
modify its value:
if V is odd, subtract 1 from it;
if V is even, divide it by 2.
These operations are performed until the value of V becomes 0.
For example, if string S = "011100", its value V initially is 28. The value of V would change as follows:
V = 28, which is even: divide by 2 to obtain 14;
V = 14, which is even: divide by 2 to obtain 7;
V = 7, which is odd: subtract 1 to obtain 6;
V = 6, which is even: divide by 2 to obtain 3;
V = 3, which is odd: subtract 1 to obtain 2;
V = 2, which is even: divide by 2 to obtain 1;
V = 1, which is odd: subtract 1 to obtain 0.
Seven operations were required to reduce the value of V to 0.
Write a function:
class Solution { public int solution(string S); }
that, given a string S consisting of N characters containing a binary representation of the initial value V, returns the number of operations after
which its value will become 0.
Examples:
1. Given S = "011100", the function should return 7. String S represents the number 28, which becomes 0 after seven operations, as explained
above.
2. Given S = "111", the function should return 5. String S encodes the number V = 7. Its value will change over the following
*/

//Note - This solution is not working for if binary string "1.....40,0000 times". Fix it

 func countNumberOfOperationsRequiredToMakeZero(_ S : inout String) -> Int {
    // write your code in Swift 4.2.1 (Linux)
    guard var decimalValue = Int64(S, radix: 2) else {
        return 0
    }
    
    var count = 0
    while decimalValue > 0 {
        
        if decimalValue % 2 == 0 {
            decimalValue /= 2
        } else {
            decimalValue -= 1
        }
        count += 1
    }
    
    return count
}

//var str = "111" //5
//var str = "011100" //7
var binaryStr = "1111010101111" //22
//countNumberOfOperationsRequiredToMakeZero(&binaryStr)


/*Question 2 -https://www.chegg.com/homework-help/questions-and-answers/john-always-dreamed-taking-vacation-hawaii-decided-make-dream-come-true-next-holiday-perio-q81987321
 
 John has always dreamed of taking a vacation on Hawaii. He has decided to make his dream come true during the next holiday period, and he would like to spend as much time there as possible. The problem is that there is only one plane per week connecting Hawaii with the city where John lives. The plane departs every Monday and arrives every Sunday. There is no other way to get to Hawaii and back. It means that John can spend only whole weeks in Hawaii. John knows in which month his vacation starts and in which month it ends. His vacation period starts on the first day of the beginning month and ends on the last day of the ending month. John also knows the year in which his vacation takes place. For example, if John's vacation lasts from July to September in 2008, then it starts on 1st July 2008 and ends on 30th September 2008. Your task is to calculate how many weeks John will spend in Hawaii, given: the month when the vacation begins; • the month when the vacation ends; the year when the vacation takes place; • the day of the week for 1st January in the vacation year (for convenience) The names of the days of the week are: Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday. The names of the months are: January, February, March, April, May, June, July, August, September, October, November, December. The lengths of the months
 are, respectively: 31, 28 (or 29 in a leap year), 31, 30, 31, 30, 31, 32, 30, 31, 30, 31 days. Pay attention to leap years; you should also consider them. The year of the vacation will be a number between 2001 and 2099, inclusive, and you can tell that the year is a leap year if it's divisible by 4. Write a function: class Solution { public int solution(int Y, string A, string B, string that, given an integer Y and three non-empty strings A, B and W, denoting the year of the vacation, the beginning month, the ending month and the day of the week for 1st January of that year, returns the maximum number of weeks that John can spend in Hawaii. For example, given Y =2014, A = "April", B = "May" and W="Wednesday", the function should return 7, since John can leave his city on April 7th and come back on May 25th, so he will spend 7 weeks on Hawaii (the weeks beginning, respectively, on April 7th, 14th, 21st, 28th and May 5th, 12th, 19th). April 2014 May 2014 Mo Tu We Th Fr Sa Su Mo Tu We Th Fr Sa Su 1 2 3 4 5 6 1 2 3 4
 April 2014 May 2014 Mo Tu We Th Fr Sa Su Mo Tu We Th Fr Sa Su 1 2. 3 5 6 1 2 3 7 8 9 10 11 12 13 5 ON 7 CO 9 10 11 14 15 16 17 18 19 20 12 13 14 15 16 17 18 21 22 23 24 25 26 27 19 20 21 22 23 24 25 28 29 30 26 27 28 29 30 31 Assume that: Y is an integer within the range (2,001..2,099]; A and B are valid month names; month B does not preceed month A; • W is a valid weekday name; W is the correct weekday for January 1st of year Y in the actual calendar, In your solution, focus on correctness.
 
 */

//Not a working solution 
func numberOfWeeksBetweenTwoGivenMoths(_ Y : Int, _ A : inout String, _ B : inout String, _ W : inout String) -> Int {
   // write your code in Swift 4.2.1 (Linux)
   let months = ["January" : "01", "February" : "02", "March": "03", "April" : "04", "May" : "05", "June" : "06" , "July" : "07", "August" : "08", "September" : "09", "October" : "10", "November" : "11", "December" : "12"]
   let startMonth = months[A]
   let endMonth = months[B]

   let formatter = DateFormatter()
   formatter.dateFormat = "dd/MM/yyyy"
   let startDate = formatter.date(from: "01/\(String(describing: startMonth))/\(Y)")
   
   //let satrtOfDay = Calendar.current.startOfDay(for: startDate!)
   var components = DateComponents()
   components.month = Int(endMonth!)
   components.second = -1
   let lastDayOfEndMonth = Calendar(identifier: .gregorian).date(byAdding: components, to: startDate!)
   formatter.dateFormat = "dd"
   let lastDay = formatter.string(from: lastDayOfEndMonth!)
   let endDate = formatter.date(from: "\(lastDay)/\(endMonth ?? "0")/\(Y)")

   let diffComponent = Calendar.current.dateComponents([.weekOfYear], from: startDate!, to: endDate!)
   return diffComponent.weekOfYear ?? 0
}

//(2014, 'April', 'May', 'Wednesday')

var  a = "April"
var  b = "May"
var  w = "Wednesday"

//numberOfWeeksBetweenTwoGivenMoths(2014, &a, &b, &w)
/*
Question 3 - 10 Multiple choice question

*/


//////////////////PayPal (06 Sept ,Viren Malhan)////////////
//First Round

/*
Question 1 - What's wrong in this code? How memory allocation will happen?
*/

struct Person {

    let friends: [Person]
    
    init(friends: [Person]) {
        self.friends = friends
    }

}

/*Answer - Its value type and value type should have information of all the properties data type information at compile time so that get/allocate meomory on compile time. But here type itself holding so comiple can not calculate the size of memory. It will compile without error.
if take Person as a class then its fine because for classes memory get ob heap and its dynamic. So it will be OK.
 
 */

/*
Question 2 -  Given a binary tree, print it's nodes row wise in reverse order, comma separated.

          1
      2     3
    4  5  6  7

 O/p - 1,3,2,7,6,5,4
*/



/*
Question 3 - How will break cycle in Circular Link list?
 
1->2->3->4-> 5
         |   |
         7<- 6

//Output
1->2->3->4->5-6->7

*/


//Second Round
//Search in a Row-wise and Column-wise Sorted 2D Array
//https://leetcode.com/problems/search-a-2d-matrix/


//////////////////////////Share Chat////////////////


/*
 Question 1-  What all errors in this code
 
 struct MyStruct {
    var abc: String = "initial value"

    func changeValue() {
        abc = "some other value"
   }
}
let obj = MyStruct()
obj.changeValue()
print(abc)
*/

/*
 Question 2-  What is error in this code?

class A {
var a: Int
var b = 10

init() {
print(“Class A is initialised”)
}
}

*/

////////epiFi////////////

//     * public static Map<String, Integer> minByKey(String key, List<Map<String, Integer>> records);

//Write a program to sort an array of dictionaries based on dictionary keys. Return sorted dictionary corresponding to the passed key. If one of the dictionaries does not have that key, return the first dictionary.


/*
 
 * assert min_by_key("a", [{"a": 1, "b": 2}, {"a": 2}]) == {"a": 1, "b": 2}
 * assert min_by_key("a", [{"a": 2}, {"a": 1, "b": 2}]) == {"a": 1, "b": 2}
 * assert min_by_key("b", [{"a": 1, "b": 2}, {"a": 2}]) == {"a": 2}
 * assert min_by_key("a", [{}]) == {}
 * assert min_by_key("b", [{"a": -1}, {"b": -1}]) == {"b": -1}
 */
func minByKey(_ key: String, records:[Dictionary<String, Int>]?) -> Dictionary<String, Int>? {
    

    guard let records = records, !records.isEmpty else {
        
      return nil
    }
    var minResult: Dictionary<String, Int>?
   // print(records)

    for dict in records {
        //print(dict)

        if let value = dict[key] {
            if minResult == nil {
                minResult = dict
            }
            
            if let minVlue = minResult?[key], minVlue > value {
                minResult = dict
            }
        } else {
            minResult = dict

        }
            
    }
    print(minResult!)
    return minResult
}

//["key1": "value1", "key2": "value2"]
//var dict1 = ["a": 1, "b": 2]
//
//var dict2 = ["a": 2]
//
//var dictArr = [dict1, dict2]
//
//minByKey("a", records: dictArr)

//Second test
//* assert min_by_key("a", [{"a": 2}, {"a": 1, "b": 2}]) == {"a": 1, "b": 2}

//var dict1 = ["a": 2]
//var dict2 = ["a": 1, "b" : 2]
//
//var dictArr = [dict1, dict2]
//
//minByKey("a", records: dictArr)


//3rd
//* assert min_by_key("b", [{"a": 1, "b": 2}, {"a": 2}]) == {"a": 2}

//var dict1 = ["a": 1, "b" : 2]
//var dict2 = ["a": 2]
//
//var dictArr = [dict1, dict2]
//
//minByKey("b", records: dictArr)

//4th assert min_by_key("a", [{}]) == {}

var dict1 = [String: Int]()

var dictArr = [dict1]

minByKey("b", records: dictArr)

////////OYO/////////////
//Second Round by Shalvi Sexsena 21 Oct
/*
 
 Question 1-
 
 /*[
 [1, 0, 0, 1]
 [0, 1, 0, 1]
 [1, 1, 0, 0]
 ]
  
  //first loop - [0][0],[0, 1]
  // inner loop if [0][1] == 0 {
  
  }
  o(n * m)
 o/p -> [true, false, false, true]
 */

 Question 2-
 Move last element to front of a given Linked List https://www.geeksforgeeks.org/move-last-element-to-front-of-a-given-linked-list/
 Input: 1 -> 2 -> 3 -> 4 -> 5 -> 6, k = 3
 Output : 4 -> 5 -> 6 -> 1 -> 2 -> 3

 Input: 1 -> 2 -> 3 -> 4 -> 5 -> 6, k = 7
 Output : 6 -> 1 -> 2 -> 3 -> 4 -> 5
 
 */

////////Written test on hackerearth for moengage.com. 25 MCQ question in 30 Minutes. 21 Oct

func outPutOfStride() {
    for number in stride(from: 1, to: 17, by: 4) {
        print("number:\(number)") //1, 5, 9, 17
    }
}
outPutOfStride()

func switchTest(_ num: Int) {
    
    switch (num % 3 == 0, num % 5 == 0) {
    case (true, false):
        print("(true, false)")
    case (false, true):
        print("(false, true)")
        
    case (true, true):
        print("(true, true)")

    case (false, false):
        print("(false, false)")
        
    }
}
switchTest(15)
