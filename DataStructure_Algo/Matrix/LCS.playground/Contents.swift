/*
https://github.com/raywenderlich/swift-algorithm-club/blob/master/Longest%20Common%20Subsequence/LongestCommonSubsequence.swift
 https://www.youtube.com/watch?v=sSno9rV8Rhg
 https://www.geeksforgeeks.org/longest-common-subsequence-dp-4/
*/

extension String {
  public func longestCommonSubsequence(_ other: String) -> String {

    // Computes the length of the lcs using dynamic programming.
    // Output is a matrix of size (n+1)x(m+1), where matrix[x][y] is the length
    // of lcs between substring (0, x-1) of self and substring (0, y-1) of other.
    func lcsLength(_ other: String) -> [[Int]] {

      // Create matrix of size (n+1)x(m+1). The algorithm needs first row and
      // first column to be filled with 0.
      var matrix = [[Int]](repeating: [Int](repeating: 0, count: other.count+1), count: self.count+1)
      for (i, selfChar) in self.enumerated() {
        for (j, otherChar) in other.enumerated() {
          if otherChar == selfChar {
            // Common char found, add 1 to highest lcs found so far from digonal.
            matrix[i+1][j+1] = matrix[i][j] + 1
          } else {
            // Not a match, propagates highest lcs length found so far from previous row and previous column.
            matrix[i+1][j+1] = max(matrix[i][j+1], matrix[i+1][j])
          }
        }
      }

      // Due to propagation, lcs length is at matrix[n][m].
      return matrix
    }

    // Backtracks from matrix[n][m] to matrix[1][1] looking for chars that are
    // common to both strings.
    func backtrack(_ matrix: [[Int]]) -> String {

      var i = self.count
      var j = other.count

      // charInSequence is in sync with i so we can get self[i]
      var charInSequence = self.endIndex

      var lcs = String()

      while i >= 1 && j >= 1 {
        // Indicates propagation without change: no new char was added to lcs.
          print(matrix[i][j])
        if matrix[i][j] == matrix[i][j - 1] { //left, previous column
          j -= 1
        }
        // Indicates propagation without change: no new char was added to lcs.
        else if matrix[i][j] == matrix[i - 1][j] { //Top(just above cell), previous row
          i -= 1
          // As i was decremented, move back charInSequence.
          charInSequence = self.index(before: charInSequence)
        }
        // Value on the left and above are different than current cell.
        // This means 1 was added to lcs length (line 22).
        else {
          i -= 1
          j -= 1
            charInSequence = self.index(before: charInSequence)
//            lcs.append(Array(self)[i]) //Working fine
          lcs.append(self[charInSequence])
        }
      }

      // Due to backtrack, chars were added in reverse order: reverse it back.
      // Append and reverse is faster than inserting at index 0.
      return String(lcs.reversed())
    }

    // Combine dynamic programming approach with backtrack to find the lcs.
    return backtrack(lcsLength(other))
  }
}

//LCS for input Sequences “ABCDGH” and “AEDFHR” is “ADH” of length 3.

let firstString = "ABCDGH"
let secondString = "AEDFHR"
firstString.longestCommonSubsequence(secondString)



/*
 https://www.geeksforgeeks.org/find-if-string-is-k-palindrome-or-not-set-2/
 Find if string is K-Palindrome or not | Set 2
 Given a string, find out if the string is K-Palindrome or not. A K-palindrome string transforms into a palindrome on removing at most k characters from it.

 Examples:

 Input : String - abcdecba, k = 1
 Output : Yes
 String can become palindrome by removing
 1 character i.e. either d or e

 Input  : String - abcdeca, K = 2
 Output : Yes
 Can become palindrome by removing
 2 characters b and e (or b and d).

 Input : String - acdcb, K = 1
 Output : No
 String can not become palindrome by
 removing only one character.
 */
