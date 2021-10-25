import Foundation


func roman(n: Int) -> String
{
    let decimals = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
    let numerals = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]

    var result = ""
    var number = n

    while number > 0
    {
       // print("number:\(number)")

        for (index, decimal) in decimals.enumerated()
        {
            //print("decimal:\(decimal)")

            if number - decimal >= 0 {
                number -= decimal
                result += numerals[index]
                //print("result:\(result)")
                break
            }
        }
    }

    return result
}


/*
 Input : 9
 Output : IX

 Input : 40
 Output : XL

 Input :  1904
 Output : MCMIV
 */

//print(roman(n: 9))
//print(roman(n: 2019)) //MMXIX
//print(roman(n: 1776)) //MDCCLXXVI
//print(roman(n: 1999)) //MCMXCIX
print(roman(n: 3999)) //MMMCMXCIX

func printRoman(_ n: Int) -> String {
    
    let decimals = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
    let numerals = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
    var romanString = ""
    var number = n
    
    
    for (index, roman) in numerals.enumerated() where number > 0 {

        var div = number / decimals[index]
        number = number % decimals[index]
        
        while div > 0 {
            romanString += roman
            div -= 1
        }
    }
    
    print("romanString: \(romanString)")
    return romanString
}

printRoman(3999)
