import Foundation

/*
 Given a string, find its first non-repeating character
 https://www.geeksforgeeks.org/given-a-string-find-its-first-non-repeating-character/
 T- O(N) | S- O(N)
 **/


func findNonRepeating(string: String) -> Character? {
    var freqDict: [Character: Int] = [:]
    for char in string.lowercased() {
        if let _ = freqDict[char] {
            freqDict[char]! += 1
        } else {
            freqDict[char] = 1
        }
    }
    
    for char in string {
        let sLower = Character(String(char).lowercased())
        if freqDict[sLower] == 1 {
            return char
        }
    }
    return nil
}


if let op1 = findNonRepeating(string: "Niraj") {
  print(op1)
}


if let op2 = findNonRepeating(string: "abbacd") {
    print(op2)
}

