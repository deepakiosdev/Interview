//: [Previous](@previous)

import Foundation
//https://www.geeksforgeeks.org/partition-a-set-into-two-subsets-such-that-the-difference-of-subset-sums-is-minimum/

func subsetSumDP(_ nums: [Int], sum: Int) -> [[Bool]] {
    
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
    return subset
}

func minimumSubsetSumDifference( nums:[Int]) -> Int {
    
    let sum = nums.reduce(0, +)
    if sum == 0 || nums.isEmpty {
        return 0
    }
    let subsetDP = subsetSumDP(nums, sum: sum)

    var startingSumArr = [Int]()
    var minValue = Int.max
    
    let mid = (sum + 1) / 2
    for i in 0..<mid {
        if subsetDP[nums.count][i] {
            startingSumArr.append(i)
        }
    }
    for num in startingSumArr {
        minValue = min(minValue, sum - 2 * num)
    }
    
    return minValue
}

print(minimumSubsetSumDifference(nums: [2, 2, 7])) //3
print(minimumSubsetSumDifference(nums: [1, 6, 11, 5])) //1
print(minimumSubsetSumDifference(nums: [3, 1, 4, 2, 2, 1]))//1-> //s1 = [3,4] s2 = [1,2,2,1]


//: [Next](@next)
