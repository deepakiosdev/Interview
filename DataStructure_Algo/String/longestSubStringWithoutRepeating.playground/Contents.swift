

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



func lengthOfLongestSubstring2(_ s: String) -> Int {
    
    var characterDict = [Character:Int]()
    var maxLength = 0
    var lastRepeatPos = -1
    var i = 0
    
    for c in Array(s) {
        if (characterDict[c] != nil) && (characterDict[c]! > lastRepeatPos) {
            lastRepeatPos = characterDict[c]!
        }
        
        maxLength = max(i - lastRepeatPos, maxLength)
        characterDict[c] = i
        i += 1
    }
    
    return maxLength
}
