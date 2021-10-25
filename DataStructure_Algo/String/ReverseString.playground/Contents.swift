import UIKit

func reverseString(_ string: String) {
    var reverseString = ""
    for str in string {
        reverseString.insert(str, at: reverseString.startIndex)
    }
    print(reverseString)
}

func reverseString1(_ str: String) {
    var result: String = ""
    let strs = Array(str)
    for i in 0 ..< strs.count {
        result.append(strs[strs.count - 1 - i])
    }
    print(result)
}

func reverseString2(_ str: String) {
    var result: String = ""
    let strs = Array(str)
    for i in 0 ..< strs.count {
        result.append(strs[strs.count - 1 - i])
    }
    print(result)
}

func reverse(_ input: String) -> String {
    var tempString = ""
    for char in input {
        tempString = String(char) + tempString
    }
    return tempString
}

extension String {
    func reverse() -> String  { return self.reduce(""){
        "\($1)" + "\($0)"
        }
    }
}
let numbers = [1, 2, 3, 4]
let reducedNumberSum = numbers.reduce(0) { $0 + $1 }
print(reducedNumberSum)

"abc".reverse()

reverseString("abc")
reverseString1("abc")
reverse("abc")


