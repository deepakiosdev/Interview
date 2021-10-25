
func secondLargeastElementInArray(_ arr: [Int]) -> Int{
   
    var firstLargest = 0
    var secondLargest = 0
 
    guard arr.count > 1 else {
        return secondLargest
    }
    
    for number in arr {
        
        if number > firstLargest {
            secondLargest = firstLargest
            firstLargest = number
        } else if (number < firstLargest && number > secondLargest && number != firstLargest) {
            secondLargest = number
        }
    }
    return secondLargest
    
}

let secondLargest = secondLargeastElementInArray([10,2,5,2])
print(secondLargest)



func thirdLargeastElementInArray(_ arr: [Int]) -> Int{
   
    var firstLargest = 0
    var secondLargest = 0
    var thirdLargest = 0

    guard arr.count > 2 else {
        return thirdLargest
    }
    
    
    //If all largest numbers is different
    for number in arr {
        
        if number > firstLargest {
            thirdLargest = secondLargest
            secondLargest = firstLargest
            firstLargest = number
        } else if (number < firstLargest && number > secondLargest && number != firstLargest) {
            thirdLargest = secondLargest
            secondLargest = number
        } else if (number < secondLargest && number > thirdLargest && number != secondLargest) {
            thirdLargest = number
        }
    }
    
 
    //If all largest numbers can be same
    /*for number in arr {
        
        if number > firstLargest {
            thirdLargest = secondLargest
            secondLargest = firstLargest
            firstLargest = number
        } else if (number > secondLargest) {
            thirdLargest = secondLargest
            secondLargest = number
        } else if (number > thirdLargest) {
            thirdLargest = number
        }
    }*/
    return thirdLargest
    
}

let thirdLargest = thirdLargeastElementInArray([10,10,10])
print("thirdLargest:\(thirdLargest)")
