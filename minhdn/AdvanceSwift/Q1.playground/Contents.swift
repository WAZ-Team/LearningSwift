//What is value type and reference type ? List some samples in Swift for each type ( Int, String, Array ...)
var câu1 = ""
print("Kiểu giá trị là: một kiểu giá trị nếu nó giữ một giá trị dữ liệu trong không gian bộ nhớ của chính nó. Nó có nghĩa là các biến của các kiểu dữ liệu này trực tiếp chứa các giá trị.mỗi kiểu giá tri giữ một bản sao duy nhất của dữ liệu của nó.struct,enum,tuple Array, String, and Dictionary là kiểu giá trị.")
print("Kiểu tham chiếu :chia sẻ một bản sao dữ liệu của chúng, để mọi cá thể mới sẽ trỏ đến cùng một địa chỉ trong bộ nhớ. Một ví dụ điển hình là một class, function hoặc closure. ")
print()

/* ------Demo kiểu giá trị--------*/

//------------Struct---------
struct Car {
    let brand: String //kiẻu gía trị
    var model: String
    
}
var phim: [Int] //kiêur giá trị
// 2
var golf = Car(brand: "Volkswagen", model: "Golf")
// 3
let polo = golf

// 4
golf.model = "Golf 2019"

// 5
print(golf)
print(polo)
//----------_Enum-Kiểu giá trị--------

// 1
enum Language {
    case italian
    case english
}

// 2
var italian = Language.italian
// 3
let english = italian

// 4
italian = .english

// 5
print(italian)
print(english)


//----------------tuple-Kiểu giá trị--------
// loại tuple là danh sách được phân tách bằng dấu phẩy gồm không hoặc nhiều loại, được đặt trong dấu ngoặc đơn. Bạn có thể truy cập các giá trị của nó bằng cách sử dụng .ký hiệu dấu chấm ( ) theo sau là chỉ mục của giá trị.
var ironMan = ("Tony", "Stark") //tuple
// 2
let parent = ironMan

// 3
ironMan.0 = "Alfred"

// 4
print(ironMan)
print(parent)

/*------Kiểu Tham chiếu------------*/
//---------func-Kiểu tham chiếu ------------

func address<T: AnyObject>(of object: T) -> Int {
    return unsafeBitCast(object, to: Int.self)
}

//---------class - Kiểu tham chiếu--------
class Dog: CustomStringConvertible {
    var age: Int
    var weight: Int

    // 2
    var description: String {
        return "Age \(age) - Weight \(weight)"
    }

    // 3
    init(age: Int, weight: Int) {
        self.age = age
        self.weight = weight
    }
}

// 4
let doberman = Dog(age: 1, weight: 70)
// 5
let chihuahua = doberman

// 6
doberman.age = 2
// 7
chihuahua.weight = 10

// 8
print(doberman)
print(chihuahua)

// 9
print(address(of: doberman))
print(address(of: chihuahua))

//----------closua- kiểu tham chiếu--------

let closure = { print("Test") }
func function() -> (){ print("Test") }

closure()
function()
