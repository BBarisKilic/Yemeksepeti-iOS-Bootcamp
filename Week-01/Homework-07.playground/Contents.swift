import UIKit

/**
 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

 What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
 */

//Main
var result: Int = 1

func Divider(firstNumber: Int, secondNumber: Int) -> Int {
    if firstNumber % secondNumber == 0 {
        return secondNumber
    } else {
        return Divider(firstNumber: secondNumber, secondNumber: firstNumber % secondNumber)
    }
}

for number in 1...20 {
    result = (result * number) / Divider(firstNumber: result, secondNumber: number)
}

print(result)
