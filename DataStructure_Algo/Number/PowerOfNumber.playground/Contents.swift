import Foundation
//https://leetcode.com/problems/power-of-two/

/*
 Given an integer n, return true if it is a power of two. Otherwise, return false.

 An integer n is a power of two, if there exists an integer x such that n == 2x.

  

 Example 1:

 Input: n = 1
 Output: true
 Explanation: 20 = 1
 Example 2:

 Input: n = 16
 Output: true
 Explanation: 24 = 16
 Example 3:

 Input: n = 3
 Output: false
 Example 4:

 Input: n = 4
 Output: true
 Example 5:

 Input: n = 5
 Output: false
 */

//Best Solution
//T- O(1)
//S - O(1)

func isPowerOfTwo(_ n: Int) -> Bool {
    
    if(n>0 && (n & (n-1))==0){
        return true
    }
    return false
}

func isPowerOfTwo1(_ n: Int) -> Bool {

    for i in 0..<32 {
        //Perform left sift on 1 by i(0 to 31) and compare is reached equal to n. Left shift increase value in multiple of i.
        if n == 1 << i {
            return true
        }
    }
    return false
}

func isPowerOfTwo2(_ n: Int) -> Bool {
    
    if n == 0 {
        return false
    }
    var number = n
    
    while number % 2 == 0 {
        number /= 2
    }
    
    return number == 1
}


/*
 https://leetcode.com/problems/power-of-three/
 */

func isPowerOfThree(_ n: Int) -> Bool {
    
    if n == 1 {
        return true
    }
    if n < 3 {
        return false
    }
    var product = 1
    
    while product < n {
        product *= 3
        
        if product == n {
            return true
        }
        
    }
    return false
    
}

//This is best as compate to above
func isPowerOfThree1(_ n: Int) -> Bool {
    var n = n
    if n <= 0 {
        return false
    }
    while n % 3 == 0 {
        n /= 3
    }
    return n == 1
}
