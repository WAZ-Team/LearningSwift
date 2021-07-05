//What is protocol ? List some samples protocol in Swift
import UIKit

var str = "Hello, playground"
print("protocol là các phương thức, thuộc tính và các yêu cầu khác phù hợp với một nhiệm vụ hoặc một phần chức năng cụ thể. Sau đó, protocol có thể được chấp nhận bởi một lớp, cấu trúc hoặc kiểu liệt kê để cung cấp việc triển khai thực tế các yêu cầu đó")

/*---- Demo protocol----*/

protocol SomeProtocol {
    // protocol definition goes here
}
protocol SomeProtocol2 {
    // protocol definition goes here
}
struct SomeStructure: SomeProtocol, SomeProtocol2 {
    // structure definition goes here
}
class SomeClass: SomeProtocol, SomeProtocol2{
    // class definition goes here
}

//----------------------
