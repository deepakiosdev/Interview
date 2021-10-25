//https://leetcode.com/problems/max-consecutive-ones/

func consecutiveNumbersCount( _ array: [Int], number: Int) -> Int {
    
    var count = 0
    var maxCount = 0
    var isFound = false
    var isGotConsecutive = false
    
    for item in array {
        
        if item == number {
            if isGotConsecutive {
                count += 1
                maxCount = max(maxCount, count)
            }
            isGotConsecutive = true
            isFound = true
        } else {
            isGotConsecutive = false
            count = 0
        }
    }
    
    if isFound {
       return maxCount + 1
    }
    return 0
    
}

let count = consecutiveNumbersCount([7,7,7,7,7, 2,7,7,2,3,2,7,7,7], number: 7) //5
//let count = consecutiveNumbersCount([2,7,7,2,3,2,7,7,7], number: 7) //3
//let count = consecutiveNumbersCount([4], number: 7) //0
//let count = consecutiveNumbersCount([7], number: 7) //1
print(count)


////////////////
func findMaxConsecutiveOnes1(_ nums: [Int]) -> Int {
    var maxCount = 0
    var index = 0
    
    while index < nums.count {
        
        var consecutiveNumbers = 0
        while index < nums.count && nums[index] == 1 {
            consecutiveNumbers += 1
            index += 1
        }
        maxCount = max(consecutiveNumbers, maxCount)
        index += 1
    }
    return maxCount
}

findMaxConsecutiveOnes1([1,1,0,1,1,1])
//findMaxConsecutiveOnes1([0])

///This one faster than above
func findMaxConsecutiveOnes2(_ nums: [Int]) -> Int {
   
    var count = 0
    var maxCount = 0
    var isFound = false
    var isGotConsecutive = false
    
    for item in nums {
        
        if item == 1 {
            if isGotConsecutive {
                count += 1
                maxCount = max(maxCount, count)
            }
            isGotConsecutive = true
            isFound = true
        } else {
            isGotConsecutive = false
            count = 0
        }
    }
    
    if isFound {
       return maxCount + 1
    }
    return 0
}


////////OR
func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
   
    var maxCount = 0
    var count = 0
    
    for item in nums {
        if item == 1 {
            count += 1
            maxCount = max(maxCount, count)
        } else {
            count = 0
        }
    }
    return maxCount
}

