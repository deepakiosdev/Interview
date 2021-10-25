
/*64. Minimum Path Sum
 
 //https://www.youtube.com/watch?v=t1shZ8_s6jc - Solution
 
Medium

Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right, which minimizes the sum of all numbers along its path.

Note: You can only move either down or right at any point in time.


Example 1:

Input: grid = [[1,3,1],[1,5,1],[4,2,1]]
Output: 7
Explanation: Because the path 1 → 3 → 1 → 1 → 1 minimizes the sum.
Example 2:

Input: grid = [[1,2,3],[4,5,6]]
Output: 12
 

Constraints:

m == grid.length
n == grid[i].length
1 <= m, n <= 200
0 <= grid[i][j] <= 100
*/

func minPathSum(_ grid: [[Int]]) -> Int {

    if grid.count < 1 {
        return 0
    }
    
    let rows = grid.count
    let columns = grid.first!.count

    var pathSum: [[Int]] = Array.init(repeating: Array.init(repeating: 0, count: columns), count: rows)
    
    for row in 0..<rows {
        
        for column in 0..<columns {
            pathSum[row][column] += grid[row][column]
            
            if row > 0 && column > 0 {
                pathSum[row][column] += min(pathSum[row - 1][column], pathSum[row][column-1])
            } else if row > 0 { //To fill first row
                pathSum[row][column] += pathSum[row - 1][column]
            } else if column > 0 { //To fill first column
                pathSum[row][column] += pathSum[row][column - 1]
            }

        }
    }
    return pathSum[pathSum.count - 1][pathSum.first!.count - 1]
}
//[[1, 4, 4],
//[2, 6, 2],
//[5, 6, 2]]

var grid = [[1,3,1],
            [1,5,1],
            [4,2,1]]
print("minPathSum: \(minPathSum(grid))")
