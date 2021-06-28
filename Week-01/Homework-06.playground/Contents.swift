import UIKit

/**
 A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

 Find the largest palindrome made from the product of two 3-digit numbers.
 */

//Config
var number: Int = 0
var copyNumber:Int = 0
var currentDigit:Int = 0
var reversedNumber: Int = 0

//Main
ForLoop: for i in (10..<998001).reversed() {
    number = i
    copyNumber = number
    reversedNumber = 0
    
    //Reverses the number
    repeat {
        currentDigit = copyNumber % 10
        reversedNumber = (reversedNumber * 10) + currentDigit
        copyNumber = copyNumber / 10
    } while copyNumber != 0
    
    if(number == reversedNumber){
        for i in (1..<999).reversed() {
            if(number % i == 0) {
                let divider = i;
                let secondDivider = number / divider;
                if(divider >= 100 && divider < 1000 && secondDivider >= 100 && secondDivider < 1000) {
                    print("The largest palindrome made from the product of two 3-digit numbers: \(number) | \(divider) and \(secondDivider)")
                    break ForLoop
                }
            }
        }
    }
}


