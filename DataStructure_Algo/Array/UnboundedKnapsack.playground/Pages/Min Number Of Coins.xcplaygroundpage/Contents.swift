//: [Previous](@previous)

import Foundation


func countOfSubsetSum(_ coins: [Int], target: Int) -> Int {

    let size = coins.count
    var dp = Array.init(repeating: Array.init(repeating: 0, count: target + 1), count: size + 1)

    for j in 0...target {
        dp[0][j] = Int.max - 1
    }
    
    //Fill second row
    for j in 1...target {
        
        if j % coins[0] == 0 {
            dp[1][j] = j / coins[0]
        } else {
            dp[1][j] = Int.max - 1
        }
    }

    for i in 2...size {
        for j in 0...target {
            if coins[i - 1] <= j {
               dp[i][j] = min(1 + dp[i][j - coins[i-1]], dp[i - 1][j])
           } else {
               dp[i][j] = dp[i - 1][j]
           }
        }
    }
    return dp[size][target]
}

func minimumNumberOfCoins(_ amount: Int, _ coins: [Int]) -> Int {

    if coins.isEmpty {
        return 0
    }
    let count = countOfSubsetSum(coins, target: amount)
    return count
}

print(minimumNumberOfCoins(4, [1,2,3])) //2
print(minimumNumberOfCoins(5, [1,2,5])) //1
print(minimumNumberOfCoins(3, [2])) //0



//: [Next](@next)
