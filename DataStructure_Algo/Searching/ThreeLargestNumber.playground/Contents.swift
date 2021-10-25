import Foundation

/*
 Find 3 largest numbers in an array
 https://www.geeksforgeeks.org/find-the-largest-three-elements-in-an-array/
 Time Complexity - O(N)
 Space Complexity - O(logN)
 **/

class Program {
    // without sorting
    func findThreeLargestNumbers(array: [Int]) -> [Int] {
        var threeLargest: [Int] = [Int.min, Int.min, Int.min]
        for num in array {
            updateLargest(&threeLargest, num)
        }
        return threeLargest
    }
    
    func updateLargest(_ threeLargest: inout [Int], _ number: Int) {
        if number > threeLargest[2] {
            shiftAndUpdate(&threeLargest, number, 2)
        } else if number > threeLargest[1] {
            shiftAndUpdate(&threeLargest, number, 1)
        } else if number > threeLargest[0] {
            shiftAndUpdate(&threeLargest, number, 0)
        }
    }
    
    func shiftAndUpdate(_ threeLargest: inout [Int], _ number: Int, _ index: Int) {
        for i in 0...index {
            if i == index {
                threeLargest[i] = number
            } else {
                threeLargest[i] = threeLargest[i + 1]
            }
        }
    }
}

let prg = Program()
let outputThreeLargestArr = prg.findThreeLargestNumbers(array: [55, -99, 11, 3, -3, 10])
print(outputThreeLargestArr)
