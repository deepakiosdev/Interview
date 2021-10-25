import UIKit

//https://leetcode.com/problems/jump-game-ii/

/*
 Given an array of non-negative integers nums, you are initially positioned at the first index of the array.

 Each element in the array represents your maximum jump length at that position.

 Your goal is to reach the last index in the minimum number of jumps.

 You can assume that you can always reach the last index.


 Example 1:

 Input: nums = [2,3,1,1,4]
 Output: 2
 Explanation: The minimum number of jumps to reach the last index is 2. Jump 1 step from index 0 to 1, then 3 steps to the last index.
 Example 2:

 Input: nums = [2,3,0,1,4]
 Output: 2
 */
//

func jump(_ nums: [Int]) -> Int {
    
    if nums.count == 1 {
        return 0
    }
    
    var currentReach = 0
    var jumps = 0
    var maxReach = 0
    
    //nums.count - 1 (Because we do need to find jumbs before the last elements to reach last index )
    for index in 0..<nums.count - 1 {
        
        if (index + nums[index]) > maxReach {
            maxReach = index + nums[index]
        }
        
        //This step is optional its increase memory usase
        if maxReach >= nums.count - 1 {
            jumps += 1
            return jumps
        }

        if currentReach == index {
            currentReach = maxReach
            jumps += 1
        }
    }
    return jumps
}

/*
 55. Jump Game
 Medium

 You are given an integer array nums. You are initially positioned at the array's first index, and each element in the array represents your maximum jump length at that position.

 Return true if you can reach the last index, or false otherwise.

  

 Example 1:

 Input: nums = [2,3,1,1,4]
 Output: true
 Explanation: Jump 1 step from index 0 to 1, then 3 steps to the last index.
 Example 2:

 Input: nums = [3,2,1,0,4]
 Output: false
 Explanation: You will always arrive at index 3 no matter what. Its maximum jump length is 0, which makes it impossible to reach the last index.
  

 Constraints:

 1 <= nums.length <= 104
 0 <= nums[i] <= 105

 */

//https://www.youtube.com/watch?v=muDPTDrpS28

func canJump(_ nums: [Int]) -> Bool {
    var maxReach = 0
    
    for (index, number) in nums.enumerated() {
        
        if index > maxReach {
            return false
        }
        maxReach = max(maxReach, index + number)
    }
    return true
}

//var nums = [3,2,1,0,4]//false
var nums = [2,3,1,1,4] //true
print("canJump:\(canJump(nums))")


/*
 https://leetcode.com/problems/min-cost-climbing-stairs/
 
 746. Min Cost Climbing Stairs
 You are given an integer array cost where cost[i] is the cost of ith step on a staircase. Once you pay the cost, you can either climb one or two steps.

 You can either start from the step with index 0, or the step with index 1.

 Return the minimum cost to reach the top of the floor.

  
 Example 1:

 Input: cost = [10,15,20]
 Output: 15
 Explanation: Cheapest is: start on cost[1], pay that cost, and go to the top.
 Example 2:

 Input: cost = [1,100,1,1,1,100,1,1,100,1]
 Output: 6
 Explanation: Cheapest is: start on cost[0], and only step on 1s, skipping cost[3].
 */

func minCostClimbingStairs1(_ cost: inout [Int]) -> Int {

    for index in 2..<cost.count {
        cost[index] += min(cost[index - 1], cost[index - 2])
    }
    return min(cost[cost.count - 1], cost[cost.count - 2])
}

//var cost = [10,15,20] //15
var cost = [1,100,1,1,1,100,1,1,100,1] //6

print("minCostClimbingStairs1:\(minCostClimbingStairs1(&cost))")

func minCostClimbingStairs(_ cost: [Int]) -> Int {
    var step1 = cost[0]
    var step2 = cost[1]

    for index in 2..<cost.count {
        let currentCost = cost[index] +  min(step1, step2)
        step1 = step2
        step2 = currentCost
    }
    return min(step1, step2)
}

/*
 https://youtube.com/watch?v=97Esq1mqZGg
 
 https://leetcode.com/problems/climbing-stairs/
 70. Climbing Stairs
 Easy

 You are climbing a staircase. It takes n steps to reach the top.

 Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

  

 Example 1:

 Input: n = 2
 Output: 2
 Explanation: There are two ways to climb to the top.
 1. 1 step + 1 step
 2. 2 steps
 Example 2:

 Input: n = 3
 Output: 3
 Explanation: There are three ways to climb to the top.
 1. 1 step + 1 step + 1 step
 2. 1 step + 2 steps
 3. 2 steps + 1 step
  

 Constraints:

 1 <= n <= 45
 */

func climbStairs(_ n: Int) -> Int {
    
    if n == 1 {
        return 1
    }
    var steps = Array(repeating: 0, count: n + 1)
    steps[0] = 1
    steps[1] = 1
    
    for index in 2...n {
        steps[index] = steps[index - 1] + steps[index - 2]
    }
    return steps[n]
}

var stairs = 1

print("climbStairs:\(climbStairs(stairs))")

