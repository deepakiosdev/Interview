/*
 Program to find an element in array such that sum of left array is equal to sum of right array
 https://learnersbucket.com/examples/algorithms/program-to-find-an-element-in-array-such-that-sum-of-left-array-is-equal-to-sum-of-right-array/
 https://www.geeksforgeeks.org/find-element-array-sum-left-array-equal-sum-right-array/
 */
import Foundation


func findElementLeftAndRigtSumOfSubArrayEqual(_ array:[Int])-> Int {
    
    let sum = array.reduce(0, +)
    
    var leftSum = 0
 
    for index in 1..<array.count {
        leftSum += array[index - 1]
        
        if (sum - array[index]) == 2*leftSum {
            return array[index]
        }
    }
    
    return -1
}

let array1 = [2, 1, 9 ,3] //9
let array2 = [1, 4, 2, 5] //2
let array3 = [2, 3, 4, 1, 4, 5] //1

print(findElementLeftAndRigtSumOfSubArrayEqual(array1))

/*
 
 let array = [1, 2, 3, 4, 5, 6]
 let subarray = array[0...2] // Yields [1, 2, 3]

 let array1: Array<Int> = [1, 2, 3, 4, 5, 6]
 let slice: ArraySlice<Int> = array1[0...2]

 let array2: Array<Int> = [8, 9, 10]
 let combined: Array<Int> = array2 + slice // [8, 9, 10, 1, 2, 3]

 */

let testA1 = [10, 4, -8,7] //2
let testA2 = [3, 10, -5, 6] //2


let testA3 = [5, -3, -2, 10, 20, -30] //4
//Split a array in a such a way that left sum is greater than right sum. Find count of all the subarrays
func splitIntoTwo(_ array:[Int])-> Int {
    
    let sum = array.reduce(0, +)
    var count = 0
    var leftSum = 0
    print("sum:\(sum)")

    for index in 1..<array.count {
        print("index:\(index)")
        leftSum += array[index - 1]
        print("leftSum:\(leftSum)")
        if sum < 2*leftSum {
            count += 1
        }
    }
    print("count:\(count)")
    return count
}


splitIntoTwo(testA3)




