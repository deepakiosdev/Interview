import UIKit

/*
    Question -  Best Time to Buy and Sell Stock II
    Link - > https://leetcode.com/explore/featured/card/30-day-leetcoding-challenge/528/week-1/3287/
 
 You are given an array prices where prices[i] is the price of a given stock on the ith day.

 Find the maximum profit you can achieve. You may complete as many transactions as you like (i.e., buy one and sell one share of the stock multiple times).

 Note: You may not engage in multiple transactions simultaneously (i.e., you must sell the stock before you buy again).

  

 Example 1:

 Input: prices = [7,1,5,3,6,4]
 Output: 7
 Explanation: Buy on day 2 (price = 1) and sell on day 3 (price = 5), profit = 5-1 = 4.
 Then buy on day 4 (price = 3) and sell on day 5 (price = 6), profit = 6-3 = 3.
 Example 2:

 Input: prices = [1,2,3,4,5]
 Output: 4
 Explanation: Buy on day 1 (price = 1) and sell on day 5 (price = 5), profit = 5-1 = 4.
 Note that you cannot buy on day 1, buy on day 2 and sell them later, as you are engaging multiple transactions at the same time. You must sell before buying again.
 Example 3:

 Input: prices = [7,6,4,3,1]
 Output: 0
 Explanation: In this case, no transaction is done, i.e., max profit = 0.
 */

//Max profit on multiple buy sell

    func maxProfit(_ prices: [Int]) -> Int {
        var output = 0
        guard prices.count > 1 else { return output }
        
        for i in 1..<prices.count where prices[i] > prices[i-1]{
            output += prices[i] - prices[i-1]
        }
        return output
    }

/**
 * Question Link: https://leetcode.com/problems/best-time-to-buy-and-sell-stock/
 * Primary idea: Dynamic Programming, iterate the array while changing lowest
 *               when there is smaller value and update the result
 * Time Complexity: O(n), Space Complexity: O(1)
 *
 */
//Max profit on single buy sell
func maxProfit1(prices: [Int]) -> Int {
    guard prices.count > 1 else { return 0 }
    var maxProfit = 0
    var buyDay = 0
    
    for i in 1..<prices.count {
        let profit = prices[i] - prices[buyDay]
        if profit < 0 {
            buyDay = i
        }
        maxProfit = max(maxProfit, profit)
    }
    return maxProfit
}

print("Max profit \(maxProfit1(prices: [7,1,5,3,6,4]))")


/*
 * Input: [100, 180, 260, 380, 40, 550, 650]
 * Output: [[0, 3] = 280, [4, 6] = 610]
 */
//
//180 -100 = 80,  260- 100 = 160, 380 - 100 = 280, (40 - 100 = -60) loss, sell it before loss
//550 - 40 = 510,


let arr =  [100, 180, 260, 380, 40, 550, 650]
//let arr =  [600, 500, 400, 300, 200, 100]
//let arr =  [700, 200, 300, 400, 500, 600]


func indexsOfMaxProfitOnMultipeBuySell(_ prices:[Int]) -> [[Int]] {
    
    let stocksCount = prices.count

    if stocksCount < 2 {
        return [[0,0]]
    }
    
    var buySellArray = [[Int]]()
    var index = 0

    while index < (stocksCount - 1) {
        
        //Find buy day
        //Find the day when next day price is greater than current day price. Move the index till next day price is lower than current day price
        while index < (stocksCount - 1) && prices[index] >= prices[index + 1] {
            index += 1
        }
        
        if index == stocksCount - 1 {
            break
        }
        let buyDay = index
        
        index = index + 1
        
        //Find sell day
       // Move the index till current day price is greater than previos day price
        while index < stocksCount && prices[index] >= prices[index - 1] {
            index += 1
        }

        buySellArray.append([buyDay, index - 1])
        
    }
    print("buySellArray:\(buySellArray)")
    return buySellArray
}

indexsOfMaxProfitOnMultipeBuySell(arr)

