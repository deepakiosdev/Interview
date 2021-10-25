import UIKit


/*
 Balanced Paraenthesis
 https://leetcode.com/problems/valid-parentheses/
  T- O(N), S- O(N)
 //https://www.facebookrecruiting.com/portal/coding_practice_question/?problem_id=211548593612944&c=312375940577939&practice_plan=0
 **/

func balancedBrackets(string: String) -> Bool {
    let openBrackets = "({["
    let closeBrackets = ")}]"
    let matchingBracketsDict: [Character: Character] = [")": "(", "}": "{", "]": "["]
    var stack: [Character] = []
    
    for char in string {
        if openBrackets.contains(char) {
            stack.append(char)
        } else if closeBrackets.contains(char) {
            if stack.isEmpty {
                return false
            } else {
                if let lastElem = stack.last,
                    lastElem == matchingBracketsDict[char] {
                    stack.popLast()
                } else {
                    return false
                }
            }
        }
    }
    return stack.isEmpty
}

balancedBrackets(string: "([]){}")
balancedBrackets(string: "(")


func isValidParenthesis(_ string: String) -> Bool {
    var stack = [String]()
    let brackets = ["]" : "[" , "}" : "{" , ")" : "("]

    for char in string {
        print(char)
        switch char {
        case "[", "{", "(" :
            stack.append(String(char))
        case "]", "}", ")" :
            if stack.isEmpty || stack.last != brackets[String(char)] {
                return false
            }
            stack.popLast()
        case " " :
            continue
        default:
            return false
        }
    }
    return stack.isEmpty
}

//let str = "{ [ ] ( ) }" //true
//let str = "{ [ ( ] ) }" //false
let str = "{ [ }" //false

print(isValidParenthesis(str))
/*
 "{ [ ] ( ) }" should return true
 "{ [ ( ] ) }" should return false
 "{ [ }" should return false
 */
