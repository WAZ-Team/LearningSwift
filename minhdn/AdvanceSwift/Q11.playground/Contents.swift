//What is difference between guard-let & if-let ? When should we use ?

import UIKit
var str = "Hello, playground"

print("guard let được sử dụng để cung cấp trả về sớm mà không yêu cầu xet phần còn lại của hàm.if let chạy trong phạm vi của nó, và không yêu cầu bất kỳ điều gì đặc biệt của nó. Nó có thể return hoặc không" )
/* ----Demo If let-----*/
func giveAwardTo(name: String) -> String {
    let message: String
    
    if name == "Taylor Swift" {
        message = "Congratulations, \(name)!"
    } else {
        message = "No way!"
    }
    
    return message
}

giveAwardTo(name: "Taylor Swift")

/* ---Demo gruad let----*/

func giveAwardTo1(name1: String) {
    guard name1 == "Taylor Swift" else {
        print("No way!")
        return
    }
    print("Congratulations, \(name1)!")
}

giveAwardTo1(name1: "Taylor Swift")

/*-----Demo gruad let vs if let ---*/
func giveAwardTo2(name2: String?) {
    
    guard let winner = name2 else {
        print("No one won the award")
        return
    }
    print("Congratulations, \(winner)!")
}

func giveAwardTo3(name3: String?) -> String {
    let message: String
    let winner:String
    if  winner == name3  {
        message = "Congratulations, \(name3)!"
    } else {
        message = "No way!"
    }
    
    return message
}
//Nếu sử dụng if-let, biến winner sẽ chỉ có thể được sử dụng ở trong nội bộ đoạn if (trong dấu ngoặc {} của đoạn if đó), nhưng nếu dùng guard, toàn bộ đoạn code phía sau (thuộc scope của hàm giveAwardTo()) có thể sử dụng giá trị của biến này.s



