import UIKit

/*
Google
https://leetcode.com/discuss/interview-question/352460/Google-Online-Assessment-Questions

*/

/*
 Facebook
 https://leetcode.com/discuss/interview-question/1376426/Facebook-or-Interview-questions-or-July-2020-July-2021
 https://leetcode.com/discuss/interview-question/1387416/Facebook-phone-interview
 */
/*
 Given 2 UIViews find their common parent view.
 https://leetcode.com/discuss/interview-question/1114139/Facebook-iOS-interview/880848
 
 */

func findParent(a: UIView, b: UIView) -> UIView? {
    var v1: UIView? = a
    var v2: UIView? = b
    while(v1 != v2) {
        v1 = v1 == nil ? b : v1?.superview
        v2 = v2 == nil ? a : v2?.superview
    }
    return v1
}

//////OR
/*
I think that we can use UIView's method isDescendant(of:) https://developer.apple.com/documentation/uikit/uiview/1622521-isdescendant that returns a Boolean value indicating whether the receiver is a subview of a given view or identical to that view.
 */

func findParent1(a: UIView, b: UIView) -> UIView? {
    var currentView: UIView? = a
    
    while currentView != nil {
        if b.isDescendant(of: currentView!) { //isDescendant(of:) == isSubview(of:)
            return currentView
        } else {
            currentView = currentView?.superview
        }
    }
    return nil
}
//
/*if mySubview.isDescendant(of: someParentView) {
    mySubview.removeFromSuperview()
} else {
    someParentView.addSubview(mySubview)
}*/

//OR https://gist.github.com/AdrianFerreyra/3a0f4ec2cdd6129934e60dec070c9abb
//This one if fine as per my understanding as compare to other solution.
extension UIView {
    func commonSuperView(otherView: UIView) -> UIView? {
        var pathToRoot = Set<UIView>()
        var current: UIView? = self
        while current != nil {
            pathToRoot.insert(current!)
            current = current?.superview
        }

        var other: UIView? = otherView // Check otherView then it's superview, and so on.
        while other != nil {
            if pathToRoot.contains(other!) { return other }
            other = other?.superview
        }
        return nil
    }
}



/////////////////////
/*
 https://www.facebookrecruiting.com/portal/coding_practice_question/?problem_id=238827593802550&c=312375940577939&practice_plan=0
 https://www.geeksforgeeks.org/caesar-cipher-in-cryptography/ 
 One simple way to encrypt a string is to "rotate" every alphanumeric character by a certain amount. Rotating a character means replacing it with another character that is a certain number of steps away in normal alphabetic or numerical order.
For example, if the string "Zebra-493?" is rotated 3 places, the resulting string is "Cheud-726?". Every alphabetic character is replaced with the character 3 letters higher (wrapping around from Z to A), and every numeric character replaced with the character 3 digits higher (wrapping around from 9 to 0). Note that the non-alphanumeric characters remain unchanged.
Given a string and a rotation factor, return an encrypted string.
Signature
string rotationalCipher(string input, int rotationFactor)
Input
1 <= |input| <= 1,000,000
0 <= rotationFactor <= 1,000,000
Output
Return the result of rotating input a number of times equal to rotationFactor.
Example 1
input = Zebra-493?
rotationFactor = 3
output = Cheud-726?
Example 2
input = abcdefghijklmNOPQRSTUVWXYZ0123456789
rotationFactor = 39
output = nopqrstuvwxyzABCDEFGHIJKLM9012345678
*/



enum CharecterType {
    case Letter
    case Number
    case Special
}

