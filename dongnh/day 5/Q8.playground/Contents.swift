import UIKit

print("POP là phương pháp lập trình thiết kế và làm việc ưu tiên với các Protocol, thay vì Class như OOP. Xu hướng lập trình hiện nay là cố gắng POP kết hợp với struct thay vù sử dụng class")

//ex
protocol Bird {
    var name:String? {get set}
}

protocol Flyable {
    func fly()
}
extension Flyable {
    func fly() {
        print("I can fly")
    }
}

struct Parrot:Bird,Flyable{
    var name: String?
    
    init(name: String){
        self.name = name
    }
}

struct Eagle:Bird,Flyable {
    var name: String?
    
    init(name:String){
        self.name = name
    }
}

struct Penguin:Bird{
    var name: String?
    
    init(name:String){
        self.name = name
    }
}
