import UIKit

var cau1 = "What is Swift programing language ?"
print("Swift is a  programming language for iOS, macOS, watchOS, and tvOS app development. Nonetheless, many parts of Swift will be familiar from your experience of developing in C and Objective-C.")

//--------------------------------------------------------

var cau2 = "Why is Swift a type-safe language?"
print("Swift lets us create variables as strings and integers, but also many other types of data too. When you create a variable Swift can figure out what type the variable is based on what kind of data you assign to it, and from then on that variable will always have that one specific type.")

/* demo swift a type-safe language*/
var math = 42
// math đã nhận giá trị là int thì khong thể chuyển sang string
//    math = "bon muoi hai"
//---------------------------------------------------------

var cau3 = "What is Constants and Variables ? How to declare Constants and Variables in Swift ?"

print(" constant is a value, and it cannot be changed.Variables are the variables and can be changed.")

print("constants use the let keyword.constant:-A constant does not change its value over time.Constants are usually written in numbers.Constants usually represent the known values in an equation, expression or in line of programming.Constants are used in computer programming.")

/* Demo constant */

let name = "minh"
//name = "dong"
print(name)

//--------------------------------------------------------
print(" variable use the var keyword.Variables:A variable, on the other hand, changes its value dependent on the equation.Variables are specially written in letters or symbols.Variables, on the other hand, represent  the unknown values.Variables also have its uses in computer programming and applications.")

/* Demo variable*/

var name1 = "Minh"
name1 = "Dong"
print(name1)

//-------------------------------------------------------------

var cau4 = "What is Comments in code ? How to write comment in Swift ?"
print("comments use to make our code more understandable.There are two ways to add comments in Swift:[// - Single Line comments].[/*...*/ - Multiline Comments]")

var cau5 = "What is string interpolation ? Why does Swift have string interpolation?"
print(" String interpolation is a way to construct a new String value from a mix of constants, variables, literals, and expressions by including their values inside a string literal. You can use string interpolation in both single-line and multiline string literals. Each item that you insert into the string literal is wrapped in a pair of parentheses, prefixed by a backslash '\' ")

print(" String interpolation là một cách để xây dựng một Stringgiá trị mới từ hỗn hợp các hằng số, biến, ký tự và biểu thức bằng cách bao gồm các giá trị của chúng bên trong một ký tự chuỗi. Bạn có thể sử dụng nội suy chuỗi trong cả ký tự chuỗi một dòng và nhiều dòng. Mỗi mục mà bạn chèn vào chuỗi ký tự được bao bọc trong một cặp dấu ngoặc đơn, có tiền tố là dấu gạch chéo ngược  '\' ")

/* Demo String interpolation */

let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
// message is "3 times 2.5 is 7.5"

//------------------------------------------------------------

var cau6 = "How many collections in Swift ? What is different between each other ?"
print("collections in Swift have an array, a set, or a dictionary")

/* Demo mang(array): mảng lưu trữ các giá trị cùng kiểu trong một danh sách có thứ tự. Cùng một giá trị có thể xuất hiện trong một mảng nhiều lần ở các vị trí khác nhau.*/

var NameList: [String] = ["Minh", "Dong"]
NameList.append("Dung")
NameList += ["ha"]

// shoppingList now contains 4 items
print("someInts is of type [Int] with \(NameList.count) items.")
NameList.insert("phuong", at: 0)
print(NameList)
let RemoveName = NameList.remove(at: 0)

// the item that was at index 0 has just been removed
print(RemoveName)

//------------------------------------------------------------------------
/* Demo sets:la mot tập hợp lưu trữ các giá trị riêng biệt của cùng một kiểu trong một tập hợp không có thứ tự xác định. Bạn có thể sử dụng một tập hợp thay vì một mảng khi thứ tự của các mục không quan trọng hoặc khi bạn cần đảm bảo rằng một mục chỉ xuất hiện một lần.*/

var letters: Set = ["Minh","dong"]
print(letters)
print("letters is of type Set<Character> with \(letters.count) items.")
letters.insert("yen")

//chen phan tu
print(letters)
letters.remove("dong")

// xoa phan tu
print(letters)

//----------------------------------------------------------------------
/* Demo Dictionary: Một Dictionary là một khối chứa cặp key-values. Trong đó, key được dùng để định danh duy nhất cho value (giá trị). Một Dictionary không đảm bảo thứ tự các cặp key-values được xếp bởi vì chúng ta tìm kiếm value theo key hơn là theo index của value. Dictionary khá hữu dụng cho việc sắp xếp các mục để có thể giống với các định danh duy nhất, nơi mà các định danh đó được dùng để lấy giá trị các mục.*/

var countries : [String: String] = ["UK": "United Kingdom", "GE": "Germany", "RU": "Russia", "FR": "France"]

//them string
countries["VN"] = "VietNam"
print(countries)

//thay the
countries["VN"] = "VietNamese"
print(countries)

//xoa
let removedValue = countries.removeValue(forKey: "UK")
print(countries)
let Updatecountries = countries.updateValue("Japan", forKey: "GE")
print(countries)

