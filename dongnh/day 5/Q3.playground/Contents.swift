import UIKit

var q3 = "mutation là hàm dùng để thay đổi giá trị các biến trong struct( vì trong struct ko thay đổi được)"
struct Person {
    var name: String

    mutating func makeName() {
        name = "Dong"
    }
}
var person = Person(name: "Dong2")
person.makeName()
print(person)

//=================================================================================================================

var q4 = "Property gán giá trị với 1 class, structure hoặc enumeration cụ thể. Stored property lưu giá trị hằng và biến như là 1 phần của đối tượng, khi computed property tính giá trị. Computed property được cung cấp bởi class, structure và enumeration. Stored property được cung cấp bởi class và structure."
var q4_2 = "Có hai loại property observer: willSet và didSet được gọi trước và sau khi giá trị thay đổi. Ở willSet bạn sẽ có thêm một giá trị là newValue - chỉ được sử dụng trong scope của willSet, còn didSet bạn sẽ có thêm oldValue - chỉ được sử dụng trong scope của didSet"
