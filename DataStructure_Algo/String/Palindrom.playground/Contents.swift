import UIKit

////////
func isPalindrome1(_ value: String) -> Bool
{
    return value == String(value.reversed())
}

///////

func isPalindrome( _ string: String)->Bool {
    
    guard string.count > 1 else {
       return true
    }
    
    let chars = Array(string)
    
    for left in 0..<chars.count/2 {
        if chars[left] != chars[chars.count - left - 1] {
            return false
        }
    }
    return true
    
}

print(isPalindrome("abbccbba"))

////////////
func checkPalindrome(word: String) -> Bool {
    
    let withoutWhiteSpace = word.replacingOccurrences(of: " ", with: "")
    let chars = Array(withoutWhiteSpace)
    for index in  0..<chars.count/2 {
        if chars[index] != chars[chars.count - 1 - index] {
            return false
        }
    }
    return true
}
 
print("checkPalindrome:\(checkPalindrome(word: "Dammit I'm Mad"))")

//////////////////////


func isPalindromNumber( _ number: Int) -> Bool {
    
    var reverseNumber = 0
    var temp = number
    
    while temp > 0 {
        let remainder = temp % 10
        reverseNumber = 10 * reverseNumber + remainder
        temp = temp / 10
    }
    
    return reverseNumber == number
}

print("isPalindromNumber:\(isPalindromNumber(5225))")
/////////////////

/*
 https://leetcode.com/problems/longest-palindromic-substring/solution/
 https://www.geeksforgeeks.org/longest-palindromic-substring-set-2/
 https://github.com/soapyigu/LeetCode-Swift/blob/master/DP/LongestPalindromicSubstring.swift
 */

    /*
    * Primary idea: Find the longest palindrome string from every index at the center.
    * Time Complexity: O(n^2), Space Complexity: O(1)
    *
    */

func longestPalindrome(_ s: String) -> String {
    guard s.count > 1 else {
        return s
    }
    
    let sChars = Array(s)
    var maxLen = 0, start = 0
    
    for i in 0..<sChars.count {
        searchPalindrome(sChars, i, i, &start, &maxLen) //To cunstruct odd length palindrome
        searchPalindrome(sChars, i, i + 1, &start, &maxLen) //To cunstruct even length palindrome
    }
    
    return String(sChars[start..<start + maxLen])
}
    
private func searchPalindrome(_ chars: [Character], _ l: Int, _ r: Int, _ start: inout Int, _ maxLen: inout Int) {
    var left = l, right = r
    
    while left >= 0 && right < chars.count && chars[left] == chars[right] {
        left -= 1
        right += 1
    }
    
    // (right - 1) - (left + 1) + 1 = length of palindrome //Decrease in right because added extra one end of while loop, Increase in left because added decrease one end of while loop. And added one at last bcz start index start with zero

    if right - left - 1 > maxLen {
        start = left + 1
        maxLen = right - left - 1
    }
}

//let str = "abaab"
//let str = "google"

//let str = "geek"
//let str = "aba"
let str = "abaaa"


print(longestPalindrome(str))

/////////////
//https://www.geeksforgeeks.org/find-number-distinct-palindromic-sub-strings-given-string/

func distinctPalindromeSubStrings(_ s: String) -> Set<String> {
    guard s.count > 1 else {
        return [s]
    }
    
    let sChars = Array(s)
    var palindromeSubStrings = Set<String>()
    
    for i in 0..<sChars.count {
        searchPalindrome(sChars, i, i, &palindromeSubStrings)
        searchPalindrome(sChars, i, i + 1, &palindromeSubStrings)
    }
    
    return palindromeSubStrings
}

private func searchPalindrome(_ chars: [Character], _ l: Int, _ r: Int, _ set: inout Set<String>) {
    var left = l, right = r
    
    while left >= 0 && right < chars.count && chars[left] == chars[right] {
        set.insert(String(chars[left...right]))
        left -= 1
        right += 1
    }
}

print(distinctPalindromeSubStrings(str))

