import Foundation

/*
 Binary search
 https://leetcode.com/problems/binary-search/
 Time Complexity - O(log N) for both recursive & iterative
 Space Complexity - O(log N) for recursive & O(1) for iterative
 */

class Solution {
    func binarySearch(array: [Int], target: Int) -> Int {
        //return binarySearchHelper(array: array, target: target, left: 0, right: array.count - 1)
        var left = 0
        var right = array.count - 1
        return binarySearchHelperIterative(array: array, target: target, left: &left, right: &right)
    }
    //recursive
    func binarySearchHelper(array: [Int], target: Int, left: Int, right: Int) -> Int {
        if left > right {
            return -1
        }
        let middle = (left + right) / 2
        let potentialMatch = array[middle]
        if potentialMatch == target {
            return middle
        } else if target < potentialMatch {
            return binarySearchHelper(array: array, target: target, left: left, right: middle - 1)
        } else {
            return binarySearchHelper(array: array, target: target, left: middle + 1, right: right)
        }
    }
    
    //iterative
    func binarySearchHelperIterative(array: [Int], target: Int, left: inout Int, right: inout Int) -> Int {
        while left <= right {
            let middle = (left + right) / 2
            let potentialMatch = array[middle]
            if potentialMatch == target {
                return middle
            } else if target < potentialMatch {
                right = middle - 1
            } else {
                left = middle + 1
            }
        }
        return -1
    }
}

let sol = Solution()
let idxOfmatchedTarget = sol.binarySearch(array: [0, 1, 21, 32, 45, 45, 61, 71, 72, 79], target: 2)
print("idxOfmatchedTarget is \(idxOfmatchedTarget)")


