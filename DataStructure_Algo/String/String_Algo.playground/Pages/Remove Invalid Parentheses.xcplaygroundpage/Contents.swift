//: [Previous](@previous)

import Foundation

/*
 301. Remove Invalid Parentheses
 Hard

 4224

 208

 Add to List

 Share
 Given a string s that contains parentheses and letters, remove the minimum number of invalid parentheses to make the input string valid.

 Return all the possible results. You may return the answer in any order.

  

 Example 1:

 Input: s = "()())()"
 Output: ["(())()","()()()"]
 Example 2:

 Input: s = "(a)())()"
 Output: ["(a())()","(a)()()"]
 Example 3:

 Input: s = ")("
 Output: [""]
  

 Constraints:

 1 <= s.length <= 25
 s consists of lowercase English letters and parentheses '(' and ')'.
 There will be at most 20 parentheses in s.
 */

func isPraentheses(_ char: Character) -> Bool {
  return char == ")" || char == "("
}

func removeParanAndMakeValidString(_ str: String, minRemoval: Int, result: inout Set<String>,  visitedString: inout Set<String>) {
    print("----str:\(str), minRemoval:\(minRemoval),result:\(result)")
    if minRemoval == 0 {
        if isValidString(str) {
            result.insert(str)
        }
        return
    }
    
    for (i, char) in str.enumerated() {

        if !isPraentheses(char) {
            continue
        }
        
        let newStr = String(str.prefix(i) + str.suffix(str.count - i - 1))
        
        if visitedString.contains(newStr) {
            continue
        } else {
            visitedString.insert(newStr)
        }
        removeParanAndMakeValidString(newStr, minRemoval: minRemoval - 1, result: &result, visitedString: &visitedString)
    }
}


func isValidString(_ str: String)-> Bool {
    return invalidPraenthesesCount(str) == 0
}

func invalidPraenthesesCount(_ str: String)-> Int {
    
    var stack = [String]()
    for ch in str {
        if ch == "(" {
            stack.append(String(ch))
        } else if ch == ")" {
            
            if stack.last == "(" {
                stack.removeLast()
            } else {
                stack.append(String(ch))
            }
        }
    }
    return stack.count
}

func removeInvalidParentheses(_ s: String) -> [String] {
    
    if s.isEmpty {
        return []
    }
 
    var result = Set<String>()
    var visitedStr = Set<String>()

    let invalidParCount = invalidPraenthesesCount(s)
    removeParanAndMakeValidString(s, minRemoval: invalidParCount, result: &result, visitedString:&visitedStr)
    
    print("result: \(result)")
    if result.isEmpty {
        return []
    } else {
        return Array(result)
    }
}

//removeInvalidParentheses("()())()")
//removeInvalidParentheses(")(")
removeInvalidParentheses(")()))())))")

//: [Next](@next)
