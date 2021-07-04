import UIKit

var q2 = "struct là kiểu value types trong khi class types là kiểu reference types"
var q2_2 = "Struct ko có kế thừa và đa hình nhưng class thì có"
//ex
struct animal{
    var name:String
    var age: Int
}

var a = animal(name: "dog", age: 2)
var b = a
b.name = "cat"
print(a.name)
print(b.name)

//ex class

class animal1{
    var name:String = ""
    var age: Int = 0

init(name: String, age: Int){
    self.name = name
    self.age = age
    }
}
var a1 = animal1(name: "cat", age: 2)
var b1 = a1
b1.name = "chicken"
print(a1.name)
print(b1.name)