//-------------------------------------

var cau7 = "Why can’t Swift add a Double to an Int?"

print("Int chỉ lưu trữ các số nguyên trong khi Double có thể lưu trữ các giá trị sau vị trí thập phân.không an toàn khi thêm Double vào dấu Int vì chúng ta mất bất kỳ số nào sau dấu thập phân và không an toàn khi thêm dấu Int vào a Double vì chúng ta mất độ chính xác.")

/* Demo Double va Int */
let value: Double = 90000000000000001
//let value: Int = 90000000000000001
//----------------------------------------
var cau8 = "What is the ternary operator in Swift ? When should you use ?"

print("ternary operator: Đó là một phím tắt để đánh giá một trong hai biểu thức dựa trên việc đúng hay sai. Nếu đúng, nó đánh giá và trả về giá trị của nó; nếu không, nó đánh giá và trả về giá trị của nó.")

/* Demo Ternary operator*/

if countries.isEmpty {
    print("khong co phan tu nao")
}else{
    print("co \(countries.count) phan tu")
}

//------------------------------------------

var cau9 = "When should you use switch statements rather than if?"

print("câu lệnh switch thường hiệu quả hơn một tập hợp các if lồng nhau.Switch tốt hơn trong việc phân nhánh các cách khác nhau")

/*---Demo Switch*/

print(countries.count)
let check = 2
switch check{
    case 0:
        print(NameList[1])
        break;
    case 1:
        print(NameList[2])
        break;
    case 2:
        print(NameList[3])
        break;
    case 3:
        print(NameList[4])
        break;
    default:
        print("khong so")
        break;
}

/*----Demo IF- else----*/
if check > 0{
    if check < NameList.count{
        print(NameList[check])
    }else{
        print("qua gioi han gia tri")
    }
}else{
    print("khong co gai tri check")
}

//-------------------------------------------------

var cau10 = "   What is Range operators ?"
print("toán tử phạm vi thể hiện một phạm vi giá trị.")
/*----Demo toan tu pham vi */
let score = 100

switch score {
case 0..<50:
    print("You failed badly.")
case 50..<100:
    print("You did OK.")
default:
    print("You did great!")
}

//-----------------------------------------------

var cau11 = "How many kind of loop in Swift ? What is different between forin and foreach ?"
print("co 3 loại là for_in , while  va repeat")

/* Demo -----for_in--------*/

for i in 1...10 {
    print(i)
}

/* Demon ----while---------*/

var j =  1
while j <=  10 {
     print (j)
    j = j +  1
}

/* Demo -----Repeat------*/

var k =  1
repeat {
     print (k)
    k = k +  1
} while k <  10

/* Demo sự khacs nhau giữa for_in và for -each : -  ý nghĩa của return khac nhau
                                                - for each không thể sử dụng continue hoặc break*/
// Sử dụng return trong for_in:

func for_in(){
for m in [1, 2, 3, 4] {
     if m == 2 { return }
     print("for - \(m)")
 }
}
for_in()

//  Sử dụng return trong for_each

func for_each(){
[1, 2, 3, 4].forEach { q in
    if q == 2 { return }
    print("forEach -- \(q)")
}
}
for_each()

//. Sử dụng continue trong for each

func for_each_continue(){
//[1, 2, 3, 4].forEach { q in
//    if q == 2 { continue }
//    print("forEach -- \(q)")
//}
}
for_each_continue()

//. Sử dụng break trong for each

func for_each_break(){
//[1, 2, 3, 4].forEach { q in
//    if q == 2 { break }
//    print("forEach -- \(q)")
//}
}
for_each_break()

//---------------------------------------------------

var cau12 = "What is different between continue and break ?"
print("Cả “break” và “continue” đều là câu lệnh “jump” , chuyển quyền điều khiển chương trình sang một phần khác của chương trình. Sự khác biệt chính giữa break và continue là break được sử dụng để kết thúc vòng lặp ngay lập tức. Mặt khác, 'tiếp tục' chấm dứt vòng lặp hiện tại và tiếp tục điều khiển cho lần lặp tiếp theo của vòng lặp.")

/*--------- Demo break---------*/

for w in 1...10{
    if w == 4 {
        
        break //ket thuc vong lap
    }
    print(w)
}

/*----------Demo Continue-------*/

for e in 1...10{
    if e == 4 {
        continue // tiep tuc vong lap
    }
    print(e)
}

//--------------------------------------------------------------

var cau13 = "What is Omitting parameter labels ?"

print("parameter labels(Nhãn đối số) là tên tham số mà các hàm sử dụng. Khi khai báo nhãn đối số, có các tùy chọn để chúng bị bỏ qua hoặc được gắn nhãn là một cái gì đó khác khi gọi hàm")
/*-----Demo omitting parametter lables--------- */

func Country(_ Num: String) {
    print("Hello, \(Num)!")
}
Country("VietNam")


//------------------------------------------------------------

var cau14 = "What is inout parameter ?"
print("in_out parameter có nghĩa là việc sửa đổi biến cục bộ cũng sẽ sửa đổi các tham số được truyền vào. Nếu không có nó, các tham số được truyền vào sẽ vẫn giữ nguyên giá trị.")
/* ---------Demo inout parameter--------- */

