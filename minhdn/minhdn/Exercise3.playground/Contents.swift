//Ex3: Write function with ommit parameter type Int and validate it is prime number ?
// nhap so n vao roi kiem tra xem no co chia het cho 2,3,5,7 khong? neu chia het thi khong laf snt nguoc lai la snt
//nhap n vao roi kiem tra neu no nhỏ hơn 2 thi nó khong là snt ,neu lon hon 2 ta xet can bac 2 của n lay phan nguyen roi cong 1 là k .cho vong lặp chạy từ 2 đến k neu chia het 1 so nao do trong day tu 1 den k thi no là khong là snt.nếu k chia hết cho bất kì so nao trong day thì nó là snt

import UIKit

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
isPrime(num: 4398042316799)
