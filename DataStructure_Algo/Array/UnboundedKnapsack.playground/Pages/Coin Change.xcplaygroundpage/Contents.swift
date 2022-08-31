import UIKit
/*
 https://leetcode.com/problems/coin-change-2/
 518. Coin Change 2
 Medium

 4411

 94

 Add to List

 Share
 You are given an integer array coins representing coins of different denominations and an integer amount representing a total amount of money.

 Return the number of combinations that make up that amount. If that amount of money cannot be made up by any combination of the coins, return 0.

 You may assume that you have an infinite number of each kind of coin.

 The answer is guaranteed to fit into a signed 32-bit integer.

  

 Example 1:

 Input: amount = 5, coins = [1,2,5]
 Output: 4
 Explanation: there are four ways to make up the amount:
 5=5
 5=2+2+1
 5=2+1+1+1
 5=1+1+1+1+1
 Example 2:

 Input: amount = 3, coins = [2]
 Output: 0
 Explanation: the amount of 3 cannot be made up just with coins of 2.
 Example 3:

 Input: amount = 10, coins = [10]
 Output: 1
 */

func countOfSubsetSum(_ nums: [Int], target: Int) -> Int {

    let size = nums.count
    var dp = Array.init(repeating: Array.init(repeating: 0, count: target + 1), count: size + 1)

    for i in 0...size {
        dp[i][0] = 1
    }
    
    for i in 1...size {
        for j in 0...target {
            if nums[i - 1] <= j {
               dp[i][j] = dp[i][j - nums[i-1]] + dp[i - 1][j]
           } else {
               dp[i][j] = dp[i - 1][j]
           }
        }
    }
    return dp[size][target]
}

func change(_ amount: Int, _ coins: [Int]) -> Int {

    if coins.isEmpty {
        return 0
    }
    let count = countOfSubsetSum(coins, target: amount)
    return count
}

print(change(4, [1,2,3])) //4
print(change(5, [1,2,5])) //4
print(change(3, [2])) //0

