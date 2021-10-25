/*
 https://leetcode.com/problems/minimum-window-substring/
 
Given two strings s and t of lengths m and n respectively, return the minimum window substring of s such that every character in t (including duplicates) is included in the window. If there is no such substring, return the empty string "".

The testcases will be generated such that the answer is unique.

A substring is a contiguous sequence of characters within the string.

 

Example 1:

Input: s = "ADOBECODEBANC", t = "ABC"
Output: "BANC"
Explanation: The minimum window substring "BANC" includes 'A', 'B', and 'C' from string t.
Example 2:

Input: s = "a", t = "a"
Output: "a"
Explanation: The entire string s is the minimum window.
Example 3:

Input: s = "a", t = "aa"
Output: ""
Explanation: Both 'a's from t must be included in the window.
Since the largest window of s only has one 'a', return empty string.
 

Constraints:

m == s.length
n == t.length
1 <= m, n <= 105
s and t consist of uppercase and lowercase English letters.
 

Follow up: Could you find an algorithm that runs in O(m + n) time?
*/

//Note - This solution is working fine but getting "Time Limit Exceeded" error on leet code

func minWindow(_ s: String, _ t: String) -> String {
    var minWindow = ""
    var resultCharDict: [Character : Int] = [:]
    var visitedCharDict: [Character : Int] = [:]
    let desiredMatchCount = t.count
    var matchCount = 0
    var j = 0
    
    for char in t {
        if let count = resultCharDict[char] {
            resultCharDict[char] = count + 1
        } else {
            resultCharDict[char] = 1
        }
    }
    print(resultCharDict)
    
    for (index, char) in s.enumerated() {
        
        if let count = visitedCharDict[char] {
            visitedCharDict[char] = count + 1
        } else {
            visitedCharDict[char] = 1
        }
        //Aquire values
        if let count = resultCharDict[char], count >= visitedCharDict[char]! {
            matchCount += 1
        }
        
        if matchCount == desiredMatchCount {
            print("matchCount:\(matchCount)")

            while j <= index {
                
                let str = String(Array(s)[j...index])

                //Collect answer
                if minWindow.count == 0 || str.count < minWindow.count {
                    minWindow =  str
                    print("minWindow:\(minWindow)")
                }
                let charAt = Array(s)[j]
                print("Going to removed Char:\(charAt)")

                if let count = visitedCharDict[charAt] {
                    //print("visitedCharDict:\(visitedCharDict)")

                    if count == 1 {
                        visitedCharDict.removeValue(forKey: charAt)
                    } else {
                        visitedCharDict[charAt]! -= 1
                    }
                    //print("After removed visitedCharDict:\(visitedCharDict)")

                    //Release values
                    if resultCharDict[charAt] != nil && (count - 1) < resultCharDict[charAt]! {
                        matchCount -= 1
                        print("After removed matchCount:\(matchCount)")

                    }
                    
                   j += 1
                    
                    if matchCount < desiredMatchCount {
                        break
                    }
                }
            }
        }
        
    }
    print(visitedCharDict)
    return minWindow
}

//var s = "ADOBECODEBANC", t = "ABC"
//var s = "dbaecbbabdcaafbddcabgda", t = "abbcdc"
var s = "a", t = "a"

print("minWindow:\(minWindow(s, t))")
