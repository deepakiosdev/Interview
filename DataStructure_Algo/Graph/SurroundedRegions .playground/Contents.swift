/*
 https://leetcode.com/problems/surrounded-regions/
 https://www.youtube.com/watch?v=PIwYN5h4LwU
 130. Surrounded Regions
 Medium

 Given an m x n matrix board containing 'X' and 'O', capture all regions that are 4-directionally surrounded by 'X'.

 A region is captured by flipping all 'O's into 'X's in that surrounded region.

 Example 1:


 Input: board = [["X","X","X","X"],["X","O","O","X"],["X","X","O","X"],["X","O","X","X"]]
 Output: [["X","X","X","X"],["X","X","X","X"],["X","X","X","X"],["X","O","X","X"]]
 Explanation: Surrounded regions should not be on the border, which means that any 'O' on the border of the board are not flipped to 'X'. Any 'O' that is not on the border and it is not connected to an 'O' on the border will be flipped to 'X'. Two cells are connected if they are adjacent cells connected horizontally or vertically.
 Example 2:

 Input: board = [["X"]]
 Output: [["X"]]
 */


func solve1(_ board: inout [[String]]) {
    
    for i in 0..<board.count {
        //Find O in top and bottom row and repalce with *
        for j in 0..<board[i].count {
            if board[0][j] == "O" {
                dfs(&board, x: 0, y: j)
            }
            
            if board[board.count - 1][j] == "O" {
                dfs(&board, x: board.count - 1, y: j)
            }
        }
        
        //Find O in first and last column and repalce with *
        if board[i][0] == "O" { //First column
            dfs(&board, x: i, y: 0)
        }
        
        if board[i][board[0].count - 1] == "O" { //Last column
            dfs(&board, x: i, y: board[0].count - 1)
        }
    }
    
    print("Replaced with star:\(board)")
    
    for i in 0..<board.count {
        for j in 0..<board[i].count {
            
            if board[i][j] == "O" {
                board[i][j] = "X"
                print("found O: \(board[i][j])")
            }
            
            if board[i][j] == "*" {
                board[i][j] = "O"
                print("found *: \(board[i][j])")
            }
        }
    }
    
}

func solve(_ board: inout [[String]]) {
    
    //Find O in top and bottom row and repalce with *
    for i in 0..<board[0].count {//First row
        if board[0][i] == "O" {
            dfs(&board, x: 0, y: i)
        }
        
        if board[board.count - 1][i] == "O" { //Last row
            dfs(&board, x: board.count - 1, y: i)
        }
    }
    
    for i in 0..<board.count {
        //Find O in first and last column and repalce with *
        if board[i][0] == "O" { //First column
            dfs(&board, x: i, y: 0)
        }
        
        if board[i][board[0].count - 1] == "O" { //Last column
            dfs(&board, x: i, y: board[0].count - 1)
        }
    }
    
    for i in 0..<board.count {
        for j in 0..<board[i].count {

            if board[i][j] == "O" {
                board[i][j] = "X"
                print("found O: \(board[i][j])")
            }
            
            if board[i][j] == "*" {
                board[i][j] = "O"
                print("found *: \(board[i][j])")
            }
        }
    }
    
}


func dfs(_ board: inout [[String]], x: Int, y: Int) {
    
    guard board.indices.contains(x), board[x].indices.contains(y), board[x][y] == "O" else {
        return
    }
    
    board[x][y] = "*"
    dfs(&board, x: x - 1, y: y)
    dfs(&board, x: x + 1, y: y)
    dfs(&board, x: x, y: y - 1)
    dfs(&board, x: x, y: y + 1)
}

var board1 = [["X","X","X","X"],
              ["X","O","O","X"],
              ["X","X","O","X"],
              ["X","O","X","X"]]



var board2 = [["X"]]

var board3 = [["X","O","X","O","X","O"],
              ["O","X","O","X","O","X"],
              ["X","O","X","O","X","O"],
              ["O","X","O","X","O","X"]]
/*
 [["X","O","X","O","X","O"],
 ["O","X","X","X","X","X"],
 ["X","X","X","O","X","X"],
 ["O","X","O","X","O","X"]]
Expected output
 
 [["X", "O", "X", "O", "X", "O"],
 ["O", "X", "X", "X", "X", "X"],
 ["X", "X", "X", "X", "X", "O"],
 ["O", "X", "O", "X", "O", "X"]]
 */


//solve(&board3)
//print(board3)


var board4 = [["O","O","O"],
              ["O","O","O"],
              ["O","O","O"]]

/*
 [["O", "O", "O"],
 ["O", "O", "O"],
 ["O", "O", "O"]]
 */

solve(&board4)
print(board4)
