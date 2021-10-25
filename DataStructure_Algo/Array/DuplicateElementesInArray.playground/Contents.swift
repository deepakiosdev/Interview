

/*
 
 https://www.youtube.com/watch?v=aMsSF1Il3IY&t=47s
 
 442. Find All Duplicates in an Array
Medium

4289

198

Add to List

Share
Given an integer array nums of length n where all the integers of nums are in the range [1, n] and each integer appears once or twice, return an array of all the integers that appears twice.

You must write an algorithm that runs in O(n) time and uses only constant extra space.

 

Example 1:

Input: nums = [4,3,2,7,8,2,3,1]
Output: [2,3]
Example 2:

Input: nums = [1,1,2]
Output: [1]
Example 3:

Input: nums = [1]
Output: []
 

Constraints:

n == nums.length
1 <= n <= 105
1 <= nums[i] <= n
Each element in nums appears once or twice.
*/

/*
  Hint - From here 1 <= nums[i] <= n
 
 Value of each element can also be index if you subtract 1
 */

func findDuplicates(_ nums: [Int]) -> [Int] {
     
    guard nums.count > 1 else {
        return []
    }
    var numbers = nums
    var dupArr = [Int]()
    
    for number in numbers {

        let index = abs(number) - 1
        
        if numbers[index] < 0 {
            dupArr.append(index + 1)
        }
        numbers[index] = -numbers[index]
    }
    
    return dupArr
}

print(findDuplicates([4,3,2,7,8,2,3,1]))


/*
 https://www.youtube.com/watch?v=32Ll35mhWg0
 https://leetcode.com/problems/find-the-duplicate-number/
 
 287. Find the Duplicate Number
 Medium

 9541

 972

 Given an array of integers nums containing n + 1 integers where each integer is in the range [1, n] inclusive.

 There is only one repeated number in nums, return this repeated number.

 You must solve the problem without modifying the array nums and uses only constant extra space.

  

 Example 1:

 Input: nums = [1,3,4,2,2]
 Output: 2
 Example 2:

 Input: nums = [3,1,3,4,2]
 Output: 3
 Example 3:

 Input: nums = [1,1]
 Output: 1
 Example 4:

 Input: nums = [1,1,2]
 Output: 1
  

 Constraints:

 1 <= n <= 105
 nums.length == n + 1
 1 <= nums[i] <= n
 All the integers in nums appear only once except for precisely one integer which appears two or more times.
  

 Follow up:

 How can we prove that at least one duplicate number must exist in nums?
 Can you solve the problem in linear runtime complexity?
 */

//Approach 1- Can use brtute force
//Approach 2- Maintain frequency array using dictonary

//Approach 3- Floyd algo or here and tortize

//T - O(N), S - O(1)

func findDuplicate(_ nums: [Int]) -> Int {
    var slow = nums[0], fast = nums[0]
    
    //Find where the elements are colide
    while true {
        slow = nums[slow]
        fast = nums[nums[fast]]
        if slow == fast {
            break
        }
    }
    
    fast = nums[0]
    //Visit fast and slow both with same pace
    while slow != fast {
        slow = nums[slow]
        fast = nums[fast]
        if slow == fast {
            break
        }
    }
    
    return fast
}


//print(findDuplicate([1,3,4,2,2])) //1,1  3,4, 4,2, 2,3, 2,2
//print(findDuplicate([1,1,3,4,2]))
print(findDuplicate([4,3,1,4,2]))



