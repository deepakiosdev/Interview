import Foundation

/*
 Microsoft
 https://leetcode.com/discuss/interview-question/398023/Microsoft-Online-Assessment-Questions
 */
//https://www.geeksforgeeks.org/count-minimum-swap-to-make-string-palindrome/
//https://leetcode.com/discuss/interview-question/351783/

/*
     Count minimum swap to make string palindrome
     Difficulty Level : Medium
     Given a string s, the task is to find out the minimum no of adjacent swaps required to make string s palindrome. If it is not possible, then return -1.
     Examples:

     Input: aabcb
     Output: 3
     Explanation:
     After 1st swap: abacb
     After 2nd swap: abcab
     After 3rd swap: abcba
     Input: adbcdbad
     Output: -1

     Approach
     The following are detailed steps to solve this problem.

     Take two-pointer where the first pointer track from the left side of a string and second pointer keep track from the right side of a string.
     Till the time we find the same character, keep moving the right pointer to one step left.
     If the same character not found then return -1.
     If the same character found then swap the right pointer’s character towards the right until it is not placed at its correct position in a string.
     Increase left pointer and repeat step 2.

     */

func swapToMakePalindrome(_ str: String) -> Int {
    
    var swapCount = 0
    var charArray = Array(str)
    let charsCount = charArray.count
    
    // A loop which run from right
    // pointer towards left pointer
    for index in 0..<charsCount/2 {
        let leftIndex = index
        var rightIndex = charsCount - leftIndex - 1

        
        while leftIndex < rightIndex {
            
            // if both char same then
            // break the loop.
            // If not, then we have to
            // move right pointer to one
            // position left
            if charArray[leftIndex] == charArray[rightIndex] {
                break
            } else {
                rightIndex -= 1
            }
        }
        
            // If both pointers are at same
           // position, it denotes that we
          // don't have sufficient characters
         // to make palindrome string
        
        if leftIndex == rightIndex {
            return -1
        }

        //print("rightIndex:\(rightIndex), charsCount - leftIndex - 1 upto: \(charsCount - leftIndex - 2)")
        //If the same character found then swap the right pointer’s character towards the right until it is not placed at its correct position in a string
        for index in rightIndex..<(charsCount - leftIndex - 1) {
           (charArray[index], charArray[index + 1]) = (charArray[index + 1], charArray[index])
            //print("Chars arrr:\(String(charArray))")

            swapCount += 1
        }
        
        //print(charArray)
        
    }
    //print("Swap String:\(String(charArray))")

    print("swapCount:\(swapCount)")
    return swapCount
}

//let string = "aabcb" //3
//let string = "geeksfgeeks" //9
//let string = "mamad"
//let string = "ntiin" // 1 //Falied for this
//let string = "asflkj" // -1
let string = "aabb" //2

swapToMakePalindrome(string)


/////////
/*
 
 https://leetcode.com/discuss/interview-question/364618/
 Alexa is given n piles of equal or unequal heights. In one step, Alexa can remove any number of boxes from the pile which has the maximum height and try to make it equal to the one which is just lower than the maximum height of the stack. Determine the minimum number of steps required to make all of the piles equal in height.

 Input: piles = [5, 2, 1]
 Output: 3
 Explanation:
 Step 1: reducing 5 -> 2 [2, 2, 1]
 Step 2: reducing 2 -> 1 [2, 1, 1]
 Step 3: reducing 2 -> 1 [1, 1, 1]
 So final number of steps required is 3.
 */


/*
 Time complexity: O(NlogN)
 Space complexity: O(1)
 */

func minStep(_ piles: inout [Int]) -> Int {
    
    piles.sort()
    var steps = 0
    let pilesLength = piles.count
    
    for i in 1..<pilesLength {
        
        if piles[pilesLength - i - 1] != piles[pilesLength - i] {
            steps += i
        }
    }
    return steps
}

var piles = [5, 2, 1] //3
//var piles = [4, 5, 5, 4, 2] //6

minStep(&piles)



/*
 https://leetcode.com/discuss/interview-question/406031/
 Write a function that, given an array A of N integers, returns the largest integer K > 0 such that both values K and -K exist in array A. If there is no such integer, the function should return 0.

 Example 1:

 Input: [3, 2, -2, 5, -3]
 Output: 3
 Example 2:

 Input: [1, 2, 3, -4]
 Output: 0

 */


