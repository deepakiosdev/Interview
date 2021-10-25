/**
    Question - Group Anagrams
    Link - > https://leetcode.com/problems/group-anagrams/
 
 

Example 1:

Input: strs = ["eat","tea","tan","ate","nat","bat"]
Output: [["bat"],["nat","tan"],["ate","eat","tea"]]
Example 2:

Input: strs = [""]
Output: [[""]]
Example 3:

Input: strs = ["a"]
Output: [["a"]]
 
*/

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var result = [String: [String]]()
        
        for str in strs {
            let sortedStr = String(str.sorted())
            result[sortedStr, default: []].append(str)
        }
        print(result)
        return Array(result.values)
    }
}
