//When should we use protocol inheritance? When are protocol extensions useful in Swift?
import UIKit

var str = "Hello, playground"
print("Một giao thức có thể kế thừa một hoặc nhiều giao thức khác và có thể thêm các yêu cầu khác lên trên các yêu cầu mà nó kế thừa")
/*----Demo Protocol inheritance------*/
//cho phép chúng tôi chia sẻ các định nghĩa và giảm sự trùng lặp
//hạn chế bổ sung khi chúng có ý nghĩa.
protocol Product {
    var price: Double { get set }
    var weight: Int { get set }
}
protocol Computer: Product {
    var cpu: String { get set }
    var memory: Int { get set }
    var storage: Int { get set }
}
protocol Laptop: Computer {
    var screenSize: Int { get set }
}


/*----Demo Protocol extension------*/
//cho phép bạn cung cấp mã bên trong các phương thức của mình, nhưng chỉ ảnh hưởng đến một loại dữ liệu - bạn không thể thêm phương thức vào nhiều loại cùng một lúc.

let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
let beatles = Set(["John", "Paul", "George", "Ringo"])
//
extension Collection {
    func summarize() {
        print("There are \(count) of us:")

        for name in self {
            print(name)
        }
    }
}
pythons.summarize()
beatles.summarize()