func largestAbsouteNumber(_ array:[Int]) -> Int {
    var max = 0
    
    for number in array where array.contains(number * -1) {
        
        if number > max || (number * -1) > max {
            max = number
        }
    }
    print("largestAbsouteNumber:\(max)")
    return max
}

//let numbs = [3, 2, -2, 5, -3]
let numbs = [1, 2, 3, -4]
largestAbsouteNumber(numbs)



/*
 http://leetcode.libaoj.in/maximum-length-of-a-concatenated-string-with-unique-characters.html
 
 1239. Maximum Length of a Concatenated String with Unique Characters
 Medium

 1040

 96

 Add to List

 Share
 Given an array of strings arr. String s is a concatenation of a sub-sequence of arr which have unique characters.

 Return the maximum possible length of s.

  

 Example 1:

 Input: arr = ["un","iq","ue"]
 Output: 4
 Explanation: All possible concatenations are "","un","iq","ue","uniq" and "ique".
 Maximum length is 4.
 Example 2:

 Input: arr = ["cha","r","act","ers"]
 Output: 6
 Explanation: Possible solutions are "chaers" and "acters".
 Example 3:

 Input: arr = ["abcdefghijklmnopqrstuvwxyz"]
 Output: 26
 */


private func hasUniqueCharacters(_ s: String) -> Bool {
    let sArray = Array(s)
    let sSet: Set<Character> = Set(sArray)
    return (s.count == sSet.count)
}


func maxLength(_ arr: [String]) -> Int {
    var maxLength: Int = 0
    
    var allPossibles: [String] = [""]
    var uniqueArr: [String] = []
    for s in arr {
        if hasUniqueCharacters(s) {
            uniqueArr.append(s)
        }
    }
    print(uniqueArr)
    
    
    for s in uniqueArr {
        var concate: [String] = []
        for ap in allPossibles {
            let temp = s + ap
            if hasUniqueCharacters(temp) {
                if temp.count > maxLength {
                    maxLength = temp.count
                }
                concate.append(temp)
            }
        }
        allPossibles += concate
    }
    
    print(allPossibles)
    
    return maxLength
}

let arr = ["un","iq","ue"] //4
//let arr = ["cha","r","act","ers"] //6

maxLength(arr)



/*
1304. Find N Unique Integers Sum up to Zero
Easy

653

352

Add to List

Share
Given an integer n, return any array containing n unique integers such that they add up to 0.

 

Example 1:

Input: n = 5
Output: [-7,-1,1,3,4]
Explanation: These arrays also are accepted [-5,-1,1,2,3] , [-3,-1,2,-2,4].
Example 2:

Input: n = 3
Output: [-1,0,1]
Example 3:

Input: n = 1
Output: [0]
 

Constraints:

1 <= n <= 1000

*/

func sumZero(_ n: Int) -> [Int] {
    
    var res: [Int] = Array.init(repeating: 0, count: n)
    for i in 0..<n/2 {
        let number = n - i
        res[i] = number
        res[n - i - 1] = (-1) * number
    }
    
    return res
}

print(sumZero(4))


//https://kalkicode.com/k-partition-equal-sum
//https://www.geeksforgeeks.org/partition-set-k-subsets-equal-sum/



//////////////

/*
 206. Reverse Linked List
 Easy

 7609

 143

 Add to List

 Share
 Given the head of a singly linked list, reverse the list, and return the reversed list.

  

 Example 1:


 Input: head = [1,2,3,4,5]
 Output: [5,4,3,2,1]
 Example 2:


 Input: head = [1,2]
 Output: [2,1]
 Example 3:

 Input: head = []
 Output: []
  

 Constraints:

 The number of nodes in the list is the range [0, 5000].
 -5000 <= Node.val <= 5000
 
 */
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    
    func reverseList(_ head: ListNode?) -> ListNode? {
        guard head != nil else { return nil }
        var tail: ListNode?
        var headNode = head
        while let head = headNode {
            let tailRef = head.next
            head.next = tail
            tail = head
            headNode = tailRef
        }
        return tail

    }
}
