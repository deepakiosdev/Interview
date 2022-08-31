import UIKit


func rotate(_ matrix: inout [[Int]]) {
    
    let rowCount = matrix.count
    
    //Step 1- Transpose matrix
    //Turns rows to colums
    //N - Length of matrix
    //swap(array[i][j],array[j][i])
    for rowIndex in 0..<rowCount {
        for columnIdex in rowIndex..<rowCount { //We do not want to swap same elements twice that's why satrted column with current row
            (matrix[rowIndex][columnIdex], matrix[columnIdex][rowIndex]) = ( matrix[columnIdex][rowIndex], matrix[rowIndex][columnIdex])
        }
    }
    
    print(matrix)
    //Step 2- Flip horizontally (Swap columns)
    //swap(array[i][j],array[i][N-1-j])
    for rowIndex in 0..<rowCount {
        
        //We do not want to swap same columns twice that's why goes to half way
        for columnIdex in 0..<rowCount/2 {
            
            (matrix[rowIndex][columnIdex], matrix[rowIndex][rowCount - 1 - columnIdex]) = (matrix[rowIndex][rowCount - 1 - columnIdex], matrix[rowIndex][columnIdex])
        }
    }
    print(matrix)
}

var matrix = [[1,2,3],
              [4,5,6],
              [7,8,9]]
/*Output:
[[7,4,1],
[8,5,2],
[9,6,3]]
*/
rotate(&matrix)

