import UIKit

//https://leetcode.com/problems/search-a-2d-matrix/

//Asked in paypal

/*
 74. Search a 2D Matrix
 Medium

 4585

 Write an efficient algorithm that searches for a value in an m x n matrix. This matrix has the following properties:

 Integers in each row are sorted from left to right.
 The first integer of each row is greater than the last integer of the previous row.
  

 Example 1:


 Input: matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 3
 Output: true
 Example 2:


 Input: matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 13
 Output: false
  

 Constraints:

 m == matrix.length
 n == matrix[i].length
 1 <= m, n <= 100
 -104 <= matrix[i][j], target <= 104
 */

func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    
    let rows = matrix.count
    if rows < 1  {
        return false
    }
    
    guard let coulmns = matrix.first?.count, coulmns > 0 else {
        return false
    }
    var i = 0, j = coulmns - 1
    
    while i >= 0 && i < rows && j >= 0 && j <= coulmns {
        
        print("i:\(i), j:\(j)")
        
        if matrix[i][j] < target {
            i += 1
        } else if matrix[i][j] > target {
            j -= 1
        } else if matrix[i][j] == target {
           return true
        }
    }
    
    return false
}

/*var matrix = [[1,3,5,7],
              [10,11,16,20],
              [23,30,34,60]]
var target = 3*/
//Output: true

var matrix = [[1,3,5,7],
              [10,11,16,20],
              [23,30,34,60]]
var target = 13
//Output: false

searchMatrix(matrix, target)