struct RotationalCipher {
    let backing: String
    let letters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    let digits = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]

    func getCharType(_ character: Character) -> CharecterType {
        var charType: CharecterType = .Special
        
        if character.isLetter {
            charType = .Letter
        } else if character.isNumber {
            charType = .Number
        }
        
        return charType
    }
    
    func rotatedChar(_ char: Character, rotationFactor: Int) -> String {
        
        var character = String(char)
        let type = getCharType(char)
        //print("type:\(type)")
        if type == .Letter {

            let index = (rotationFactor + letters.firstIndex(of: character.lowercased())!) % 26
            //print("index:\(index)")
            character = letters[index]
            if char.isUppercase {
                character = character.capitalized
            }
        } else if type == .Number {
            let index = (rotationFactor + digits.firstIndex(of: character)!) % 10
            character = digits[index]
        }

        return character
    }
    
    func cipher(withRotationFactor: Int) -> String {
        // Write your code here
        var rotatedString = ""
        for char in backing {
            //print(char)
            let rotatedCharacter = rotatedChar(char, rotationFactor: withRotationFactor)
            //print("rotatedCharacter:\(rotatedCharacter)")

            rotatedString = rotatedString + rotatedCharacter
        }
        return rotatedString
        
    }
    
    
    
}











// These are the tests we use to determine if the solution is correct.
// You can add your own at the bottom.

private extension String {
  var characterArray: String {
    return "[\"\(self)\"]"
  }
}

private var testCaseNumber = 1;
 
private extension RotationalCipher {
  static func check(_ expectedValue: String, against output: String) {
    let rightTick = "\u{2713}";
    let wrongTick = "\u{2717}";
    
    let result = expectedValue == output
    if result {
      print("\(rightTick) Test #\(testCaseNumber)")
    } else {
      print("\(wrongTick) Test #\(testCaseNumber) Expected: \(expectedValue.characterArray) Your output: \(output.characterArray)")
    }
    testCaseNumber += 1
  }
}

let input1 = "All-convoYs-9-be:Alert1."
let expected1 = "Epp-gsrzsCw-3-fi:Epivx5."
let output1 = RotationalCipher(backing: input1).cipher(withRotationFactor: 4)
RotationalCipher.check(expected1, against: output1)

let input2 = "abcdZXYzxy-999.@"
let expected2 = "stuvRPQrpq-999.@"
let output2 = RotationalCipher(backing: input2).cipher(withRotationFactor: 200)
RotationalCipher.check(expected2, against: output2)

// Add your own test cases here


let input3 = "abcdZXYzxy-999.@"
let expected3 = "abcdZXYzxy-999.@"
let output3 = RotationalCipher(backing: input3).cipher(withRotationFactor: 0)
RotationalCipher.check(expected3, against: output3)

let input4 = "z"
let expected4 = "a"
let output4 = RotationalCipher(backing: input4).cipher(withRotationFactor: 1)
RotationalCipher.check(expected4, against: output4)




/*
Revenue Milestones
We keep track of the revenue Facebook makes every day, and we want to know on what days Facebook hits certain revenue milestones. Given an array of the revenue on each day, and an array of milestones Facebook wants to reach, return an array containing the days on which Facebook reached every milestone.
Signature
int[] getMilestoneDays(int[] revenues, int[] milestones)
Input
revenues is a length-N array representing how much revenue FB made on each day (from day 1 to day N). milestones is a length-K array of total revenue milestones.
Output
Return a length-K array where K_i is the day on which FB first had milestones[i] total revenue. If the milestone is never met, return -1.
Example
revenues = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
milestones = [100, 200, 500]
output = [4, 6, 10]
Explanation
On days 4, 5, and 6, FB has total revenue of $100, $150, and $210 respectively. Day 6 is the first time that FB has >= $200 of total revenue.
*/

func getMilestoneDays(_ revenues: [Int], _ milestones: [Int]) -> [Int] {
  // Write your code here
    var achievedMilestone: [Int: Int] = [:]
    var days: [Int] = []
    var sumOfRevenue = 0
    
    for (index, revenue) in revenues.enumerated() {
        sumOfRevenue += revenue

        for mileStone in milestones {
            if sumOfRevenue >= mileStone && achievedMilestone[mileStone] == nil {
                achievedMilestone[mileStone] = index + 1
            }
        }
    }
    
    for mileStone in milestones {
        days.append(achievedMilestone[mileStone]!)
    }
    return days
}

