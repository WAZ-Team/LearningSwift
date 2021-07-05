//What is POP ?

import UIKit

var str = "Hello, playground"
print("POP là Protocol-Oriented Programming.POP được kế thừa từ OOP nên POP có rất nhiều ưu diểm vượt trội hơn OOP.")
/*----Demo POP------*/

protocol Bird {
    var name:String? {get set}
}

protocol Flyable {
    func fly()
}
extension Flyable {
    func fly() {
        print("I believe i can fly")
    }
}

protocol Featherable {
    var feather:String?{get set}
}
extension Featherable {
    var feather:String? {
        get {
            return "I have feather"
        }
        set{
            
        }
    }
}
struct Parrot:Bird,Flyable,Featherable{
    var name: String?
    
    init(name: String){
        self.name = name
    }
}

struct Eagle:Bird,Flyable,Featherable {
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

