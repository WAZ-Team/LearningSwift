import UIKit

var q1 = "Swift is a powerful and intuitive programming language for iOS, iPadOS, macOS, tvOS, and watchOS. Writing Swift code is interactive and fun, the syntax is concise yet expressive, and Swift includes modern features developers love. Swift code is safe by design, yet also produces software that runs lightning-fast."
//--------------------------------------------------
var q2 = "Swift là loại ngôn ngữ an toàn vì Swift cho phép chúng ta có thể tạo biến theo nhiều kiểu dữ liệu, khi chúng ta gán giá trị cho biến thì Swift sẽ ghi nhớ và sẽ luôn có giá trị kiểu cụ thể đó.ví dụ khi ta gán 1 biến có kiểu Int thì chúng ta có thể thay đổi giá trị nếu cần nhưng sẽ không thể nào thay đổi kiểu của nó: nó sẽ luôn là số nguyên. Điều này đảm bảo rằng chúng ta sẽ không mắc lỗi với kiểu dữ liệu của mình "

//--------------------------------------------------
var q3 = "Constant và Variable đều là tên dùng để khai báo nhưng thuộc 2 loại kiểu khác nhau. Biến thì có thể thay đổi còn hằng thì không"

var q3_2 = "Khai báo hằng với let còn biến với var"

//Example
var animal = "Dog"
animal = "Cat"

let pi = 3.14
//pi = 4.15 ( error because let cant change value of variable)

//--------------------------------------------------
var q4 = "Comment trong code là 1 cách để chúng ta chú thích cho code của mình trở nên dễ hiểu hơn"

var q4_2 = "Giống như trong C, khi comment trong swift thì ta dùng // khi chú thích 1 dòng đơn và /* ... */ khi chú thích nhiều dòng"
//this example is useds more times in this playground

//----------------------------------------------------
var q5 = "String interpolation là 1 chuỗi mà ta có thể kết hợp được các hằng, biến, kí tự vào trong 1 kí tự chuỗi, Môi kiểu ta chèn vào được đặt sau tiền tố '\'"
var q5_2 = "Swift cần String interpolation vì trong 1 chuỗi thì ta có thể nhập được cả chữ và số"

//ex:
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"

//-----------------------------------------------------
var q6 = "Collection type là các kiểu lưu trữ dữ liệu trong swift, gồm 3 loại: Arrays, set và Dictionaries"

var q6_2 = "Array lưu trữ các giá trị có cùng kiểu dữ liệu theo một danh sách có thứ tự. Các thứ tự  có thể truy xuất thông qua vị trí index trong array"

//ex:
var a = Array(repeating: 5, count: 5)
var b = Array(repeating: 7, count: 2)
var c = a+b;
print(c)

var q6_3 = "Set là kiểu dữ liệu mảng nhưng ko càn quan tâm đến thứ tự sắp xếp của nó, có thể thay thế Array trong trường hợp các giá trị không quan trọng hoặc chỉ muốn xuất hiện 1 lần"

//ex
var footballPlayer : Set<String> = ["Messi", "Ronaldo", "Neymar", "Suarez"]
footballPlayer.insert("Dong")
footballPlayer.remove("Neymar")
print(footballPlayer)


var q6_4 = "Dictionaries là kiểu dữ liệu mảng theo dạng key => value. Mỗi key là duy nhất nhưng value thì có thể trùng nhau, phù hợp khi làm việc với Database"

//-------------------------------------------------------
var q7 = "Double ko thể thêm vào Int trong swift vì chúng ko an toàn, vì Double có thể lưu trữ dạng thập phân mà int ko thể, làm mất trong sự hiển thị kết quả với số nguyên"

//-------------------------------------------------------

var q8 = "Ternary operator là toán tử bậc ba cho phép chúng ta chạy một lệnh kiểm tra và trả về một trong 2 giá trị tùy thuộc vào kết quả của kiểm tra đó, nó sử dụng dấu ? và :"
var q8_2 = "chúng ta nhìn thấy toán tử bậc 3 khi cần sử dụng so sánh điều kiện của một mệnh đề nào đó"
//ex
let score = 88
let result = score > 85 ? "Pass" : "Fail"
print(result)

//----------------------------------------------------------
var q9 = "chúng ta dùng switch tốt hơn if else khi điều kiện kết quả hướng đến là 1 giá trị cố định, còn if else thì phù hợp cho dạng kết quả boolean"
//ex

