import Foundation

/* Given an array nums of n integers where n > 1,  return an array output such that output[i] is equal to the product of all the elements of nums except nums[i].
 https://leetcode.com/problems/product-of-array-except-self/
T- O(N) | S- O(n)
**/

class Program {
    
    //T- O(N^2), brute force
    func arrayOfProducts(_ array: [Int]) -> [Int] {
        var products = [Int](repeating: 0, count: array.count)
        for i in 0 ..< array.count {
            var calculatedProduct: Int = 1
            // for each i , calculate product except itself so i != j
            for j in 0 ..< array.count where i != j {
                calculatedProduct *= array[j]
            }
            products[i] = calculatedProduct
        }
        return products
    }
    
    //T- O(N)
    func arrayOfProducts1(_ array: [Int]) -> [Int] {
        var products = [Int](repeating: 0, count: array.count)
        var leftCalculatedProduct: Int = 1
        var rightCalculatedProduct: Int = 1
       
        //calculate left product from 0 to count-1
        for i in 0 ..< array.count {
            products[i] = leftCalculatedProduct
            leftCalculatedProduct *= array[i]
        }
        
        //calculate right product from count-1 to 0 and multiply to products array
//        for i in stride(from: array.count - 1, through: 0, by: -1) {
//
//        }
        for i in (0 ..< array.count).reversed() {
            products[i] *= rightCalculatedProduct
            rightCalculatedProduct *= array[i]
        }
        
        return products
    }
}

let prg = Program()
print(prg.arrayOfProducts([5, 1, 4, 2]))
print(prg.arrayOfProducts1([5, 1, 4, 2]))


///
func productExceptSelf1(_ nums: [Int]) -> [Int] {

        var arr = Array.init(repeating: 1, count: nums.count)

        for i in (0..<(nums.count - 1)).reversed() {

            arr[i] = arr[i + 1] * nums[i + 1]

        }

        var left = 1
        for i in 0..<nums.count {
            if i == 0 {
                arr[i] = left * arr[i]
            } else {
                left = left * nums[i - 1]
                arr[i] = left * arr[i]
            }
        }

        return  arr
    }

print(productExceptSelf1([5, 1, 4, 2]))
print(productExceptSelf1([5, 1, 4, 2]))

/////////////////////////My Solution////////
/*
 https://www.geeksforgeeks.org/product-array-puzzle-set-2-o1-space/
 https://leetcode.com/problems/product-of-array-except-self/
 
 Solution - https://leetcode.com/problems/product-of-array-except-self/solution/#:~:text=We%20can%20simply%20take%20the,elements%20would%20solve%20the%20problem.
 
 Given an integer array nums, return an array answer such that answer[i] is equal to the product of all the elements of nums except nums[i].

 The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.

  

 Example 1:

 Input: nums = [1,2,3,4]
 Output: [24,12,8,6]
 Example 2:

 Input: nums = [-1,1,0,-3,3]
 Output: [0,0,9,0,0]
  

 Constraints:

 2 <= nums.length <= 105
 -30 <= nums[i] <= 30
 The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.
  

 Follow up:

 Could you solve it in O(n) time complexity and without using division?
 Could you solve it with O(1) constant space complexity? (The output array does not count as extra space for space complexity analysis.)
 */
// e.g [1,2,3,4]
//Step 1- Product of left elements at index = [1, 1, 2, 6] //Because for 0th index left hand side no element so put 1
//Step 2 - Product of right elements at index = [24, 12, 4, 1] // Because for 3rd index right hand side no element so put 1
//Step 3 - Multiply both array (left and righ)

func productExceptSelf(_ nums: [Int]) -> [Int] {
    guard nums.count > 1 else {
        return []
    }
    
    var product = 1
    var result: [Int] = Array(repeating: 1, count: nums.count)
    
    // from left to right: reuse the product from previous entries for subsequent entries
    for i in 0..<nums.count {
        result[i] = product
        product *= nums[i]
    }
    //print(result) //product of left side elements = [1, 1, 2, 6]
    product = 1
    //From right to left: reuse the products from previous entries
    //for i in (0..<nums.count).reversed() { // for i in 4<..0
    //OR
    for i in stride(from: nums.count - 1, through: 0, by: -1) {
        // print("product:\(product)") //1, 4, 12, 24
        result[i] *= product
        //print("result:\(result)")
        product *= nums[i]
    }
    return result
}

productExceptSelf([1,2,3,4]) //[24, 12, 8, 6]

