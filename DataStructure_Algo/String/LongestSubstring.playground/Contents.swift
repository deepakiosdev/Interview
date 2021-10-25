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

