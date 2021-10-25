import UIKit
  
func numberOfBalancedStrings(_ inputStr: String) -> Int {
    var part1: Int = 0
    var part2: Int = 0
    var result: Int = 0
    var outputArr: [[Character]] = []
    var resultCombo: [Character] = []
    guard inputStr.count > 0 else { return 0 }
    for (_, char) in inputStr.enumerated() {
        if char == "A" {
            part1 += 1
            resultCombo.append(char)
        } else if char == "B" {
            part2 += 1
            resultCombo.append(char)
        }
        if part1 == part2 {
            result += 1
            outputArr.append(resultCombo)
            resultCombo.removeAll()
        }
       
    }
    print(outputArr)
    return result
}

print(numberOfBalancedStrings("BABBAABABA"))
