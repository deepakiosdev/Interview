
/*
 https://leetcode.com/problems/max-number-of-k-sum-pairs/submissions/
 1679. Max Number of K-Sum Pairs
 Medium

 You are given an integer array nums and an integer k.

 In one operation, you can pick two numbers from the array whose sum equals k and remove them from the array.

 Return the maximum number of operations you can perform on the array.

  
 Example 1:

 Input: nums = [1,2,3,4], k = 5
 Output: 2
 Explanation: Starting with nums = [1,2,3,4]:
 - Remove numbers 1 and 4, then nums = [2,3]
 - Remove numbers 2 and 3, then nums = []
 There are no more pairs that sum up to 5, hence a total of 2 operations.
 Example 2:

 Input: nums = [3,1,3,4,3], k = 6
 Output: 1
 Explanation: Starting with nums = [3,1,3,4,3]:
 - Remove the first two 3's, then nums = [1,4,3]
 There are no more pairs that sum up to 6, hence a total of 1 operation.
  

 Constraints:

 1 <= nums.length <= 105
 1 <= nums[i] <= 109
 1 <= k <= 109
 */

//If no duplicate
func maxOperations1(_ nums: [Int], _ k: Int) -> Int {
   
    guard nums.count > 1 else {
        return 0
    }
    
    var count = 0
    var l = 0, r = nums.count - 1
    let numbers = nums.sorted()
    
    while l < r {
        
        let sum = numbers[r] + numbers[l]
        
        if sum == k {
            count += 1
            l += 1
            r -= 1
        } else if sum > k {
            r -= 1
        } else {
            l += 1
        }
    }
    
    return count
}

let nums = [1,2,3,4]
let k = 5
print(maxOperations1(nums, k))

let nums1 = [3,1,3,4,3], k1 = 6
print(maxOperations1(nums1, k1))


/*
 T - O(N)
 S - O(N)
 */

func maxOperations(_ nums: [Int], _ k: Int) -> Int {
   
    guard nums.count > 1 else {
        return 0
    }
    
    var count = 0
    var pairDict: [Int : Int] = [:]
    
    for number in nums {
        let requiredValue = k - number
       
        if let ct = pairDict[requiredValue] {
            count += 1
            if ct == 1 {
                //print("Removed:\(number), pairDict:\(pairDict), count:\(count)")

                pairDict.removeValue(forKey: requiredValue)
                //print("pairDict:\(pairDict)")

            } else {
                pairDict[requiredValue] = ct - 1
            }
        } else {
            if let ct = pairDict[number] {
                pairDict[number] = ct + 1
            } else {
                pairDict[number] = 1
            }
        }
    }
    return count
}

//print(maxOperations([1,2,3,4], 5))//2

//print(maxOperations([3,1,3,4,3], 6))//1

//print(maxOperations([2,2,2,3,1,1,4,1], 4)) //2

print(maxOperations([2,5,4,4,1,3,4,4,1,4,4,1,2,1,2,2,3,2,4,2], 3)) //4

