/*
    Question - Happy Number
    Link - https://leetcode.com/problems/happy-number/
 
 Input: n = 19
 Output: true
 Explanation:
 (1)2 + (9)2 = 82
 (8)2 + (2)2 = 68
 (6)2 + (8)2 = 100
 (1)2 + (0)2 + (0)2 = 1
 */

class Solution {
    func isHappy(_ n: Int) -> Bool {
        var mySet = Set<Int>()
        var num: Int = n
        
        while num != 1 {
            guard !mySet.contains(num) else {
                return false
            }
            mySet.insert(num)
            var temp = 0
            while num != 0 {
                temp += (num % 10) * (num % 10)
                num /= 10
            }
            num = temp
        }
        return true
    }
}
