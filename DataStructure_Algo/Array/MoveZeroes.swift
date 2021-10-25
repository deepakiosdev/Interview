/*
    Question - Move Zeroes
    Link - > https://leetcode.com/problems/move-zeroes/
 
 Example 1:

 Input: nums = [0,1,0,3,12]
 Output: [1,3,12,0,0]
 Example 2:

 Input: nums = [0]
 Output: [0]

 */

class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var nonZeroIdx: Int = 0
        
        for num in nums where num != 0 {
            nums[nonZeroIdx] = num
            nonZeroIdx += 1
        }
        
        while nonZeroIdx < nums.count {
            nums[nonZeroIdx] = 0
            nonZeroIdx += 1
        }
    }
}

//can be done by swapping as well
//Reference:- https://www.youtube.com/watch?v=0rPuILjoVsg&feature=emb_logo

//Asked me in Cavista mettl test

func moveZeroesBySwap(_ nums: inout [Int]) {
    guard nums.count > 1 else {
        return
    }
    var nonZeroIdx: Int = 0
    for (index, num) in nums.enumerated() where num != 0 {
        (nums[nonZeroIdx], nums[index]) = (nums[index], nums[nonZeroIdx])
        nonZeroIdx += 1
    }
}

var nums = [0,1,0,3,12]
moveZeroesBySwap(&nums)
