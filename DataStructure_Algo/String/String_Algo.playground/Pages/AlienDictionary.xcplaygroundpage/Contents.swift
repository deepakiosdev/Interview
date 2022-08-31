//: [Previous](@previous)

import Foundation
/*
https://titanwolf.org/Network/Articles/Article?AID=bd2324a9-4e01-472f-a694-eae8c19bbf98
 In an alien language, surprisingly, they also use English lowercase letters, but possibly in a different order. The order of the alphabet is some permutation of lowercase letters.

 Given a sequence of words written in the alien language, and the order of the alphabet, return true if and only if the given words are sorted lexicographically in this alien language.

  

 Example 1:

 Input: words = ["hello","leetcode"], order = "hlabcdefgijkmnopqrstuvwxyz"
 Output: true
 Explanation: As 'h' comes before 'l' in this language, then the sequence is sorted.
 Example 2:

 Input: words = ["word","world","row"], order = "worldabcefghijkmnpqstuvxyz"
 Output: false
 Explanation: As 'd' comes after 'l' in this language, then words[0] > words[1], hence the sequence is unsorted.
 Example 3:

 Input: words = ["apple","app"], order = "abcdefghijklmnopqrstuvwxyz"
 Output: false
 Explanation: The first three characters "app" match, and the second string is shorter (in size.) According to lexicographical rules "apple" > "app", because 'l' > '∅', where '∅' is defined as the blank character which is less than any other character (More info).
  

 Constraints:

 1 <= words.length <= 100
 1 <= words[i].length <= 20
 order.length == 26
 All characters in words[i] and order are English lowercase letters.
 */
class Solution {
    func isAlienSorted(_ words: [String], _ order: String) -> Bool {
        var ret = true
        
        for i in 1 ..< words.count {
            ret = isInOrder(words[i-1], words[i], order)
            if !ret { return false }
        }
        
        return true
    }
    
    func isInOrder(_ word1: String, _ word2: String, _ order: String) -> Bool{
        
        let word1 = Array(word1)
        let word2 = Array(word2)
        
        var i = 0, j = 0
        while i < word1.count && j < word2.count {

            if order.firstIndex(of: word1[i])! == order.firstIndex(of: word2[j])! {
                i += 1
                j += 1
            }else if order.firstIndex(of: word1[i])! < order.firstIndex(of: word2[j])!{
                return true
            }else {
                return false
            }
        }
        
        if word1.count == word2.count {
            return true
        } else if word1.count > word2.count{
            return false
        }
        
        return true
    }
}
//: [Next](@next)
