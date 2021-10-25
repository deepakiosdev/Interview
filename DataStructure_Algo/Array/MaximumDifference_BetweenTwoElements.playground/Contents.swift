/*
 https://www.geeksforgeeks.org/maximum-difference-between-two-elements/
 
 Maximum difference between two elements such that larger element appears after the smaller number

 Given an array arr[] of integers, find out the maximum difference between any two elements such that larger element appears after the smaller number.

 Examples :

 Input : arr = [2, 3, 10, 6, 4, 8, 1]
 Output : 8
 Explanation : The maximum difference is between 10 and 2.

 Input : arr = [7, 9, 5, 6, 3, 2]
 Output : 2
 Explanation : The maximum difference is between 9 and 7.
 */


func maxDiff(_ array: [Int]) -> Int {
    
    guard array.count > 1 else {
        return -1
    }
    var smallestNumber = array[0]
    var largestNumber = array[1]
    var currentSmallNumber = smallestNumber
    
    for index in 2..<array.count {
        
        let number = array[index]
        currentSmallNumber = min(array[index - 1], smallestNumber)
        if number > largestNumber {
            largestNumber = number
            smallestNumber = currentSmallNumber
        }

    }
    
    let diff = largestNumber - smallestNumber
    print("diff:\(diff)")
    return diff
}

//let arr =  [80, 2, 6, 3, 100] //98
//let arr =  [2, 3, 10, 6, 4, 8, 1] //8
//let arr = [7, 9, 5, 6, 3, 2] //2
let arr = [1, 2, 90, 10, 110] //109

maxDiff(arr)
