//What is extension ? How to keep default init of struct ?

import UIKit

var str = "Hello, playground"
print("Extension là thêm chức năng mới vào loại lớp, cấu trúc, kiểu liệt kê hoặc giao thức hiện có. Điều này bao gồm khả năng mở rộng các loại mà bạn không có quyền truy cập vào mã nguồn ban đầu")
/*-----Demo Extension-------*/
extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}
let oneInch = 25.4.mm
print("One inch is \(oneInch) meters")
// Prints "One inch is 0.0254 meters"
let threeFeet = 3.ft
print("Three feet is \(threeFeet) meters")
// Prints "Three feet is 0.914399970739201 meters"


/*-----Demo Keep default init of struct----*/
//struct
struct Person {
    var firstName: String
    var lastName: String
    
}

extension Person {
    init(name: String) {
        let split = name.components(separatedBy: " ")
        firstName = split.first ?? ""
        lastName = split.last ?? ""
    }
}
let taylor1 = Person(firstName: "Taylor", lastName: "Swift")
//them vào person thuoc tinh là fist name va last name
let taylor2 = Person(name: "Taylor Swift")
//them vào person qua name

