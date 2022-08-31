/*
 https://www.youtube.com/watch?v=21OuwqIC56E
 https://leetcode.com/problems/letter-combinations-of-a-phone-number/
 
 Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent. Return the answer in any order.

 A mapping of digit to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.

 Example 1:

 Input: digits = "23"
 Output: ["ad","ae","af","bd","be","bf","cd","ce","cf"]
 Example 2:

 Input: digits = ""
 Output: []
 Example 3:

 Input: digits = "2"
 Output: ["a","b","c"]

 */


let numToLetters =
[
    "1": ["1"],
    "2": ["a", "b", "c"],
    "3": ["d", "e", "f"],
    "4": ["g", "h", "i"],
    "5": ["j", "k", "l"],
    "6": ["m", "n", "o"],
    "7": ["p", "q", "r", "s"],
    "8": ["t", "u", "v"],
    "9": ["w", "x", "y", "z"],
    "0": ["0"]
]

func letterCombinations(_ digits: String) -> [String] {
   let chars = Array(digits)
   var output: [String] = []

   handler(chars, "", &output)
  
   return output
}

func handler(_ chars: [Character], _ text: String, _ output: inout [String]) {
    //print("chars:\(chars), text:\(text), output:\(output)")

    if chars.count == 0 {
        if text != "" {
            output.append(text)
        }
        return
    }

    let char = String(chars[0])
    let letters = numToLetters[char]!

    var newChars = chars
    newChars.remove(at: 0)

    for i in 0..<letters.count {
        handler(newChars, text+String(letters[i]), &output)
    }
}

print("Result: \(letterCombinations("23"))")
