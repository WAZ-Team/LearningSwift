//What is property ? What is difference between willSet & didSet ?

import UIKit

print("property liên kết các giá trị với một class, structure hay enumeration cụ thể. Stored properties lưu trữ các giá trị constant và variable như là một phần của một instance, trong khi computed properties có nhiệm vụ tính toán hơn là lưu trữ một giá trị.")

/*-----Demo Stored Properties---------*/
//Lưu trữ các giá trị hằng và biến dưới dạng phiên bản
//Được cung cấp bởi các lớp và cấu trúc

struct SuperMarket {
    var address: String
    let size: String
}
let vinMart = SuperMarket(address: "Danang", size: "small")
vinMart.address = "Dalat"
// Error in compiler

/*-------Demo Computed Property ------*/
//Tính toán một giá trị thay vì lưu trữ giá trị
//Được cung cấp bởi các lớp, kiểu liệt kê và cấu trúc

class sample {
   var no1 = 0.0, no2 = 0.0
   var weight = 300.0, hight = 150.0

   var middle: (Double, Double) {
      get {
         return (weight / 2, hight / 2)
      }
      
      set(axis){
         no1 = axis.0 - (weight / 2)
         no2 = axis.1 - (hight / 2)
      }
   }
}

var result = sample()
print(result.middle)
result.middle = (0.0, 10.0)

print(result.no1)
print(result.no2)

//-------------------------
print("didSet thực hiện hành động sau khi thay đổi xảy ra để chúng tôi có thể cập nhật giao diện người dùng, lưu thay đổi hoặc bất cứ điều gì")

print("willSet được sử dụng là khi bạn cần biết trạng thái chương trình của mình trước khi thực hiện thay đổi. ")
