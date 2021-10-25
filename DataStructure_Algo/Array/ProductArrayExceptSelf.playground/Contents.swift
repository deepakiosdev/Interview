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
func productExceptSelf(_ nums: [Int]) -> [Int] {

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

print(productExceptSelf([5, 1, 4, 2]))
print(productExceptSelf([5, 1, 4, 2]))
