import UIKit

print("extension là một tính năng mới và chỉ được dùng cho class, Struct, enumeration hoặc Protocol. Nó có khả năng mở rộng để có thể thêm các hàm hoặc các Properties mới cho Class, Struct , Enumeration hoặc Protocol, Nếu bạn nào đã tìm hiểu Objective-C thì sẽ thấy nó giống với tính năng Categories. Khác với Categories, Extension không có tên.\n")
//ex
struct retangle {
    var width, height  :Double
}
extension retangle {
    func calculateArea() -> Double {
        return self.width * self.height
    }
}

let retangle1 = retangle(width: 100, height: 200)
print(retangle1.calculateArea())

extension Double {
    mutating func square() {
        self = self * self
    }
}

var doubleSquare = 123.4
var a = doubleSquare.square()

print(a)

