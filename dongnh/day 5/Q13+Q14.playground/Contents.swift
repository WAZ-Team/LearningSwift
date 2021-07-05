import UIKit

print("Closure là các khối chức năng khép kín có thể sử dụng lại trong code của bạn ")
print("closure có thể nắm bắt và lưu trữ các tham chiếu đến bất kì hằng số và biến nào từ ngữ cảnh mà chúng được xác định. Điều này được gọi là đóng trên các hằng số và biến đó")

//ex
var string1 = ["A", "D","E","B","C"]
func handleSort(s1:String, s2:String) -> Bool {
    return s1<s2
}

var sortedString = string1.sorted(by: handleSort(s1:s2:))
print(sortedString)
//ex

let someNumbers = [1,2,3,4,5]
var squareNumber = someNumbers.map { (someNumber) -> Int in
    return someNumber * someNumber
}
print(squareNumber)

//
print("có 3 loại closure")
print("-Global function")
print("- nested function")
print("-closure expression")
