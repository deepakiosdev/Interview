
//https://leetcode.com/problems/add-strings/
/*
 Given two non-negative integers, num1 and num2 represented as string, return the sum of num1 and num2 as a string.

  

 Example 1:

 Input: num1 = "11", num2 = "123"
 Output: "134"
 Example 2:

 Input: num1 = "456", num2 = "77"
 Output: "533"
 Example 3:

 Input: num1 = "0", num2 = "0"
 Output: "0"
 
 */


func addStrings(_ num1: String, _ num2: String) -> String {
    
    var num1Index = num1.count - 1
    var num2Index = num2.count - 1
    var carry = 0
    var result = ""
    let num1Array = num1.map { Int(String($0))! }
    let num2Array = num2.map { Int(String($0))! }

    
    while num1Index >= 0 || num2Index >= 0 {
        var x1 = 0
        var x2 = 0

        if num1Index >= 0 {
            x1 = num1Array[num1Index]
            num1Index -= 1
        }
        if num2Index >= 0 {
            x2 = num2Array[num2Index]
            num2Index -= 1
        }
            
        let value = (x1 + x2 + carry) % 10
        carry = (x1 + x2 + carry) / 10
        result = String(value) + result
        print(result)
    }
    
    if carry != 0 {
        result = String(carry) + result
    }
    
    return  result
}

let num1 = "525", num2 = "98"

print(addStrings(num1, num2))

/*
 https://www.geeksforgeeks.org/program-to-add-two-binary-strings/
 https://leetcode.com/problems/add-binary/
 Given two binary strings a and b, return their sum as a binary string.

Example 1:

 Input: a = "11", b = "1"
 Output: "100"
 Example 2:

 Input: a = "1010", b = "1011"
 Output: "10101"
  
 */

func addBinary(_ a: String, _ b: String) -> String {
    
    var num1Index = a.count - 1
    var num2Index = b.count - 1
    var carry = 0
    var result = ""
    let num1Array = a.map { Int(String($0))! }
    let num2Array = b.map { Int(String($0))! }
    
    
    while num1Index >= 0 || num2Index >= 0 {
        var x1 = 0
        var x2 = 0
        
        if num1Index >= 0 {
            x1 = num1Array[num1Index]
        }
        if num2Index >= 0 {
            x2 = num2Array[num2Index]
        }
        
        let value = (x1 + x2 + carry) % 2
        carry = (x1 + x2 + carry) / 2
        result = String(value) + result
        num1Index -= 1
        num2Index -= 1
    }
    
    if carry != 0 {
        result = String(carry) + result
    }
    
    return  result
}

let a = "1010", b = "1011"
print(addBinary(a, b))
