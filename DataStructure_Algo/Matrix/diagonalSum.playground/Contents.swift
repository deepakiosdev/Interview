
/*
 Sum of diagonal elements of a matrix
 */

func sumOfDiagonal(array: [[Int]]) -> Int { //[0 1 0]
    
    var sumOfFirstDiagonal: Int = 0
    var sumOfSecondDiagonal: Int = 0
    for i in 0 ..< array.count {
        for j in 0 ..< array[i].count {
            if i == j {
                sumOfFirstDiagonal += array[i][j]
            }
            if i == array.count - 1 - j {
                sumOfSecondDiagonal += array[i][j]
            }
        }
    }
   return sumOfFirstDiagonal + sumOfSecondDiagonal
}


func sumOfDiagonal2(array: [[Int]]) -> Int { //[0 1 0]
    
    var sumOfDiagonal: Int = 0
    for i in 0 ..< array.count {
        sumOfDiagonal += array[i][i]
        sumOfDiagonal += array[i][array.count - 1 - i]
    }
    return sumOfDiagonal
    
}

let sum = sumOfDiagonal(array: [[1, 1, 0], [5, 0, 1], [1, 1, 1]])
let sum1 = sumOfDiagonal2(array: [[1, 1, 0], [5, 0, 1], [1, 1, 1]])
