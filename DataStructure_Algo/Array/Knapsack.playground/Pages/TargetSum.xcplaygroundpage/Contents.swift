//: [Previous](@previous)

import Foundation

//http://www.noobyard.com/article/p-mkwpcqig-me.html
//https://www.youtube.com/watch?v=34l1kTIQCIA

/*
 https://leetcode.com/problems/target-sum/
 
 494. Target Sum
 Medium

 5837

 227

 Add to List

 Share
 You are given an integer array nums and an integer target.

 You want to build an expression out of nums by adding one of the symbols '+' and '-' before each integer in nums and then concatenate all the integers.

 For example, if nums = [2, 1], you can add a '+' before 2 and a '-' before 1 and concatenate them to build the expression "+2-1".
 Return the number of different expressions that you can build, which evaluates to target.

  

 Example 1:

 Input: nums = [1,1,1,1,1], target = 3
 Output: 5
 Explanation: There are 5 ways to assign symbols to make the sum of nums be target 3.
 -1 + 1 + 1 + 1 + 1 = 3
 +1 - 1 + 1 + 1 + 1 = 3
 +1 + 1 - 1 + 1 + 1 = 3
 +1 + 1 + 1 - 1 + 1 = 3
 +1 + 1 + 1 + 1 - 1 = 3
 Example 2:

 Input: nums = [1], target = 1
 Output: 1
 
 Example 3:
 Input: nums = [100], target = -200
 Output: 0

 */

func findTargetSumWays1(_ nums: [Int], _ S: Int) -> Int {
    var sum:Int = 0
    for n in nums
    {
        sum += n
    }
    return sum < S || (S + sum) % 2 > 0 ? 0 : subsetSum(nums, (S + sum) >> 1)
}

func subsetSum(_ nums: [Int], _ S: Int) -> Int {
    //print("S---:\(S)")
    var dp:[Int] = [Int](repeating:0,count:S + 1)
    dp[0] = 1
    
    for n in nums {
        if n <= S
        {
            for i in (n...S).reversed() {
                dp[i] += dp[i - n]
            }
        }
    }
   // print(dp)
    return dp[S]
}

//print(findTargetSumWays1([1,1,1,1,1], 3))


//////////////////////

func countOfSubsetSum(_ nums: [Int], target: Int) -> Int {

    let size = nums.count
    var dp = Array.init(repeating: Array.init(repeating: 0, count: target + 1), count: size + 1)

    for i in 0...size {
        dp[i][0] = 1
    }
    
    for i in 1...size {

        for j in 0...target {
            if nums[i - 1] <= j {
               dp[i][j] = dp[i - 1][j - nums[i-1]] + dp[i - 1][j]
           } else {
               dp[i][j] = dp[i - 1][j]
           }
        }
    }
    return dp[size][target]
}

func findTargetSumWays(_ nums: [Int], _ S: Int) -> Int {

    if nums.isEmpty {
        return 0
    }
    let sum = nums.reduce(0, +)
    
    if sum < S {
        return 0
    }
    //For odd sum
    if (S + sum) % 2 != 0 {
        return 0
    }
    
    let subsetCount = (S + sum) / 2
    
    if subsetCount < 0 {
        return 0
    }
    
    let count = countOfSubsetSum(nums, target: subsetCount)
    return count
}

print(findTargetSumWays([1,1,1,1,1], 3)) //5
print(findTargetSumWays([1], 2)) // 0
print(findTargetSumWays([1, 0], 1)) // Expected output -: 2
print(findTargetSumWays([0,0,0,0,0,0,0,0,1], 1)) // Expected output -: 256

print(findTargetSumWays([1,2,1], 0)) // Expected output -: 2

//: [Next](@next)


/////////



