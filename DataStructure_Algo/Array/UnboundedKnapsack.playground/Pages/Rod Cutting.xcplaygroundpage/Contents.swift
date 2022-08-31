//: [Previous](@previous)

import Foundation
/*
 1547. Minimum Cost to Cut a Stick
 Hard

 931

 19

 Add to List

 Share
 Given a wooden stick of length n units. The stick is labelled from 0 to n. For example, a stick of length 6 is labelled as follows:


 Given an integer array cuts where cuts[i] denotes a position you should perform a cut at.

 You should perform the cuts in order, you can change the order of the cuts as you wish.

 The cost of one cut is the length of the stick to be cut, the total cost is the sum of costs of all cuts. When you cut a stick, it will be split into two smaller sticks (i.e. the sum of their lengths is the length of the stick before the cut). Please refer to the first example for a better explanation.

 Return the minimum total cost of the cuts.

  

 Example 1:


 Input: n = 7, cuts = [1,3,4,5]
 Output: 16
 Explanation: Using cuts order = [1, 3, 4, 5] as in the input leads to the following scenario:

 The first cut is done to a rod of length 7 so the cost is 7. The second cut is done to a rod of length 6 (i.e. the second part of the first cut), the third is done to a rod of length 4 and the last cut is to a rod of length 3. The total cost is 7 + 6 + 4 + 3 = 20.
 Rearranging the cuts to be [3, 5, 1, 4] for example will lead to a scenario with total cost = 16 (as shown in the example photo 7 + 4 + 3 + 2 = 16).
 Example 2:

 Input: n = 9, cuts = [5,6,1,4,2]
 Output: 22
 Explanation: If you try the given cuts ordering the cost will be 25.
 There are much ordering with total cost <= 25, for example, the order [4, 6, 5, 2, 1] has total cost = 22 which is the minimum possible.
  

 Constraints:

 2 <= n <= 106
 1 <= cuts.length <= min(n - 1, 100)
 1 <= cuts[i] <= n - 1
 All the integers in cuts array are distinct.
 */

func maxProfit(_ price: [Int]) -> Int {

    let size = price.count
    let n = price.count
    var dp = Array.init(repeating: Array.init(repeating: 0, count:  n + 1), count: size + 1)

   // print(dp)
    for i in 1...size {
        for j in 1...n {

            if price[i - 1] <= j {
                dp[i][j] = max(price[i - 1] + dp[i][j - price[i - 1]], dp[i - 1][j])
            } else {
                dp[i][j] = dp[i - 1][j]
            }
        }
    }
    print(dp)
    return dp[size][n]
}

/*
 int arr[][] = new int[n][price.length+1];
         
         for(int i=0;i<n;i++){
             for(int j=0;j<price.length+1;j++){
                 if(j==0 || i==0)
                     arr[i][j] = 0;
                 else if(j>=i){
                     arr[i][j] = Math.max(arr[i-1][j], price[i-1]+arr[i][j-i]);
                 }else{
                     arr[i][j] = arr[i-1][j];
                 }
             }
         }
         return arr[n-1][price.length];
 */

print(maxProfit([1, 5, 8, 9, 10, 17, 17, 20]))

/*

func extendedBottomUpCutRod(priceList: [Int], rotLength: Int) -> (result: [Int], solution: [Int]) {
    var result = Array (count: rotLength + 1 , repeatedValue: 0 )
    var solution = Array (count: rotLength + 1 , repeatedValue: 0 )

    for var j = 1; j <= rotLength; ++j {
        var optNext = -10000
        for var i = 1; i <= j; i++ {
            if optNext < priceList[i] + result[j - i] {
                optNext = priceList[i] + result[j - i]
                solution[j] = i
            }
        }

        result[j] = optNext
    }

    return (result, solution)
}

func printCutRodSolution(priceList: [Int], var rotLength: Int) {
    var result: [Int]
    var solution: [Int]
    (result, solution) = extendedBottomUpCutRod(priceList, rotLength)

    while rotLength > 0 {
        println(solution[rotLength])
        rotLength = rotLength - solution[rotLength]
    }
}

var priceArray: [Int] = [0, 1, 5, 8, 9, 10, 17, 17, 20, 24, 30]

printCutRodSolution(priceArray, 4)
*/
//: [Next](@next)
