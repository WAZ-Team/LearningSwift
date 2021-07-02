import UIKit

//ex1
func randomArray(_ count: Int, in range1: ClosedRange<Int>) -> [Int] {
    return (0..<count).map { _ in .random(in: range1) }
}

randomArray(20, in: 1...100)

//ex 2

let set1: Set = [1,2,3,4,5,6,7,8,9]
let set2:Set = [1,6,7,21,23,54,2]

let result = set1.intersection(set2)
result.sorted()
print(result)

//ex3

func isPrime(num: Int) -> Bool {
    if num < 2 {
        return false
    }
  
    let k = Int(sqrt(Double(num))) + 1
    for i in 2..<k {
        if num % i == 0 {
            print(i)
            return false
            
        }
    }

    return true
}
isPrime(num: 19)
