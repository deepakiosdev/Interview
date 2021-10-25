import Foundation


extension BinaryInteger {
    var isPerfectSquare: Bool {
        guard self >= .zero else { return false }
        var sum: Self = .zero
        var count: Self = .zero
        var squareRoot: Self = .zero
        while sum < self {
            count += 2
            sum += count
            squareRoot += 1
            //print("count:\(count), sum:\(sum), squareRoot:\(squareRoot)")
        }
        //print(squareRoot * squareRoot)
        return squareRoot * squareRoot == self
    }
}

print(32.isPerfectSquare)

//https://www.geeksforgeeks.org/check-if-a-number-is-perfect-square-without-finding-square-root/


func isPerfectSquare(number: Int) -> Bool {
    guard number > .zero else { return false }
    
    var left = 1
    var right = number
    
    while left <= right {
        
        //Check if mid is perfect square
        let mid = (left + right) / 2
        
        if mid*mid == number {
            return true
        }
        
        // Mid is small -> go right to increase mid
        if (mid * mid < number)
        {
            left = mid + 1
        } else {
            right = mid - 1 // Mid is large -> to left to decrease mid
        }
    }
    
    return false
}

print(isPerfectSquare(number: 9))
 
