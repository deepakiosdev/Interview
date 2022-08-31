//: [Previous](@previous)

import Foundation

func subsetSum(_ nums: [Int], sum: Int) -> Bool {
    
    if sum == 0 {
        return true
    }
    
    if nums.isEmpty {
        return false
    }
    // The value of subset[i][j] will be true if there is a
    // subset of set[0..j-1] with sum equal to i
    let size = nums.count
    var subset = Array.init(repeating: Array.init(repeating: false, count: sum + 1), count: size + 1)

    for i in 0...size {
        for j in 0...sum {
            if i == 0 || j == 0 {
                if j == 0 {
                    subset[i][j] = true  // If sum is 0, then answer is true
                }
            } else if nums[i - 1] <= j {
                subset[i][j] = subset[i - 1][j - nums[i-1]] || subset[i - 1][j]
            } else {
                subset[i][j] = subset[i - 1][j]
            }
        }
    }
    return subset[size][sum]
}

print(subsetSum([3, 34, 4, 12, 5, 2], sum: 9))
print(subsetSum([2,2,1,1], sum: 3))
print(subsetSum([1,2,5], sum: 3))
print(subsetSum([14,9,8,4,3,2], sum: 10))

//: [Next](@next)
