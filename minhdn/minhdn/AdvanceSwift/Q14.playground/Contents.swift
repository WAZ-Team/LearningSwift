//When should we use closure in Swift ? List some sample about closure in Swift
import UIKit

var str = "Hello, playground"
print("chúng ta sử dụng closure khi  lưu trữ chúng, chuyển chúng dưới dạng đối số cho các hàm và xử lý chúng như với bất kỳ giá trị hoặc đối tượng nào khác")
/*-----Demo Closure mà không có parameters cũng như giá trị trả về------*/
var myClosure = {
    print("Hello I'm a Closure")
}
myClosure()

/*-----Closure có các tham số------*/
var closure: (String) -> Void = { str in
   print(str)
}
var closure1: (Int, Int) -> Void = { first, second in
   print(first + second)
}

/*-----Closure giá trị trả về----*/

var closure2: () -> String = {
 return "Hello Closure"
}
var value1 = closure2()
print(value1)


/*----Trailing Closure---*/
    
func callMe(name: String, closure: (String) -> Void) {
 print("\(name) will call you")
 closure(name)
 print("\(name) did call you")
}
callMe(name: "Smith") { name in
 print(name, "is calling you")
}

