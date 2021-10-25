/*
https://leetcode.com/problems/maximum-product-of-two-elements-in-an-array/submissions/
https://leetcode.com/problems/maximum-product-of-two-elements-in-an-array/
 
 1464. Maximum Product of Two Elements in an Array
 Easy

 Given the array of integers nums, you will choose two different indices i and j of that array. Return the maximum value of (nums[i]-1)*(nums[j]-1).
  

 Example 1:

 Input: nums = [3,4,5,2]
 Output: 12
 Explanation: If you choose the indices i=1 and j=2 (indexed from 0), you will get the maximum value, that is, (nums[1]-1)*(nums[2]-1) = (4-1)*(5-1) = 3*4 = 12.
 Example 2:

 Input: nums = [1,5,4,5]
 Output: 16
 Explanation: Choosing the indices i=1 and j=3 (indexed from 0), you will get the maximum value of (5-1)*(5-1) = 16.
 Example 3:

 Input: nums = [3,7]
 Output: 12
  

 Constraints:

 2 <= nums.length <= 500
 1 <= nums[i] <= 10^3
*/


func maxProduct(_ nums: [Int]) -> Int {
    
    if nums.count < 2 {
        return -1
    }
    
    var firstLargestPositveIndex = 0
    var secondLargestPositveIndex = 1
    if nums[secondLargestPositveIndex] > nums[firstLargestPositveIndex] {
        (firstLargestPositveIndex, secondLargestPositveIndex) = (secondLargestPositveIndex, firstLargestPositveIndex)
    }
    
    for (index, number) in nums.enumerated() {
        
        if number > nums[firstLargestPositveIndex] {
            secondLargestPositveIndex = firstLargestPositveIndex
            firstLargestPositveIndex = index
        } else if number <= nums[firstLargestPositveIndex] && number > nums[secondLargestPositveIndex] && index != firstLargestPositveIndex {
            secondLargestPositveIndex = index
        }
    }
    
    print((nums[firstLargestPositveIndex] - 1) * (nums[secondLargestPositveIndex] - 1))
    
    return (nums[firstLargestPositveIndex] - 1) * (nums[secondLargestPositveIndex] - 1)
}


/*
//Asked to me in Agoda interview
 https://www.geeksforgeeks.org/return-a-pair-with-maximum-product-in-array-of-integers/
 Find a pair with maximum product in array of Integers
 
 Input: arr[] = {1, 4, 3, 6, 7, 0}
 Output: {6,7}

 Input: arr[] = {-1, -3, -4, 2, 0, -5}
 Output: {-4,-5}
 
 Efficient Approach:

 An Efficient Solution can solve the above problem in a single traversal of the input array. The idea is to traverse the input array and keep track of the following four values.
 a) Maximum positive value
 b) Second maximum positive value
 c) Maximum negative value i.e., a negative value with maximum absolute value
 d) Second maximum negative value.
 At the end of the loop, compare the products of the first two and last two and print the maximum of two products. Below is the implementation of this idea.
 */



//https://www.techiedelight.com/find-maximum-product-two-integers-array/
func maxProductIncludingNegativeNumber(_ nums: [Int]) -> Int {
    
    var firstLargestPositiveNumber = 0
    var secondLargestPositiveNumber = 0
    
    var firstLargestNegativeNumber = 0
    var secondLargestNegativeNumber = 0
    
    var product = 0
    
    for number in nums {
        
        if number > firstLargestPositiveNumber {
            secondLargestPositiveNumber = firstLargestPositiveNumber
            firstLargestPositiveNumber = number
        } else if number > secondLargestPositiveNumber {
            secondLargestPositiveNumber = number
        }
        
        if number < 0 {
            if number < firstLargestNegativeNumber {
                secondLargestNegativeNumber = firstLargestNegativeNumber
                firstLargestNegativeNumber = number
            } else if number < secondLargestNegativeNumber {
                secondLargestNegativeNumber = number
            }
        }
    }
    
    if (firstLargestPositiveNumber * secondLargestPositiveNumber) > (firstLargestNegativeNumber * secondLargestNegativeNumber) {
        product = firstLargestPositiveNumber * secondLargestPositiveNumber
    } else {
        product = firstLargestNegativeNumber * secondLargestNegativeNumber
    }
    
    print("firstLargestPositiveNumber:\(firstLargestPositiveNumber)")
    print("secondLargestPositiveNumber:\(secondLargestPositiveNumber)")
    print("firstLargestNegativeNumber :\(firstLargestNegativeNumber )")
    print("secondLargestNegativeNumber:\(secondLargestNegativeNumber)")
    print(product)
    return product
}


//let array = [3,4,5,2] //20
//let array = [1,5,4,5] //25
//let array = [3,7] //21
//let array = [10,2,5,2] //50
//let array = [1, 4, 3, 6, 7, 0] //42
//let array = [-1, 3, 4, 2, 0, -5] //12
//let array = [-10, -3, 5, 6, -2] //30
//let array = [-10, -3, 4, 6, -2] //30
let array = [-1, -3, -4, 2, 0, -5] //20

maxProductIncludingNegativeNumber(array)
