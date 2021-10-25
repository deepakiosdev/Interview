
import Foundation
/*
 
 https://thechanmoon.medium.com/leetcode-1647-minimum-deletions-to-make-character-frequencies-unique-2af8a156f120
 https://www.geeksforgeeks.org/minimum-characters-required-to-be-removed-to-make-frequency-of-each-character-unique/

 Minimum characters required to be removed to make frequency of each character unique
 Difficulty Level : Easy
 Last Updated : 24 Jun, 2021
 Given string str, the task is to find the minimum count of characters that need to be deleted from the string such that the frequency of each character of the string is unique.

 Examples:

 Input: str = “ceabaacb”
 Output: 2
 Explanation:
 The frequencies of each distinct character are as follows:
 c —> 2
 e —> 1
 a —> 3
 b —> 2
 Possible ways to make frequency of each character unique by minimum number of moves are:

 Removing both occurrences of ‘c’ modifies str to “eabaab”
 OR
 Removing an occurrence of ‘c’ and ‘e’ modifies str to “abaacb”
 Therefore, the minimum removals required is 2.

 Input: S = “abbbcccd”
 Output: 2
*/

 
 //This one is better solution that below
 func minDeletions1(_ s: String) -> Int {

     var freqArray = Array.init(repeating: 0, count: 26)
     
     let charVal = String("a").unicodeScalars
     let asciiValofA = charVal[charVal.startIndex].value
     for char in s {
         let index = Int(char.asciiValue!) - Int(asciiValofA)
         var count = freqArray[index]
         count += 1
         freqArray[index] = count
     }
     freqArray.sort()
    
     var exp = freqArray[25]
     var res = 0
     
     for i in stride(from: freqArray.count - 1, through: 0, by: -1) {
         
         if (freqArray[i] == 0) {
             continue
         }
         
         if (freqArray[i] > exp) {
             res += freqArray[i] - exp
         } else {
             exp = freqArray[i]
         }
         if (exp > 0) {
             exp -= 1 // Lowest exp is zero, cannot be negative
         }
     }
     return res
 }
 

func minDeletions(_ s: String) -> Int {
    var charDict = [Character : Int]()
    for char in s {
        if charDict[char] == nil {
            charDict[char] = 1
        } else {
            charDict[char]! += 1
        }
    }
    
    let freqArray = charDict.values.sorted(by: >) //[3,2,2,1]
    var exp = freqArray.first!
    var res = 0
    
    for i in 0..<freqArray.count {
        
        if (freqArray[i] > exp) {
            res += freqArray[i] - exp
        } else {
            exp = freqArray[i]
        }
        if (exp > 0) {
            exp -= 1
        }
    }
    print(res)
    return res
}

 //let string = "aab" //0 already good string
 //let string = "aaabbbcc" //2
 let string = "ceabaacb" //2
 //let string = "abcabc" //3


 minDeletions(string)

