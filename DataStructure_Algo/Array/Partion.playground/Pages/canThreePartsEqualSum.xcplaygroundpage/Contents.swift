//: [Previous](@previous)

import Foundation
/*
1013. Partition Array Into Three Parts With Equal Sum
Easy

976

109

Add to List

Share
Given an array of integers arr, return true if we can partition the array into three non-empty parts with equal sums.

Formally, we can partition the array if we can find indexes i + 1 < j with (arr[0] + arr[1] + ... + arr[i] == arr[i + 1] + arr[i + 2] + ... + arr[j - 1] == arr[j] + arr[j + 1] + ... + arr[arr.length - 1])

 

Example 1:

Input: arr = [0,2,1,-6,6,-7,9,1,2,0,1]
Output: true
Explanation: 0 + 2 + 1 = -6 + 6 - 7 + 9 + 1 = 2 + 0 + 1
Example 2:

Input: arr = [0,2,1,-6,6,7,9,-1,2,0,1]
Output: false
Example 3:

Input: arr = [3,3,6,5,-2,2,5,1,-9,4]
Output: true
Explanation: 3 + 3 = 6 = 5 - 2 + 2 + 5 + 1 - 9 + 4
*/


func canThreePartsEqualSum(_ arr: [Int]) -> Bool {
    
    if arr.count < 3  {
        return false
    }
    
    let arSum = arr.reduce(0,+)
    if arSum % 3 != 0 {
        return false
    }
    
    var currentSum = 0
    var count = 0
    var partSum = 0
    
    if arSum != 0 {
        partSum = arSum / 3
    }
        
    for num in arr {
       
        currentSum += num
        if currentSum == partSum {
            currentSum = 0
            count += 1
        }
        
        if count >= 3 {
            return true
        }
    }
    return false
}

//: [Next](@next)
