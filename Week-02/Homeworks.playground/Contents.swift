import UIKit

//--------------------------------------------------------------------------------------------------------------------

/**
 https://projecteuler.net/
 
 Problem 6
 
 The sum of the squares of the first ten natural numbers is, 1^2 + 2^2 + ... + 10^2 = 385
 The square of the sum of the first ten natural numbers is, (1 + 2 + ... + 10)^2 = 3025
 
 Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 - 385 = 2640
 
 Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
 */

var sumOfTheSquares: Int = 0
var sum: Int = 0

for i in 1..<101 {
    sumOfTheSquares += Int(pow(Double(i),Double(2)))
    sum += i
}

let result = Int(pow(Double(sum),Double(2))) - sumOfTheSquares

print("Difference between the sum of the squares of the first one hundred natural numbers and the square of the sum is \(result)")

//--------------------------------------------------------------------------------------------------------------------

/**
 By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

 What is the 10 001st prime number?
 */

var current: Int = 2
var primeNumbers: [Int: Int] = [:]
var minusOne: Int = 0
var plusOne: Int = 0
var isPrime: Bool

for i in 1... {
    // 6n - 1 and 6n + 1 -> 2 and 3 are the exceptions therefore counts starts with 2.
    minusOne = 6 * i - 1
    plusOne = 6 * i + 1
    
    isPrime = true
    for k in 2..<Int(sqrt(Double(minusOne))) + 1 {
        if(minusOne % k == 0) {
            isPrime = false
            break
        }
    }
    if(isPrime) {
        current += 1
        primeNumbers[current] = minusOne
    }
    
    isPrime = true
    for k in 2..<Int(sqrt(Double(plusOne))) + 1 {
        if(plusOne % k == 0) {
            isPrime = false
            break
        }
    }
    if(isPrime) {
        current += 1
        primeNumbers[current] = plusOne
    }
    
    
    if(current >= 10001) {
        break
    }
}

print("10 001st prime number: \(primeNumbers[10001] as Any)")

//--------------------------------------------------------------------------------------------------------------------

// MARK:- İki parametreli ve FARKLI tipli bir generic örneği yapınız... (T, U) ???

class Person {
    var firstName: String?
    var lastName: String?
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

class Car {
    var color: String?
    
    init(color: String) {
        self.color = color
    }
}

func getCar<T: Person, U: Car>(person: T, car: U) -> String {
    return "\(person.firstName ?? "") wants to buy \(car.color ?? "") car."
}

print(getCar(person: Person.init(firstName: "Barış", lastName: "Kılıç"), car: Car.init(color: "Gray")))

//--------------------------------------------------------------------------------------------------------------------

//MARK: -Girilen bir sayının asal olup olmadığını bulan bir extension:

extension Int {
    func isPrime() -> Bool {
        if self == 2 {
            return true
        }else {
            for i in 2...Int(sqrt(Double(self))) {
                if self % i == 0 {
                    return false
                }
            }
            return true
        }
    }
}
