//What is closure ? How many kind of closure ?
import UIKit

var str = "Hello, playground"
print("Closure là các khối chức năng khép kín có thể được chuyển qua và sử dụng trong mã.Closure có thể nắm bắt và lưu trữ các tham chiếu đến bất kỳ hằng số và biến nào từ ngữ cảnh mà chúng được xác định ")
print("Closure co 3 kieu :Global functions,Nested functions,Closure expressions")
//Global functions: là closures có tên và không “capture” các giá trị.
//Nested functions: là closures có tên và có thể “capture” các giá trị từ function chứa nó.
//Closure expressions: là closures không có tên được viết dưới dạng giản lược syntax và có thể “capture” các giá trị từ các bối cảnh xung quanh.
// global function,nested functions đêù là các kiểu của func
/*----- Demo Closure expresions----*/

// No parameter and return nothing
let sayHello: () -> Void = {
    print("Hello")
}

sayHello()

// Closure take one parameter and return 1 parameter
let value: (Int) -> Int = { (value1) in
    return value1
}
