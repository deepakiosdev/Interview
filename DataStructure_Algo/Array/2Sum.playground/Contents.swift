import UIKit

/**
 * Question Link: https://leetcode.com/problems/two-sum/
 * Primary idea: Traverse the array and store target - nums[i] in a dict
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var dict = [Int: Int]()
    
    for (i, num) in nums.enumerated() {
        if let lastIndex = dict[target - num] {
            return [lastIndex, i]
        }
        
        dict[num] = i
        
    }
    
    fatalError("No valid outputs")
}

func twoSum1(_ nums: [Int], _ target: Int) -> [Int] {
    var dict = [Int:Int]()
    for (index, number) in nums.enumerated() {
        let value = target - number
        if let sum = dict[value] {
            return [sum, index]
        }
        dict[number] = index
    }
    return [0,0]
}

print(twoSum([2, 3, 7, 0], 9))