let revenues = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
let milestones = [100, 200, 500]
//output = [4, 6, 10]

print(getMilestoneDays(revenues, milestones))


// These are the tests we use to determine if the solution is correct.
// You can add your own at the bottom.

var test_case_number = 1
func check(_ expected: [Int], _ output: [Int]) {
  var result = true
  if expected.count != output.count {
    result = false
  }
  for i in 0..<min(expected.count, output.count) {
    result = result && (expected[i] == output[i])
  }
  let rightTick = "\u{2713}"
  let wrongTick = "\u{2717}"
  if result {
    print("\(rightTick) Test #\(test_case_number)")
  } else {
    print("\(wrongTick) Test # \(test_case_number): Expected \(expected) Your output: \(output)")
  }
  test_case_number += 1
}

let revenues_1 = [100, 200, 300, 400, 500]
let milestones_1 = [300, 800, 1000, 1400]
let expected_1 = [2, 4, 4, 5]
let output_1 = getMilestoneDays(revenues_1, milestones_1)
check(expected_1, output_1)

let revenues_2 = [700, 800, 600, 400, 600, 700]
let milestones_2 = [3100, 2200, 800, 2100, 1000]
let expected_2 = [5, 4, 2, 3, 2]
let output_2 = getMilestoneDays(revenues_2, milestones_2)
check(expected_2, output_2)

/*
 https://www.facebookrecruiting.com/portal/coding_practice_question/?problem_id=495004218121393&c=312375940577939&practice_plan=0
 
 Number of Visible Nodes
 There is a binary tree with N nodes. You are viewing the tree from its left side and can see only the leftmost nodes at each level. Return the number of visible nodes.
 Note: You can see only the leftmost nodes, but that doesn't mean they have to be left nodes. The leftmost node at a level could be a right node.
 Signature
 int visibleNodes(Node root) {
 Input
 The root node of a tree, where the number of nodes is between 1 and 1000, and the value of each node is between 0 and 1,000,000,000
 Output
 An int representing the number of visible nodes.
 Example
             8  <------ root
            / \
          3    10
         / \     \
        1   6     14
           / \    /
          4   7  13
 output = 4
 */
// Please write your code below, and don’t forget to test edge cases!

import Foundation
// Add any extra import statements you may need here


class Node {
  let data: Int
  let left: Node?
  let right: Node?
    
  init(_ data: Int, left: Node? = nil, right: Node? = nil) {
    self.data = data
    self.left = left
    self.right = right
  }
}

private extension Node {
  // Add any helper functions you may need here


  var visibleNodes: Int {
    // Write your code here
    
      let root = self
        
        var result = 0
        var queue: [Node?] = []
        
        queue.append(root)
        
        while !queue.isEmpty {
            var levelCount = queue.count - 1
            
            if let firstNode = queue.first, let node = firstNode {
                //result.append(node.value)
              result += 1
            }
            
            while levelCount >= 0, queue.count > 0, let firstNode = queue.removeFirst() {
                levelCount -= 1
                
                if let left = firstNode.left {
                    queue.append(left)
                }
                
                if let right = firstNode.right {
                    queue.append(right)
                }
            }
        }
        return result
  }
}

//var testCaseNumber = 1

private func check(_ expectedValue: Int, matches output: Int) {
  let rightTick = "\u{2713}";
  let wrongTick = "\u{2717}";
    
  let result = expectedValue == output
  if result {
      print("\(rightTick) Test #\(testCaseNumber)")
  } else {
      print("\(wrongTick) Test #\(testCaseNumber) Expected: \(expectedValue) Your output: \(output)")
  }
  testCaseNumber += 1
}


let root1 = Node(8,
                 left: Node(3,
                            left: Node(1),
                            right: Node(6,
                                        left: Node(4),
                                        right: Node(7))),
                 right: Node(10,
                             right: Node(14,
                                         left: Node(13))))

check(4, matches: root1.visibleNodes)

