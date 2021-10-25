//Company OLA
//https://www.geeksforgeeks.org/find-character-first-string-present-minimum-index-second-string/
/*
 Find the character in first string that is present at minimum index in second string
 Difficulty Level : Easy
 Last Updated : 01 May, 2021
 Given a string str and another string patt. Find the character in patt that is present at the minimum index in str. If no character of patt is present in str then print ‘No character present’.

 Examples:

 Input: str = “geeksforgeeks”, patt = “set”
 Output: e
 Both e and s of patt are present in str,
 but e is present at minimum index, which is 1.

 Input: str = “adcffaet”, patt = “onkl”
 Output: No character present

 */

func findCharacterInFirstStringThatPresentAtMinimumIndexIn(secondString: String, firstString: String) -> Int {
    
    var firstStringDict = [Character: Int]()
    
    for (index, char) in firstString.enumerated() {
        
        if firstStringDict[char] == nil {
            firstStringDict[char] = index
        }
    }
    
    //Its wrong implemetation need to itreate and find minimum index of characters
    if let firstChar = secondString.first, let index = firstStringDict[firstChar] {
        return index
    }
    return 0
}

let firstStr = "geeksforgeeks", secondStr = "set"

print(findCharacterInFirstStringThatPresentAtMinimumIndexIn(secondString: secondStr, firstString: firstStr))

