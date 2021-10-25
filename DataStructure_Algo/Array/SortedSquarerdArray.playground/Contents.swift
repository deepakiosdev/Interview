import Foundation

/*
 https://leetcode.com/problems/squares-of-a-sorted-array/
 977. Squares of a Sorted Array
 Easy
 
 Given an integer array nums sorted in non-decreasing order, return an array of the squares of each number sorted in non-decreasing order.

  

 Example 1:

 Input: nums = [-4,-1,0,3,10]
 Output: [0,1,9,16,100]
 Explanation: After squaring, the array becomes [16,1,0,9,100].
 After sorting, it becomes [0,1,9,16,100].
 Example 2:

 Input: nums = [-7,-3,2,3,11]
 Output: [4,9,9,49,121]
  

 Constraints:

 1 <= nums.length <= 104
 -104 <= nums[i] <= 104
 nums is sorted in non-decreasing order.
 */
func sortedSquares(_ nums: [Int]) -> [Int] {

    guard nums.count > 0 else {
        return []
    }
    
    var sortedArray = Array.init(repeating: 0, count: nums.count)
    var l = 0, r = nums.count - 1, index = nums.count - 1
    
    while l <= r {
        
        if abs(nums[r]) >= abs(nums[l]) {
            sortedArray[index] = nums[r] * nums[r]
            r -= 1
        } else {
            sortedArray[index] = nums[l] * nums[l]
            l += 1
        }
        index -= 1
    }
    return sortedArray
}

print(sortedSquares([-7, -3, -1, 4, 8, 12]))
