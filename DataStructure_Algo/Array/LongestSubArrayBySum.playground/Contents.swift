
func lognestSubArrayBySum(_ nums: [Int], sum: Int) -> ArraySlice<Int> {
    var subArrayIndex = [-1]
    
    if nums.count < 2 {
        return [-1]
    }
    
    var left = 0
    var right = 0
    var currentSum = 0
    
    while right < nums.count {
        if (currentSum + nums[right]) <= sum {
            currentSum += nums[right]
            right += 1
        } else if (currentSum + nums[right]) > sum {
            currentSum -= nums[left]
            left += 1
        }
        
        if currentSum == sum && (subArrayIndex.count == 1 || (right - 1 - left) > (subArrayIndex[1] - subArrayIndex[0])) {
            subArrayIndex = [left, right - 1]
        }
    }
    
    if subArrayIndex.count == 2 {
        return nums[subArrayIndex[0]...subArrayIndex[1]]
    }
    
   return [-1]
}

var sum = 15
//var inputArry = [1,2,3,4,5,6,7,8,9,10] //[1, 2, 3, 4, 5]
var inputArry = [1,2,3,4,5,0,0,0, 6,7,8,9,10] //[1, 2, 3, 4, 5, 0, 0, 0]
let lognestSubArray = lognestSubArrayBySum(inputArry, sum: sum)
print(lognestSubArray)

//https://leetcode.com/problems/subarray-sum-equals-k/submissions/

/*
 https://leetcode.com/problems/subarray-sum-equals-k/
 
 https://www.youtube.com/watch?v=HbbYPQc-Oo4
 560. Subarray Sum Equals K

 Given an array of integers nums and an integer k, return the total number of continuous subarrays whose sum equals to k.

  

 Example 1:

 Input: nums = [1,1,1], k = 2
 Output: 2
 Example 2:

 Input: nums = [1,2,3], k = 3
 Output: 2
  

 Constraints:

 1 <= nums.length <= 2 * 104
 -1000 <= nums[i] <= 1000
 -107 <= k <= 107

 */
//Not working solution

func subarraySum(_ nums: [Int], _ k: Int) -> Int {
    var count = 0

    if nums.count < 2 {
        return count
    }
    let array = nums.sorted()
    var left = 0
    var right = 0
    var currentSum = 0
    
    while right < array.count {
        
        if (currentSum + array[right]) < k {
            currentSum += array[right]
            right += 1
        } else if (currentSum + array[right]) > k {
            currentSum -= array[left]
            left += 1
        } else {
            count += 1
            right += 1
        }
    }
   
   return count
}
    
print(subarraySum([1,1,1], 2))
print(subarraySum([1,2,3], 3))

/*https://leetcode.com/problems/maximum-subarray/
 53. Maximum Subarray
 Easy
 Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.

 A subarray is a contiguous part of an array.

  

 Example 1:

 Input: nums = [-2,1,-3,4,-1,2,1,-5,4]
 Output: 6
 Explanation: [4,-1,2,1] has the largest sum = 6.
 Example 2:

 Input: nums = [1]
 Output: 1
 Example 3:

 Input: nums = [5,4,-1,7,8]
 Output: 23
  

 Constraints:

 1 <= nums.length <= 105
 -104 <= nums[i] <= 104
  

 Follow up: If you have figured out the O(n) solution, try coding another solution using the divide and conquer approach, which is more suibtle.
 */
func maxSubArray(_ nums: [Int]) -> Int {
    var maxSum = 0
    var currentSum = 0
   
    for number in nums {

        currentSum = max(currentSum + number, number)
        maxSum = max(maxSum, currentSum)
    }
    return maxSum
}

print(maxSubArray([-2,1,-3,4,-1,2,1,-5,4]))




//https://leetcode.com/problems/continuous-subarray-sum/
/*
 523. Continuous Subarray Sum
 Given an integer array nums and an integer k, return true if nums has a continuous subarray of size at least two whose elements sum up to a multiple of k, or false otherwise.

 An integer x is a multiple of k if there exists an integer n such that x = n * k. 0 is always a multiple of k.

  

 Example 1:

 Input: nums = [23,2,4,6,7], k = 6
 Output: true
 Explanation: [2, 4] is a continuous subarray of size 2 whose elements sum up to 6.
 Example 2:

 Input: nums = [23,2,6,4,7], k = 6
 Output: true
 Explanation: [23, 2, 6, 4, 7] is an continuous subarray of size 5 whose elements sum up to 42.
 42 is a multiple of 6 because 42 = 7 * 6 and 7 is an integer.
 Example 3:

 Input: nums = [23,2,6,4,7], k = 13
 Output: false
  

 Constraints:

 1 <= nums.length <= 105
 0 <= nums[i] <= 109
 0 <= sum(nums[i]) <= 231 - 1
 1 <= k <= 231 - 1
 */

func checkSubarraySum(_ nums: [Int], _ k: Int) -> Bool {
    
    var map = [Int: Int]()
    map[0] = -1
    var runningSum = 0
    for i in 0..<nums.count {
        runningSum += nums[i]
        if k != 0 {
            runningSum %= k
        }
        let pre = map[runningSum]
        if pre != nil {
            if (i - pre!) > 1 { return true}
        } else {
            map[runningSum] = i
        }
    }
    return false
}
print(checkSubarraySum([23,2,4,6,6], 7))
