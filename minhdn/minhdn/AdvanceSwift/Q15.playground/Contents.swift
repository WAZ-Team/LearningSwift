//What is difference between escaping & non-escaping ?

import UIKit

var str = "Hello, playground"
print("escaping thực thi sau khi hàm mà nó được chuyển vào trả về. Đóng tồn tại lâu hơn chức năng mà nó được truyền vào,")
print(" non-escaping  được gọi trong hàm mà nó được truyền vào. Việc thực hiện đóng sẽ diễn ra trước khi hàm trả về")
/* ---Demo non-escaping----*/
func getSumOf(numbers: [Int], completion: (Int) -> Void) {
    //  Excute function.
    var sum = 0
    for aNumber in numbers {
        sum += aNumber
    }
       
    // Function excute closure.
    completion(sum)
}
    
func doSomething() {
    //  Gọi function, truyền closure vào làm tham số.
    getSumOf(numbers: [34, 16, 231, 6 , 23, -83]) { result in
        print("Sum is \(result)")
        //  Closure được excute xong, return compiler và closure out of scope, bị giải phóng khỏi bộ nhớ.
    }
}

/* ---Demon= escaping----*/
func getSumOf1(numbers: [Int], completion: @escaping (Int) -> Void) {
    //  Excute function.
    var sum = 0
    for aNumber in numbers {
        sum += aNumber
    }

    DispatchQueue.glonal.asyncAfter(deadline: .now() + 5) {
            completion(sum)
        }
}
func doSomething1() {
    //  Gọi function, truyền closure vào làm tham số.
    getSumOf1(numbers: [34, 16, 231, 6 , 23, -83]) { result in
        print("Sum is \(result)")
        //  Closure được excute xong, return compiler và closure chưa bị giải phóng vì đang được giữ lại trên queue khác để excute sau.
    }

}
