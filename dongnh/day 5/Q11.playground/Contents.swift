import UIKit

print("type casting là 1 cách để check kiểu của 1 instance, hoặc để xử lí instance đó như một superclass khác hoặc subclass từ 1 vài nơi khác trong hệ thống của class đó")
print("type casting được thực thi với toán tử is và as , sử dụng kiểu dữ liệu any object")

//ex
var things = [Any]()
things.append(100)
things.append(Double.pi)
things.append("Manchester United")

for thing in things {
    switch thing {
    case let aInt as Int:
        print("Interger is \(aInt)")
    case let aDouble as Double:
        print("Double is \(aDouble)")
    case let aString as String:
        print("String is \(aString)")
    default:
        print("Something else")
    }
}
