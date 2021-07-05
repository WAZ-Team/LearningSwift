//What is Optional ?How to unwrap an optional variable ?

import UIKit

var str = "Hello, playground"
print("là một hằng số hoặc biến có thể giữ một giá trị HOẶC không có giá trị. Giá trị có thể có hoặc không thể là nil. Nó được biểu thị bằng cách thêm dấu “?” sau khi khai báo kiểu")

/*-----Demo optional ----------*/

var tweet: String?
tweet = "Now assigning a string to tweet, thus giving tweet a value"


/*----Demo unwrap an optional----*/
//Using an if else

var variable:String? //evaluates to nil

if variable != nil{
 print("Not nil")
}
else{
 print("Nil")
}
//Output : Nil

//Using Forced unwrapping
var color:String?;
print(color!) // Unexpectedly found nil while unwrapping an Optional value
color = "Black";
print(color!) // Black

//Using Optional binding

var password:String? = "hi"
if let unwrappedpass = password {
    print("Password is \(unwrappedpass)") //Password is hi
}

//Using Optional chaining

class ShipmentCar{
    var seats:Int?
    var quality:String?
    
    init(seatQty:Int){
        seats = seatQty
    }
    func displaySeatQuality(){
        if let seatQuality = quality{
            print("The seat covering is made of:\(seatQuality)")
        }
    }
}
class CheckSeats{
    var seatExists:ShipmentCar?

}
var obj = ShipmentCar(seatQty:4)
var obj2:CheckSeats?
obj2 = CheckSeats()
obj2?.seatExists = obj
obj2?.seatExists?.quality = "Leather" //Optional chaining, set leather quality of seats, only if seats exist.
obj.displaySeatQuality()
//Output: The seat covering is made of: Leather

//Using a nil coalescing operator
var text:String?

var output = text ?? "Default value"

print(output) // Default value

text = "This is a string"

output = text ?? "Default String"

print(output) // This is a string
