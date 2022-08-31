import UIKit
/*
 https://towardsdev.com/knapsack-with-dynamic-programming-in-swift-745b79ac64c6
 https://www.youtube.com/watch?v=l02UxPYRmCQ&list=PL_z_8CaSLPWekqhdCPmFohncHwz8TY2Go&index=2
 https://www.geeksforgeeks.org/0-1-knapsack-problem-dp-10/
 https://medium.com/@fabianterh/how-to-solve-the-knapsack-problem-with-dynamic-programming-eb88c706d3cf
 https://gist.github.com/jchros/cce045d59ef6bceb94379127fb340de5
 */

/*
 https://www.hackerrank.com/contests/srin-aadc03/challenges/classic-01-knapsack/problem
 This is the classic & famous knapsack problem : You are a thief carrying a single knapsack with limited (1 <= S <= 2000) capacity. The museum you stole had (1 <= N <= 2000) artifact that you could steal. Unfortunately you might not be able to steal all the artifact because of your limited knapsack capacity.

 You have to cherry pick the artifact in order to maximize the total value (<= 2000000) of the artifacts you stole.

 Input Format

 On the first line you are given T as the test cases available (1 <= T <= 20). The next T testcases will started with two integer S and N. N lines follow with two integers on each line describing each artifact available at the museum. The first number is the weight of the artifact and the next is the value of the artifact.

 Output Format

 You should output a single integer on one line : the total maximum value from the best choice of artifacts you stole.

 Sample Input

 1
 4 5
 1 8
 2 4
 3 0
 2 5
 2 3

 Sample Output

 13

 Explanation

 The artifact with value 8 and 5 should be picked, summing up the value to the maximum of 13.
 */


func knapSack(weights: [Int], values: [Int], maxW: Int, index: Int) -> Int {
    
    if maxW == 0 || index == 0 {
        return 0
    }
    
    if weights[index - 1] <= maxW {
        return max(values[index - 1] + knapSack(weights: weights, values: values, maxW: maxW - weights[index - 1], index: index - 1), knapSack(weights: weights, values: values, maxW: maxW, index: index - 1))
    } else {
//    } else if weights[index - 1] > maxW  {
        return knapSack(weights: weights, values: values, maxW: maxW, index: index - 1)
    }
}


let result = knapSack(weights: [10, 20, 30], values: [60, 100, 120], maxW: 50, index: 3)

//let result = knapSack(weights: [4, 1, 2, 3, 2, 2], values: [5, 8, 4, 0, 5, 3], maxW: 3, index: 6)

print(result)


////////Memoization///////

func knapSackMemoizationSolution(weights: [Int], values: [Int], maxW: Int, index: Int) -> Int  {
    
    var dp = Array.init(repeating: Array.init(repeating: -1, count: maxW + 1), count: index + 1)
    return knapSackMemoization(weights: weights, values: values, maxW: maxW, index: index, dp: &dp)
}

func knapSackMemoization(weights: [Int], values: [Int], maxW: Int, index: Int, dp: inout [[Int]]) -> Int {
    
    if maxW == 0 || index == 0 {
        return 0
    }
    
    if dp[index][maxW] != -1 {
        return dp[index][maxW]
    }
    
    if weights[index - 1] <= maxW {
        dp[index][maxW] = max(values[index - 1] + knapSack(weights: weights, values: values, maxW: maxW - weights[index - 1], index: index - 1), knapSack(weights: weights, values: values, maxW: maxW, index: index - 1))
    }
    else {
//    else if weights[index - 1] > maxW  {
        dp[index][maxW] = knapSack(weights: weights, values: values, maxW: maxW, index: index - 1)
    }
    return dp[index][maxW]
}


//let result1 = knapSackMemoizationSolution(weights: [10, 20, 30], values: [60, 100, 120], maxW: 50, index: 3)

let result1 = knapSackMemoizationSolution(weights: [4, 1, 2, 3, 2, 2], values: [5, 8, 4, 0, 5, 3], maxW: 3, index: 6)

print(result1)

/////////////DP////////////
/*
Complexity Analysis:

Time Complexity: O(N*W).
Auxiliary Space: O(N*W).
The use of 2D array data structure for storing intermediate states-:
*/

//dp[i - 1][j - weights[i - 1]] -: Include the item
//dp[i - 1][j] -: Exclude the item
func knapSackDP(weights: [Int], values: [Int], maxW: Int) -> Int  {
    
    let size = weights.count
    
    var dp = Array.init(repeating: Array.init(repeating: 0, count: maxW + 1), count: size + 1)
    
    for i in 1...size {
        for j in 1...maxW {

            if weights[i - 1] <= j {

                dp[i][j] = max(values[i - 1] + dp[i - 1][j - weights[i - 1]], dp[i - 1][j])
            } else {
                dp[i][j] = dp[i - 1][j]
            }
        }
    }
    return dp[size][maxW]
}

let result2 = knapSackDP(weights: [10, 20, 30], values: [60, 100, 120], maxW: 50)

//let result2 = knapSackDP(weights: [4, 1, 2, 3, 2, 2], values: [5, 8, 4, 0, 5, 3], maxW: 3)

print(result2)
