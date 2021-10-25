/*
https://leetcode.com/problems/maximum-subarray/
Maximum Subarray
Level: Easy
Find the contiguous subarray within an array (containing at least one number) which has the largest sum.
For example, given the array [−2,1,−3,4,−1,2,1,−5,4],
the contiguous subarray [4,−1,2,1] has the largest sum = 6.
*/

func maxAndMinSubArray(_ n: [Int]) -> Int {
    
    let nums: [Int] = n
    var best: Int = nums[0]
    var worst: Int = nums[0]
    var currentBest: Int = nums[0]
    var currentWorst: Int = nums[0]
    
    for i in 1..<nums.count {
        currentBest = max(currentBest + nums[i], nums[i])
        currentWorst = min(currentWorst + nums[i], nums[i])
        best = max(currentBest, best)
        //currentBest = best for not continuos
       
        worst = min(currentWorst, worst)
        //currentWorst = worst for not continuos
    }
    
    print("best is:\(best)")
    print("worst is:\(worst)")
    print(best-worst)
    return best - worst
    
}

maxAndMinSubArray([-2,1,-3,4,-1,2,1,-5,4])
//maxSubArray([-2, 4, 28, -66, 5, 0])
//maxAndMinSubArray([2,2,2,2])
maxAndMinSubArray([4,-1,-3, 8, -4])

