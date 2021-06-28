import UIKit

/*
 If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
 Find the sum of all the multiples of 3 or 5 below 1000.
*/

var multiplesList: [Int] = []

//Adds all number that can be divisible by either 3 or 5 to Array List.
for i in 0..<1000 {
    if(i%3 == 0) {
        multiplesList.append(i)
    } else if (i%5 == 0) {
        multiplesList.append(i)
    }
}

//Sums up all the numbers inside the array.
print(multiplesList.reduce(0, +))