let root2 = Node(10,
                 left: Node(8,
                            left: Node(4,
                                       right: Node(5,
                                                   right: Node(6)))),
                 right: Node(15,
                             left: Node(14),
                             right: Node(16)))

check(5, matches: root2.visibleNodes)

// Add your own test cases here



//////
/*
 https://www.facebookrecruiting.com/portal/coding_practice_question/?problem_id=840934449713537&c=312375940577939&practice_plan=0
 
 Pair Sums
 Given a list of n integers arr[0..(n-1)], determine the number of different pairs of elements within it which sum to k.
 If an integer appears in the list multiple times, each copy is considered to be different; that is, two pairs are considered different if one pair includes at least one array index which the other doesn't, even if they include the same values.
 Signature
 int numberOfWays(int[] arr, int k)
 Input
 n is in the range [1, 100,000].
 Each value arr[i] is in the range [1, 1,000,000,000].
 k is in the range [1, 1,000,000,000].
 Output
 Return the number of different pairs of elements which sum to k.
 Example 1
 n = 5
 k = 6
 arr = [1, 2, 3, 4, 3]
 output = 2
 The valid pairs are 2+4 and 3+3.
 Example 2
 n = 5
 k = 6
 arr = [1, 5, 3, 3, 3]
 output = 4
 There's one valid pair 1+5, and three different valid pairs 3+3 (the 3rd and 4th elements, 3rd and 5th elements, and 4th and 5th elements).
 */
func numberOfWays(arr: [Int], k: Int) -> Int {
   
    guard arr.count > 1 else {
        return 0
    }
    
    let numbers = arr.sorted()
    var l = 0
    var r = arr.count - 1
    var count = 0
    
    while l < r {
        let sum = numbers[r] + numbers[l]
        if sum == k {
            count += 1
            print("sum:\(sum), l:\(l),r:\(r)")

            var tem = r - 1
            while l < tem {
                if numbers[tem] + numbers[l] == k {
                    print("sum:\(sum), l:\(l),right:\(tem)")

                    count += 1
                }
                tem -= 1
            }
            l += 1
        } else if sum > k {
            r -= 1
        } else {
            l += 1
        }
    }
    return count
}






// These are the tests we use to determine if the solution is correct.
// You can add your own at the bottom.

//var test_case_number = 1
func check(expected: Int, output: Int) {
  let result = expected == output
  let rightTick = "\u{2713}"
  let wrongTick = "\u{2717}"
  if result {
      print("\(rightTick) Test #\(test_case_number)")
  } else {
      print("\(wrongTick) Test # \(test_case_number): Expected [\(expected)] Your output: [\(output)]")
  }
  test_case_number += 1
}

// Call numberOfWays() with test cases here
let arr1 = [ 1, 2, 3, 4, 3]
let k1 = 6
check(expected: 2, output: numberOfWays(arr: arr1, k: k1))

let arr2 = [ 1, 5, 3, 3, 3]
let k2 = 6
check(expected: 4, output: numberOfWays(arr: arr2, k: k2))

// Add your own test cases here


/*
 https://www.facebookrecruiting.com/portal/coding_practice_question/?problem_id=223547538732703&c=312375940577939&practice_plan=0
 
 Encrypted Words
 You've devised a simple encryption method for alphabetic strings that shuffles the characters in such a way that the resulting string is hard to quickly read, but is easy to convert back into the original string.
 When you encrypt a string S, you start with an initially-empty resulting string R and append characters to it as follows:
 Append the middle character of S (if S has even length, then we define the middle character as the left-most of the two central characters)
 Append the encrypted version of the substring of S that's to the left of the middle character (if non-empty)
 Append the encrypted version of the substring of S that's to the right of the middle character (if non-empty)
 For example, to encrypt the string "abc", we first take "b", and then append the encrypted version of "a" (which is just "a") and the encrypted version of "c" (which is just "c") to get "bac".
 If we encrypt "abcxcba" we'll get "xbacbca". That is, we take "x" and then append the encrypted version "abc" and then append the encrypted version of "cba".
 Input
 S contains only lower-case alphabetic characters
 1 <= |S| <= 10,000
 Output
 Return string R, the encrypted version of S.
 Example 1
 S = "abc"
 R = "bac"
 Example 2
 S = "abcd"
 R = "bacd"
 Example 3
 S = "abcxcba"
 R = "xbacbca"
 Example 4
 S = "facebook"
 R = "eafcobok"
 */

