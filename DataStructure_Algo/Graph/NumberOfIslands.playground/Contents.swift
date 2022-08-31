import Foundation

/*
 https://leetcode.com/problems/number-of-islands/
 
 200. Number of Islands
 Medium
 Given an m x n 2D binary grid grid which represents a map of '1's (land) and '0's (water), return the number of islands.

 An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.
 */
let grid1 = [
  ["1","1","1","1","0"],
  ["1","1","0","1","0"],
  ["1","1","0","0","0"],
  ["0","0","0","0","0"]
] // Number of islands = 1

let grid2 = [
    ["1","1","0","0","0"],
    ["1","1","0","0","0"],
    ["0","0","1","0","0"],
    ["0","0","0","1","1"]
  ] // Number of islands = 3


func numIslands(_ grid: [[String]]) -> Int {
    var islandsCount = 0
    var resultGrid = grid
    
    for i in 0..<grid.count {
        for j in 0..<grid[i].count {
            
            if grid[i][j] == "1" {
                islandsCount += destroyIslands(&resultGrid, x: i, y: j)
            }
        }
    }
    return islandsCount
}

func destroyIslands(_ grid: inout [[String]], x: Int, y: Int) -> Int {
    
    if x < 0 || x >= grid.count || y < 0 || y >= grid[x].count {
        return 0
    }
    
    if grid[x][y] == "0" {
        return 0
    }
    
    grid[x][y] = "0"
    //Destroy in left
    destroyIslands(&grid, x: x - 1, y: y)
    //Destroy in right
    destroyIslands(&grid, x: x + 1, y: y)
    //Destroy in top
    destroyIslands(&grid, x: x, y: y - 1)
    //Destroy in bottom
    destroyIslands(&grid, x: x, y: y + 1)
    
    return 1
}


print(numIslands(grid2))
