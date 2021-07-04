import UIKit

var q1 = "value types có mỗi instance giữ 1 bản copy duy nhất của 1 dữ liệu, khi muốn thay đổi gía trị hay gán đối tượgn cần sử dụng var "
var q1_2 = "reference type có mỗi instance chia sẻ một bản sao của dữ liệu duy nhất và thường được định nghĩa là class "
//ex
//value types

struct S { var data: Int = -1 }
var a = S()
var b = a                        // a is copied to b
a.data = 42                        // Changes a, not b
print("\(a.data), \(b.data)")
//reference types

class C { var data: Int = -1 }
var x = C()
var y = x                        // x is copied to y
x.data = 42                        // changes the instance referred to by x (and y)
print("\(x.data), \(y.data)")

//khi nào sử dụng value types
print("sử dụng value types khi so sánh instance data với == và khi muốn có bản sao ở trạng thái độc lập")

// khi nào sử dụng reference types
print("so sánh instance identity với === và tạo trạng thái có thể thay đổi, chia sẻ")

print("value types dùng cho int, double, string, array, dictionary,...")
print("reference types  dùng cho function, closures , class")







