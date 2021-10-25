import UIKit

func subarrays(_ arr: [Int]) -> [[Int]] {
    var result: [[Int]] = [[]]
    for elem in arr {
        //print("elem---------:\(elem)")
        //print("result---------:\(result)")

        for subarray in result {
          ///  print("subarray:\(subarray)")
            result.append(subarray + [elem])
           // print("result:\(result)")
        }
    }
    print(result)
    return result
}

//subarrays([1,2,3])


//
func getSubStrings(_ string: String) -> [String] {
    var result: [String] = [""] //Array of character's array
    for elem in string {
        for charsArry in result {
            let concateArr = charsArry + String(elem)
           // OR
           // let concateArr = charsArry + [elem]
            result.append(concateArr)
        }
    }
    print(result)
    return result
}

getSubStrings("dkp") //["", "d", "k", "dk", "p", "dp", "kp", "dkp"]
getSubStrings("mokkori")
//["", "m", "o", "mo", "k", "mk", "ok", "mok", "k", "mk", "ok", "mok", "kk", "mkk", "okk", "mokk", "o", "mo", "oo", "moo", "ko", "mko", "oko", "moko", "ko", "mko", "oko", "moko", "kko", "mkko", "okko", "mokko", "r", "mr", "or", "mor", "kr", "mkr", "okr", "mokr", "kr", "mkr", "okr", "mokr", "kkr", "mkkr", "okkr", "mokkr", "or", "mor", "oor", "moor", "kor", "mkor", "okor", "mokor", "kor", "mkor", "okor", "mokor", "kkor", "mkkor", "okkor", "mokkor", "i", "mi", "oi", "moi", "ki", "mki", "oki", "moki", "ki", "mki", "oki", "moki", "kki", "mkki", "okki", "mokki", "oi", "moi", "ooi", "mooi", "koi", "mkoi", "okoi", "mokoi", "koi", "mkoi", "okoi", "mokoi", "kkoi", "mkkoi", "okkoi", "mokkoi", "ri", "mri", "ori", "mori", "kri", "mkri", "okri", "mokri", "kri", "mkri", "okri", "mokri", "kkri", "mkkri", "okkri", "mokkri", "ori", "mori", "oori", "moori", "kori", "mkori", "okori", "mokori", "kori", "mkori", "okori", "mokori", "kkori", "mkkori", "okkori", "mokkori"]

