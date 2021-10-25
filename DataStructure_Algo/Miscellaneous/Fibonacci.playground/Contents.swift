import UIKit
// https://www.geeksforgeeks.org/program-for-nth-fibonacci-number/
//f(16) = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610]
//f(8) = [0, 1, 1, 2, 3, 5, 8, 13]

//fib(0) = 0 and fib(1) = 1.
//Recursive approach
/*
 
 Time Complexity: O(2^n)
 Space Complexity: O(2^n)
 
 */

//Return nth fabonacci number
func fib(_ n: Int) -> Int {
    guard n > 1 else { return n }
    return fib(n-1) + fib(n-2)
}



/*
 https://medium.com/swlh/fibonacci-swift-playground-f56d1ff3ea99
Iterative approach — Optimized
We don’t really need to store the whole array. All we need to have is the last two values:
 
 Time Complexity: O(n)
 Space Complexity: O(1)

 */
//Return nth fabonacci number
func fib1(_ n: Int) -> Int {
 
    guard n > 1 else { return n }
    
    var a = 1
    var b = 1
   
    (2..<n).forEach { _ in
        (a, b) = (a + b, a)
    }
    return a
}

let result1 = fib(7)
print(result1)//13

let result2 = fib1(7)
print(result2)//13




//Print nth fibonacci series
func fibonacciSeries(for n: Int) -> [Int] {

    guard n > 1 else {
        return [0]
    }
    var series = [0, 1]

    /*
     while array.count < n {
     series.append(array[array.count - 1] + array[array.count - 2])
    }
     */
    for index in 2..<n {
        let nextNumber = series[index - 1] + series[index - 2]
        series.append(nextNumber)
    }
    return series
}

let result = fibonacciSeries(for: 16) //
print(result) //7 fab number = [0, 1, 1, 2, 3, 5, 8]