func doubleInPlace(number: inout Int) {
    number *= 2
}

var myNum = 10
doubleInPlace(number: &myNum)

//----------------------------------------------------------------------

var cau15 = "How many kind of access control in Swift ? What is different between each other ?"

print("Có 5 loại kiểm soát truy nhập là open , public , internal , fileprivate , private ")

/* ---------Demo Access control------------*/

//------open----------
//có thể truy cập nó từ bất kỳ mô-đun hoặc tệp nguồn nào.
//có thể sử dụng chỉ bằng cách nhập mô-đun đó.
//có thể ghi đè lớp hoặc thành viên lớp đó cũng như phân lớp nó.
open class Openfunc {
    func pr(){
    print("My type is open so anyone can override me.")
}
}
//Mọi người đều có thể sửa dữ liệu ở trong
class Demo:Openfunc{} // khong bi loi

//--------Public------
//có thể truy cập được nhưng không thể ghi đè bên ngoài mô-đun xác định.

public func publicfunc() {
print("My type is public so no one can override me.")
}
//  class Demo2:publicfunc{}  //lỗi

//-----------Internal------------
//hạn chế việc sử dụng tệp nguồn xác định của chính nó.
//Chỉ có thể sử dụng thông số truy cập này nếu bạn muốn function/class/variables của mình được sử dụng trong một tệp nhanh duy nhất.
class A {
    internal func A1(){
    }
    var A3 = 100
}





//------Fileprivate---------
class testfileprivate{
    
    fileprivate func introduce() {
     print("Hello from the other side")
    }

}


//k sử dụng  introduce được khi khac file

//-------Private-----------
//Private hạn chế việc sử dụng một thực thể đối với khai báo kèm theo và các phần mở rộng của khai báo đó nằm trong cùng một tệp.
class TestPrivate {
    private func getName() {
    
}
func demoFunc() {
        getName()
    }
}
extension TestPrivate {
    func test() {
        getName()
    }
}
//sử dụng được getName do đều nằm trong class
//---------------------
class testpri{
    private var myName = "iOS Developer"
}
//testpri.myName
//lỗi do myName đang là private k đươc
//-------------------------------------------
 
var cau16 = "What is static variables and functions ? When should you use ?"
print("static variable là những biến có giá trị được chia sẻ giữa tất cả các cá thể hoặc đối tượng của một lớp. Khi chúng ta định nghĩa bất kỳ biến nào là static, nó sẽ được gắn vào một lớp chứ không phải một đối tượng. Bộ nhớ cho static variable sẽ được cấp phát trong thời gian tải class.")
print("func là một Method gói gọn các câu lệnh trong nó, để thực hiện một chức năng cụ thể.")

/* ---------Demo Static variable---------*/

class Student {
   static let section: String = "A"  // static constat
   static var day: String = "Monday" // static variable
   var name: String = "Akash"        // instance variable
   var rollNum: Int = 1              // instance variable
}
let student1 = Student()   // Object 1
print(student1.name)       // Akash
print(student1.rollNum )   // 1
student1.name = "Aman"     // Setting ob1 value to Aman
print(student1.name) // Aman
let student2 = Student() // Object 2
print(student2.name) // Akash
print(Student.section) // A
print(Student.day) // Monday

/* -----Demo func -------- */

func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet(person: "Bob", day: "Tuesday")

//--------------------func

func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0

    for scorer in scores {
        if scorer > max {
            max = score
        } else if scorer < min {
            min = scorer
        }
        sum += scorer
    }

    return (min, max, sum)
}
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
print(statistics.sum)
// Prints "120"
print(statistics.2)
// Prints "120"

//--------------func lồng nhau
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()

//-------------------------------------------------------------

var cau17 = "What is lazy anotation ? When should you use ?"
print("Lazy là một thuộc tính có giá trị ban đầu không được tính cho đến lần đầu tiên nó được gọi. Nó là một phần của họ các thuộc tính trong đó chúng ta có các thuộc tính không đổi, các thuộc tính được tính toán và các thuộc tính có thể thay đổi.")
print("lazy được sử dụng khi bạn chỉ định khi biến đó được yêu cầu lần đầu tiên")
/*-------Demo lazy---------*/
struct Person {
    let name: String
    let age: Int
}

struct PeopleViewModel {
    var people: [Person]
//    lazy let oldest:person?={}()   //khong dung lazy voi let
    lazy var oldest: Person? = {
        print("oldest person calculated")
        return people.max(by: { $0.age < $1.age })
    }()
}



var viewModel = PeopleViewModel(people: [
    Person(name: "Antoine", age: 30),
    Person(name: "Jaap", age: 3),
    Person(name: "Lady", age: 3),
    Person(name: "Maaike", age: 27)
])

print(viewModel.oldest)
// lazy được dùng 1 lần đầu tiên

//viewModel.people.append(Person(name: "Jan", age: 69))
//print(viewModel.oldest)
// lazy khong duoc su dung nua
