import UIKit

/*
 The prime factors of 13195 are 5, 7, 13 and 29.

 What is the largest prime factor of the number 600851475143 ?
 */

var number: Int = 600851475143
var primeNumberCandidates: [Int] = []
var primeNumbers: [Int] = []

//Finds divider numbers of the number.
for i in 2..<Int(sqrt(Double(number))) {
    if(number%i == 0) {
        primeNumberCandidates.append(i)
    }
}

//Checks if divider number is also a prime factor.
for i in 0..<primeNumberCandidates.count {
    var isPrimeCandidate: Bool = true
    
    for previous in 0..<i {
        if (primeNumberCandidates[i] % primeNumberCandidates[previous] == 0) {
            isPrimeCandidate = false
            break
        }
    }
    
    if(isPrimeCandidate) {
        primeNumbers.append(primeNumberCandidates[i])
    }
}

print(primeNumbers.last ?? "No prime factor")
