import UIKit

/*
 //https://www.geeksforgeeks.org/count-pairs-difference-equal-k/
 Count all distinct pairs with difference equal to k
 Difficulty Level : Medium
 Last Updated : 18 Jun, 2021
 Given an integer array and a positive integer k, count all distinct pairs with differences equal to k.

 Examples:

 Input: arr[] = {1, 5, 3, 4, 2}, k = 3
 Output: 2
 There are 2 pairs with difference 3, the pairs are {1, 4} and {5, 2}

 Input: arr[] = {8, 12, 16, 4, 0, 20}, k = 4
 Output: 5
 There are 5 pairs with difference 4, the pairs are {0, 4}, {4, 8},
 {8, 12}, {12, 16} and {16, 20}
 
 We can find the count in O(nLogn) time using a O(nLogn) sorting algorithm like Merge Sort, Heap Sort, etc. Following are the detailed steps.

 1) Initialize count as 0
 2) Sort all numbers in increasing order.
 3) Remove duplicates from array.
 4) Do following for each element arr[i]
    a) Binary Search for arr[i] + k in subarray from i+1 to n-1.
    b) If arr[i] + k found, increment count.
 5) Return count.
 */


func countPairsWithDiffK(_ numbers: inout [Int], k: Int)-> Int {
    
    guard numbers.count > 1 else {
        return 0
    }
    
    var count = 0
    numbers.sort()
    var l = 0
    var r = 0
    
    while r < numbers.count {
        
        if (numbers[r] - numbers[l]) == k {
            count += 1
            l += 1
            r += 1
        } else if (numbers[r] - numbers[l]) > k {
            l += 1
//        } else if (numbers[r] - numbers[l]) < k {
        } else {
            r += 1
        }
    }
    return count
}

var input1 = [1, 5, 3, 4, 2]
countPairsWithDiffK(&input1, k: 3) //{1, 4} and {5, 2}
var input2 = [8, 12, 16, 4, 0, 20]
countPairsWithDiffK(&input2, k: 4)
//{0, 4}, {4, 8}, {8, 12}, {12, 16} and {16, 20}


//https://leetcode.com/problems/k-diff-pairs-in-an-array/
/*
 Given an array of integers nums and an integer k, return the number of unique k-diff pairs in the array.

 A k-diff pair is an integer pair (nums[i], nums[j]), where the following are true:

 0 <= i < j < nums.length
 |nums[i] - nums[j]| == k
 Notice that |val| denotes the absolute value of val.

  

 Example 1:

 Input: nums = [3,1,4,1,5], k = 2
 Output: 2
 Explanation: There are two 2-diff pairs in the array, (1, 3) and (3, 5).
 Although we have two 1s in the input, we should only return the number of unique pairs.
 Example 2:

 Input: nums = [1,2,3,4,5], k = 1
 Output: 4
 Explanation: There are four 1-diff pairs in the array, (1, 2), (2, 3), (3, 4) and (4, 5).
 Example 3:

 Input: nums = [1,3,1,5,4], k = 0
 Output: 1
 Explanation: There is one 0-diff pair in the array, (1, 1).
 Example 4:

 Input: nums = [1,2,4,4,3,3,0,9,2,3], k = 3
 Output: 2
 Example 5:

 Input: nums = [-1,-2,-3], k = 1
 Output: 2
  

 Constraints:

 1 <= nums.length <= 104
 -107 <= nums[i] <= 107
 0 <= k <= 107
 */


func findPairs(_ nums: [Int], _ k: Int) -> Int {
   
   guard nums.count > 1 else {
       return 0
   }
   
   let numbers = nums.sorted()
   var pairs: [Int : Int] = [:]
   var l = 0
   var r = 1
   
   while r < numbers.count {
       let diff = numbers[r] - numbers[l]
       
       if diff == k {
           pairs[numbers[l]] = numbers[r]
           l += 1
           r += 1
       } else if diff > k {
           l += 1
       } else {
           r += 1
       }
       
       if l == r {
           r += 1
       }
   }
   return pairs.count
}


