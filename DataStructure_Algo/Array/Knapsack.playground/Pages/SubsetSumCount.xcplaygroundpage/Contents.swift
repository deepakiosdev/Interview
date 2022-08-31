//: [Previous](@previous)

import Foundation

func countOfSubsetSum(_ nums: [Int], target: Int) -> Int {

    let size = nums.count
    var dp = Array.init(repeating: Array.init(repeating: 0, count: target + 1), count: size + 1)

    for i in 0...size {
        for j in 0...target {
            if i == 0 || j == 0 {
                if j == 0 {
                    dp[i][j] = 1
                }
            } else if nums[i - 1] <= j {
                dp[i][j] = dp[i - 1][j - nums[i-1]] + dp[i - 1][j]
            } else {
                dp[i][j] = dp[i - 1][j]
            }
        }
    }
    return dp[size][target]
}


print(countOfSubsetSum([2, 3, 5, 6, 8, 10], target: 10))
//: [Next](@next)
