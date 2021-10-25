import Foundation


/*
 Given an array and an integer. Move all the instances of that integer to the end of the array inPlace.
 T- O(N) | S- O(1)
 **/

class Program {
    func moveElementToEnd(_ array: inout [Int], _ toMove: Int) -> [Int] {
        
        var left: Int = 0
        var right: Int = array.count - 1
        
        while left < right {
            
            while left < right && array[right] == toMove {
                right -= 1
            }
            
            if array[left] == toMove {
                (array[left], array[right]) = (array[right], array[left])
            }
            
            left += 1
        }
        
        return array
        
    }
}

let prg = Program()
var ipArray = [2, 1, 2, 2, 2, 3, 4, 2]
let op = prg.moveElementToEnd(&ipArray, 2)
print("output is \(op)")


func moveZeroesToEndBySwap(_ nums: inout [Int]) {
    guard nums.count > 1 else {
        return
    }
    var nonZeroIdx: Int = 0
    for (index, num) in nums.enumerated() where num != 0 {
        (nums[nonZeroIdx], nums[index]) = (nums[index], nums[nonZeroIdx])
        nonZeroIdx += 1
    }
}

var nums = [0,1,0,3,12]
moveZeroesToEndBySwap(&nums)


func moveZeroesToStart(_ nums: inout [Int]) {
    guard nums.count > 1 else {
        return
    }
    var nonZeroIdx: Int = 0
    for (index, num) in nums.enumerated() where num == 0 {
        (nums[nonZeroIdx], nums[index]) = (nums[index], nums[nonZeroIdx])
        nonZeroIdx += 1
    }
}
var numbers = [0,1,0,3,12]
moveZeroesToStart(&numbers)
//print(numbers) //[1, 3, 12, 0, 0]
