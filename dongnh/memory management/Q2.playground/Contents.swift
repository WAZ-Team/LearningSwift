import UIKit

print("ARC chỉ có thể giúp chúng ta kiểm soát và giải phóng những object không còn được reference đến nữa. Trong nhiều trường hợp, giả sử chúng ta có 2 object, các object chúng ta đã không còn sử dụng đến nữa, chúng vẫn có reference đến nhau, do đó số reference counting vẫn khác 0, và lúc này chúng ta sẽ bị memory leaks(thất thoát bộ nhớ).")

print("Closure có thể lưu lại constant và variable từ bối cảnh xung quanh nơi mà nó được định nghĩa. Sau đó, closure này sẽ tham chiếu tới và thay đổi giá trị của constant và variable ngay bên trong closure, ngay cả khi phạm vi gốc định nghĩa những giá trị này đã được giải phóng. Ví dụ đơn giản nhất của việc capture value là function lồng, function này được viết ngay bên trong nội dung của một function khác. Function lồng có thể capture các tham số của function cha, và cả những constant, variable được định nghĩa bên trong function đó.")
//ex
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}
