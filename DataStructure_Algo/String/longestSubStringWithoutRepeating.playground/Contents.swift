

/**
* Question Link: https://leetcode.com/problems/longest-substring-without-repeating-characters/
* Primary idea: Use a dictionary to hold the next possible valid position of characters of the non-repeating substring,
*               and then iterate the string to update maxLen, dictionary, and startIdx encountering duplicates
*
* Note: Swift does not have a way to access a character in a string with O(1),
*       thus we have to first transfer the string to a character array
* Time Complexity: O(n), Space Complexity: O(n)
*
*/

//O(n)
func lengthOfLongestSubstring(_ s: String) -> Int {
    var longest = 0
    var foundCharacters: [Character: Int] = [:]
    
    var lWindowIndex = 0
    for (rWindowIndex, character) in s.enumerated() {
        if let exists = foundCharacters[character] {
            lWindowIndex = max(exists, lWindowIndex)
        }
        longest = max(longest, rWindowIndex - lWindowIndex + 1)
        foundCharacters[character] = rWindowIndex + 1
    }
    return longest
}

lengthOfLongestSubstring("abcabcbb")



//O(2n) = O(n)
func lengthOfLongestSubstring1(_ s: String) -> Int {
    var maxSubStringLength: Int  = 0
    var set: Set<Character> = Set<Character>()
    var left: Int = 0, right: Int = 0
    let sChars = Array(s)
    
    while right < sChars.count {

        if !set.contains(sChars[right]) {
            print("right:\(right)")

            set.insert(sChars[right])
            maxSubStringLength = max(maxSubStringLength, set.count)
            right += 1
        } else {
            print("left:\(left)")
            set.remove(sChars[left])
            left += 1
        }
    }
    
    print("maxSubStringLength:\(maxSubStringLength)")

    return maxSubStringLength
}

lengthOfLongestSubstring1("abcaaxxyzuv")



/*
* Primary idea: Use a dictionary to hold the next possible valid position of characters of the non-repeating substring,
*               and then iterate the string to update maxLen, dictionary, and startIdx encountering duplicates
*
* Note: Swift does not have a way to access a character in a string with O(1),
*       thus we have to first transfer the string to a character array
* Time Complexity: O(n), Space Complexity: O(n)
*
* Solution - https://github.com/fancymax/Leetcode_Swift/blob/master/003-longest-substring-without-repeating-characters/longest-substring-without-repeating-characters.swift


 Example 1:

 Input: s = "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3.
 Example 2:

 Input: s = "bbbbb"
 Output: 1
 Explanation: The answer is "b", with the length of 1.
 Example 3:

 Input: s = "pwwkew"
 Output: 3
 Explanation: The answer is "wke", with the length of 3.
 Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
 
 Example 4:

 Input: s = ""
 Output: 0
 
 */


func lengthOfLongestSubstringWithoutRepeatingCharacters(_ s: String) -> Int {
    var characterDict = [Character:Int]()
    var maxLength = 0
    var lastRepeatPos = -1
    
    for (index, char) in s.enumerated() {
        if (characterDict[char] != nil) && (characterDict[char]! > lastRepeatPos) {
            lastRepeatPos = characterDict[char]!
        }
        
        maxLength = max(index - lastRepeatPos, maxLength)
        characterDict[char] = index
    }
    print("maxLength:\(maxLength)")
    return maxLength
}

lengthOfLongestSubstringWithoutRepeatingCharacters("pwwkew")
//abcaaxxyzuv
//abcabcbb
