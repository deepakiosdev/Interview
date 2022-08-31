import UIKit

/*
 https://www.youtube.com/watch?v=c9imv2LvgWk
 
 1991. Find the Middle Index in Array
 Easy

 256

 12

 Add to List

 Share
 Given a 0-indexed integer array nums, find the leftmost middleIndex (i.e., the smallest amongst all the possible ones).

 A middleIndex is an index where nums[0] + nums[1] + ... + nums[middleIndex-1] == nums[middleIndex+1] + nums[middleIndex+2] + ... + nums[nums.length-1].

 If middleIndex == 0, the left side sum is considered to be 0. Similarly, if middleIndex == nums.length - 1, the right side sum is considered to be 0.

 Return the leftmost middleIndex that satisfies the condition, or -1 if there is no such index.

  

 Example 1:

 Input: nums = [2,3,-1,8,4]
 Output: 3
 Explanation: The sum of the numbers before index 3 is: 2 + 3 + -1 = 4
 The sum of the numbers after index 3 is: 4 = 4
 Example 2:

 Input: nums = [1,-1,4]
 Output: 2
 Explanation: The sum of the numbers before index 2 is: 1 + -1 = 0
 The sum of the numbers after index 2 is: 0
 Example 3:

 Input: nums = [2,5]
 Output: -1
 Explanation: There is no valid middleIndex.

 */

func findMiddleIndex(_ nums: [Int]) -> Int {
    
    var sum = nums.reduce(0, +)
    var leftSum = 0
    
    for (index, num) in nums.enumerated() {
        sum -= num
       // print("index:\(index), leftSum:\(leftSum), sum:\(sum)")
        if leftSum == sum {
            return index
        }
        leftSum += num
    }
    return -1
}

print(findMiddleIndex([2,3,-1,8,4]))