enum Compass {
    case north
    case east
    case south
    case west
}
let heading = Compass.south
switch heading {
case .north:
    print("You're heading north!")
case .east:
    print("You're heading east!")
case .south:
    print("You're heading south!")
case .west:
    print("You're heading west!")
}

//=================================================================

var q10 = "Range operator là toán tử phạm vi, giúp cho có thể dễ dàng set được khoảng giá trị của 1 biến bất kì"
//ex
let range: ClosedRange = 0...10
print(range.first!)
print(range.last!)
//ex2
let names = ["Antoine", "Griezzman", "Japan"]
let range1: CountableClosedRange = 0...2
print(names[range1])
//ex3
let name = ["Antoine", "Griezzman", "Japan"]
print(name[0..<names.count])

//=================================================================

var q11 = "có 2 vòng lặp trong swift là For - in và For - each"

//=================================================================

var q12 = "Break là câu lệnh dùng để thoát khỏi vòng lặp hoặc 1 chương trình đang chạy còn Continue là tiếp tục vòng lặp hoặc chương trình đang chạy Continue chỉ dùng cho For-in và ko dùng cho For-each và ngược lại với break"
//ex break
for i in (1...5){
    if (i==4) {
        break;
    }
}
//ex continue
for i in (1...5){
    if (i==1) {
        continue
    }
}

//==================================================================

var q13 = "Ommiting parameter là loại tham biến được đặt ở trong hàm, có thể gọi lại tại 1 nơi khác và sử dụng lại tham số ommit với giá trị mình muốn thay vào"
//ex    
func city(_ name: String) {
    print("\(name) is a good city to life")
}
city("hanoi")
 
//==================================================================

var q14 = "Tất cả tham số trong swift đều là hằng số nên ko thể thay đổi được. Nếu muốn thay đổi chúng thì ta sẽ phải chuyển một hoặc nhiều tham số dưới dạng Inout"
//ex
func changeNumber(number: inout Int) {
    number *= 2
}

var myNum = 10
changeNumber(number: &myNum)

//================================================================
var q15 = "Co 5 access control trong Swift. Nó là open, public, internal, fileprivate và private"
// so sánh open và public
print("Open giúp chúng ta có thể truy cập, kế thừa, subclass bên ngoài module còn Public thì không")
// tìm hiểu thêm

//================================================================

var q16 = "Static variable là những biến tĩnh có giá trị được chia sẻ giữa các thực thể và đối tượng của 1 lớp. Các static variables khi được sử dụng trong hàm chỉ được khởi tạo 1 lần  và chúng sẽ giữ giá trị ở đó ngay cả khi gọi hàm. Nếu chúng ta không sử dụng static thì trong 1 vòng lắp, biến đó sẽ được khởi động lại mỗi khi bắt đầu và hủy khi kết thúc mỗi vòng lặp nhưng nếu sử dụng static thì giá trị sẽ được lưu trữ lại qua mỗi vòng kặp"
//ex:

var q16_2 = "Static function là hàm được gọi bởi chính class của nó, không phải một biến. Nó làm cho việc gọi 1 hàm trở nên đơn giản hơn thay vì phải quản lí một đối tượng để thực hiện việc đó"
//ex:
class AppUtils {
    static func appUtility() {
    }
}
// sau đó chúng ta có thể gọi bằng cách dử dụng
AppUtils.appUtility()

//================================================================
var q17 = "Lazy anotation cho phép chúng ta thực hiện: khởi tạo một struct, giá trị ban đầu mà không cần cung cấp giá trị ban đầu"
var q17_2 = "tạm dừng task bất kì nào cho tới khi cần thiết"
var q17_3 = "Tránh việc tính toán lại, giá trị sau khi được tính lần đầu tiên sẽ được lưu trữ lại và sử dụng cho lần tiếp theo, tránh được việc sẽ tốn nhiều thời gian để xử lí"

//ex
class User
{
    let firstName:String
    let lastName: String
    let fullname: String
    
    lazy var numOfUser: [Int] = {
        var list:[Int] = []
        for i in 0 ..< 20 {
            print(i, terminator:",")
            list.append(i)
        }
        return list
    }()
    
    public init(firstname:String, lastName: String){
        self.firstName = firstname
        self.lastName = lastName
    }
}

let user1 = User(firstname: "Lionel", lastName: "Messi")
user1.numOfUser
user1.numOfUser
