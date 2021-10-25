import UIKit

func isStringPallindrome(_ str: String) -> Bool {
    var left = 0
    var right = str.count - 1
    let strs = Array(str)
    while right > left {
        if strs[left] != strs[right] {
            return false
        }
        left += 1
        right -= 1
    }
    return true
}

isStringPallindrome("madam")
isStringPallindrome("niraj")

func isNumberPalindrome(_ x: Int) -> Bool {
    var number = x
    var reverseNumber: Int = 0
    
    while number > 0 {
        let rem = number % 10
        reverseNumber = reverseNumber * 10 + rem
        number /= 10
    }
    return x == reverseNumber
}

isNumberPalindrome(121)
isNumberPalindrome(836)

