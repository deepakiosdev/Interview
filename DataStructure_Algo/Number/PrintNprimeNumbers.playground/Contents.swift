import Foundation

//Asked in PayPay Interview

//[2, 3, 5, 7, 11, 13, 17, 19, ...]
func printPrimeNumbers(_ uptoNumber: Int) {
    
    var counter = 1
    var number = 2
    while counter <= uptoNumber {
        
        if isPrime(number) {
            print("counter:\(counter),number:\(number)")
            counter += 1
        }
        number += 1
        
    }
}



func isPrime(_ number: Int) -> Bool {
    return number > 1 && !(2..<(Int(sqrt(Double(number))) + 1)).contains { number % $0 == 0 }
}


func isPrimeNumber(_ number: Int) -> Bool {
    
    guard number > 1 else {
        return false
    }
    
    let squareRootOfNumber = Int(sqrt(Double(number))) + 1
    for index in 2..<squareRootOfNumber {
        
        if number % index == 0 {
            return false
        }
    }
    
    return true
}

printPrimeNumbers(5)

//Print first n prime number
//Efficient way
func eratosthenesSieve(to n: Int) -> [Int] {
    var composite = Array(repeating: false, count: n + 1) // The sieve
    var primes: [Int] = []

    if n >= 150 {
        // Upper bound for the number of primes up to and including `n`,
        // from https://en.wikipedia.org/wiki/Prime_number_theorem#Non-asymptotic_bounds_on_the_prime-counting_function :
        let d = Double(n)
        let upperBound = Int(d / (log(d) - 4))
        primes.reserveCapacity(upperBound)
    } else {
        primes.reserveCapacity(n)
    }

    let squareRootN = Int(Double(n).squareRoot())
    var p = 2
    while p <= squareRootN {
        if !composite[p] {
            primes.append(p)
            for q in stride(from: p * p, through: n, by: p) {
                composite[q] = true
            }
        }
        p += 1
    }
    print("composite:\(composite)")
    print("primes:\(primes)")

    while p <= n {
        if !composite[p] {
            primes.append(p)
        }
        p += 1
    }
    return primes
}

print(eratosthenesSieve(to: 20))