// Add any extra import statements you may need here


// Add any helper functions you may need here


func findEncryptedWord(s: String) -> String {
  // Write your code here
    guard s.count > 1 else {
        return s
    }
    let midle = (s.count - 1) / 2
    let chars = Array(s)
    let midleChar = chars[midle]
    let prefix = s.prefix(midle)
    let isEven = s.count % 2 == 0
    let middleForSuffix = midle + (isEven ? 1 : 0)
    let sufix = s.suffix(middleForSuffix)

    return ("\(midleChar)\(findEncryptedWord(s: String(prefix)))\(findEncryptedWord(s: String(sufix)))")

}











// These are the tests we use to determine if the solution is correct.
// You can add your own at the bottom.

//var test_case_number = 1
func check(expected: String, output: String) {
  let result = expected == output
  let rightTick = "\u{2713}"
  let wrongTick = "\u{2717}"
  if result {
      print("\(rightTick) Test #\(test_case_number)")
  } else {
      print("\(wrongTick) Test # \(test_case_number): Expected \(expected) Your output: \(output)")
  }
  test_case_number += 1
}

check(expected: "bac", output: findEncryptedWord(s: "abc"))

let s2 = "abcd"
check(expected: "bacd", output: findEncryptedWord(s: s2))

// Add your own test cases here


/*
 https://www.facebookrecruiting.com/portal/coding_practice_question/?problem_id=226994905008716&c=312375940577939&practice_plan=0
 
 Balanced Split
 Given an array of integers (which may include repeated integers), determine if there's a way to split the array into two subsequences A and B such that the sum of the integers in both arrays is the same, and all of the integers in A are strictly smaller than all of the integers in B.
 Note: Strictly smaller denotes that every integer in A must be less than, and not equal to, every integer in B.
 Signature
 bool balancedSplitExists(int[] arr)
 Input
 All integers in array are in the range [0, 1,000,000,000].
 Output
 Return true if such a split is possible, and false otherwise.
 Example 1
 arr = [1, 5, 7, 1]
 output = true
 We can split the array into A = [1, 1, 5] and B = [7].
 Example 2
 arr = [12, 7, 6, 7, 6]
 output = false
 We can't split the array into A = [6, 6, 7] and B = [7, 12] since this doesn't satisfy the requirement that all integers in A are smaller than all integers in B.
 */


// Add any extra import statements you may need here


// Add any helper functions you may need here



private extension Array where Element == Int {
  var hasBalancedSplit: Bool {
    // Write your code here
    
    let sortedArray = self.sorted()
    var leftSum = self.reduce(0,+)
    var rightSum = 0
    
    for index in stride(from: sortedArray.count - 1, through: 0, by: -1) {
        leftSum -= sortedArray[index]
        rightSum += sortedArray[index]
        if leftSum == rightSum {
            if sortedArray[index] > sortedArray[index - 1] {
                return true
            }
        }
    }
    return false

  }
}











// These are the tests we use to determine if the solution is correct.
// You can add your own at the bottom.


private func check(_ expectedValue: Bool, matches output: Bool) {
  let rightTick = "\u{2713}"
  let wrongTick = "\u{2717}"
    
  let result = expectedValue == output
  if result {
      print("\(rightTick) Test #\(testCaseNumber)")
  } else {
      print("\(wrongTick) Test #\(testCaseNumber) Expected: \(expectedValue) Your output: \(output)")
  }
  testCaseNumber += 1
}

check(true, matches: [2, 1, 5, 2].hasBalancedSplit)

check(false, matches: [3, 6, 3, 4, 4].hasBalancedSplit)

// Add your own test cases here

