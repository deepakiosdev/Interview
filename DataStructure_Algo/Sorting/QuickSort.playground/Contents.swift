import Foundation

/*
 Implement quick sort algorithm
 basic idea is to use pivot index and left and right index
 T- Worst case: O(N^2), best case: O(N Log N), avg case: O(N Log N)
 S - O(N Log N)
 **/



class Program {
    func quickSort(_ array: inout [Int]) -> [Int] {
        quickSortHelper(&array, 0, array.count - 1)
        return array
    }

    func quickSortHelper(_ array: inout [Int], _ startIdx: Int, _ endIdx: Int) {
        //1. base condition
        if startIdx >= endIdx {
            return
        }
        let pivotIdx = startIdx
        var left = startIdx + 1
        var right = endIdx
        
        while left <= right {
            //2. swap elem at left & right
            if array[left] > array[pivotIdx] && array[right] < array[pivotIdx] {
                swap(&array, left, right)
            }
            
            if array[left] <= array[pivotIdx] {
                left += 1
            }
            
            if array[right] >= array[pivotIdx] {
                right -= 1
            }
        }
        //3. swap elem at pivot & right
        swap(&array, pivotIdx, right)
        
        let leftCount = right - 1 - startIdx
        let rightCount = endIdx - right + 1
        
        //4. leftSubarryIsSmall, smaller array should be handled first & then larger
       
       if leftCount < rightCount {
            quickSortHelper(&array, startIdx, right - 1)
            quickSortHelper(&array, right + 1, endIdx)
        } else {
            quickSortHelper(&array, right + 1, endIdx)
            quickSortHelper(&array, startIdx, right - 1)
        }
        /*
         I think this is also fine
        quickSortHelper(&array, startIdx, right - 1)
        quickSortHelper(&array, right + 1, endIdx)
         */

    }
    
    func swap(_ array: inout [Int], _ left: Int, _ right: Int) {
        (array[left], array[right]) = (array[right], array[left])
    }
}

let prg = Program()
var ip = [8, 6, 1, 4, 9, 6]
print("sorted array is \(prg.quickSort(&ip))")

/////////Generic extension
///Need to emprove for generic
extension Array where Element: Comparable {
    mutating func swap(_ left: Int, _ right: Int) {
        (self[left], self[right]) = (self[right], self[left])
    }

    mutating func quickSort() {
        quickSortHelper(0, self.count - 1)
    }

    mutating func quickSortHelper(_ startIdx: Int, _ endIdx: Int) {
        //1. base condition
        if startIdx >= endIdx {
            return
        }
        let pivotIdx = startIdx
        var left = startIdx + 1
        var right = endIdx
        
        while left <= right {
            //2. swap elem at left & right
            if self[left] > self[pivotIdx] && self[right] < self[pivotIdx] {
                swap(left, right)
            }
            
            if self[left] <= self[pivotIdx] {
                left += 1
            }
            
            if self[right] >= self[pivotIdx] {
                right -= 1
            }
        }
        //3. swap elem at pivot & right
        swap(pivotIdx, right)
        
        let leftCount = right - 1 - startIdx
        let rightCount = endIdx - right + 1
        
        //4. leftSubarryIsSmall, smaller array should be handled first & then larger
       
        if leftCount < rightCount {
            quickSortHelper(startIdx, right - 1)
            quickSortHelper(right + 1, endIdx)
        } else {
            quickSortHelper(right + 1, endIdx)
            quickSortHelper(startIdx, right - 1)
        }
    }
    
    func isElementGreaterThan<Element: StringProtocol>( firstElement: Element, secondElement: Element) -> Bool {
        //return firstElement.localizedStandardCompare(firstElement) == .orderedAscending
        return firstElement > secondElement
    }
    
    func isElementLessThan<Element: StringProtocol>( firstElement: Element, secondElement: Element) -> Bool {
        //return firstElement.localizedStandardCompare(firstElement) == .orderedAscending
        return firstElement < secondElement
    }
    
    func isElementGreaterThanEqual<Element: StringProtocol>( firstElement: Element, secondElement: Element) -> Bool {
        //return firstElement.localizedStandardCompare(firstElement) == .orderedAscending
        return firstElement >= secondElement
    }
    
    func isElementLessThanEqual<Element: StringProtocol>( firstElement: Element, secondElement: Element) -> Bool {
        //return firstElement.localizedStandardCompare(firstElement) == .orderedAscending
        return firstElement <= secondElement
    }
}

//var numbers = [13, 77, 20, 45, 2, 15, 0, 59, 5, 68, 51, 1, -1, 77]
//var numbers = ["Step 6", "Step 12", "Step 10"]
var numbers = [ "1", "7", "10", "20", "100", "101", "200", "210", "NA", "NA" ]

numbers.quickSort()
print(numbers)

//https://medium.com/swlh/sorting-algorithms-implementing-quick-sort-using-swift-457a4dbb1bba
//https://medium.com/@notestomyself/how-do-you-implement-quick-sort-in-swift-d0dd0308a473

class GenericQuickSort {
    
    func swap<T: Comparable>(_ array: inout [T], _ left: Int, _ right: Int) {
        (array[left], array[right]) = (array[right], array[left])
    }

    func partition<T: Comparable>(array: inout [T], startIndex: Int, endIndex: Int) -> Int {
        var leftIndex = startIndex
        for index in startIndex..<endIndex {
            if array[index] < array[endIndex] {
                swap(&array, leftIndex, index)
                leftIndex += 1
            }
        }
        swap(&array, leftIndex, endIndex)

        return leftIndex
    }

    func quickSort<T: Comparable>(array: inout [T], startIndex: Int, endIndex: Int) {
        // Base case
        if startIndex >= endIndex {
            return
        }
        let placedItemIndex = partition(array: &array, startIndex: startIndex, endIndex: endIndex)
        quickSort(array: &array, startIndex: startIndex, endIndex: placedItemIndex-1)
        quickSort(array: &array, startIndex: placedItemIndex+1, endIndex: endIndex)
    }

    func quickSort<T: Comparable>(array: inout [T]) {
        quickSort(array: &array, startIndex: 0, endIndex: array.count-1)
    }

}

let quickSort = GenericQuickSort()

//var numbers = [13, 77, 20, 45, 2, 15, 0, 59, 5, 68, 51, 1, -1, 77]
//quickSort.quickSort(array: &numbers)
//print(numbers)

