/*
 https://leetcode.com/problems/plus-one/
 66. Plus One
 Easy

 You are given a large integer represented as an integer array digits, where each digits[i] is the ith digit of the integer. The digits are ordered from most significant to least significant in left-to-right order. The large integer does not contain any leading 0's.

 Increment the large integer by one and return the resulting array of digits.

  

 Example 1:

 Input: digits = [1,2,3]
 Output: [1,2,4]
 Explanation: The array represents the integer 123.
 Incrementing by one gives 123 + 1 = 124.
 Thus, the result should be [1,2,4].
 Example 2:

 Input: digits = [4,3,2,1]
 Output: [4,3,2,2]
 Explanation: The array represents the integer 4321.
 Incrementing by one gives 4321 + 1 = 4322.
 Thus, the result should be [4,3,2,2].
 Example 3:

 Input: digits = [0]
 Output: [1]
 Explanation: The array represents the integer 0.
 Incrementing by one gives 0 + 1 = 1.
 Thus, the result should be [1].
 Example 4:

 Input: digits = [9]
 Output: [1,0]
 Explanation: The array represents the integer 9.
 Incrementing by one gives 9 + 1 = 10.
 Thus, the result should be [1,0].
  

 Constraints:

 1 <= digits.length <= 100
 0 <= digits[i] <= 9
 digits does not contain any leading 0's.
 */

func plusOne1(_ digits: [Int]) -> [Int] {
    
    guard digits.count > 0 else {
        return []
    }
    var numbers = digits
    var carry = 0
    for i in 0..<digits.count {
        
        var lastDigit = numbers[digits.count - 1 - i]
        
        if i == 0 {
            lastDigit += 1
        }
        lastDigit += carry
        
        if lastDigit == 10 {
            numbers[digits.count - 1 - i] = 0
            carry = 1
            
            if i == digits.count - 1 {
                numbers = [1] + numbers
            }
        } else {
            numbers[digits.count - 1 - i] = lastDigit
            break
        }
    }
    return numbers
}

//Its better solution
func plusOne(_ digits: [Int]) -> [Int] {
    
    guard digits.count > 0 else {
        return []
    }
    var numbers = digits
    for i in stride(from: (digits.count - 1), through: 0, by: -1) {
        print(i)
        if numbers[i] < 9 {
            numbers[i] = numbers[i] + 1
            return numbers
        }
        numbers[i] = 0
    }
    numbers = [1] + numbers
    return numbers
}

//print(plusOne([1,2,3]))
//print(plusOne([1]))
//print(plusOne([9]))
//print(plusOne([9,9]))
print(plusOne([1,2,4,9]))


