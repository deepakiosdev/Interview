//: [Previous](@previous)

import Foundation

//https://www.youtube.com/watch?v=34l1kTIQCIA
//https://www.youtube.com/watch?v=_gPcYovP7wc
//https://www.youtube.com/watch?v=obhWqDfzwQQ
//http://www.noobyard.com/article/p-ezxbmuir-cq.html - Swift solution

/*
 https://leetcode.com/problems/partition-equal-subset-sum/
 416. Partition Equal Subset Sum
 Medium

 6537

 108

 Add to List

 Share
 Given a non-empty array nums containing only positive integers, find if the array can be partitioned into two subsets such that the sum of elements in both subsets is equal.

  

 Example 1:

 Input: nums = [1,5,11,5]
 Output: true
 Explanation: The array can be partitioned as [1, 5, 5] and [11].
 Example 2:

 Input: nums = [1,2,3,5]
 Output: false
 Explanation: The array cannot be partitioned into equal sum subsets.
 
 */
//This one is better than below
func canPartition1(_ nums: [Int]) -> Bool {
    var nums = nums
    if nums.count == 0 {
        return true
    }
    var sum = 0
    nums = nums.sorted()
    for num in nums {
        sum += num
    }
    if sum % 2 != 0 {
        return false
    }
    sum = sum / 2
    if nums.last! > sum {
        return false
    }
    var dp = [Bool](repeating: false, count: sum + 1)
    dp[0] = true
    for i in 1...nums.count {
        for j in (nums[i - 1]...sum).reversed() {
            dp[j] = dp[j] || dp[j - nums[i - 1]]
        }
    }
    return dp[sum]
}

func canPartition(_ nums: [Int]) -> Bool {
    
    if nums.isEmpty {
        return true
    }
    var target = nums.reduce(0,+)

    if target % 2 != 0 {
        return false
    }
    
    if target != 0 {
        target = target / 2
    }
    
    let size = nums.count
    var dp = Array.init(repeating: Array.init(repeating: false, count: target + 1), count: size + 1)

    for i in 0...size {
        for j in 0...target {
            if i == 0 || j == 0 {
                if j == 0 {
                    dp[i][j] = true
                }
            } else if nums[i - 1] <= j {
                dp[i][j] = dp[i - 1][j - nums[i-1]] || dp[i - 1][j]
            } else {
                dp[i][j] = dp[i - 1][j]
            }
        }
    }

    return dp[size][target]
}


print(canPartition([2,2,1,1]))
print(canPartition([1,2,5]))
print(canPartition([14,9,8,4,3,2]))
print(canPartition([1,5,11,5]))


//: [Next](@next)
