//Phân biệt weak/ strong/ unowned
import UIKit

var str = "Hello, playground"

//Thông thường, khi một thuộc tính được tạo ra, thuộc tính đó là strong trừ phi chúng ta muốn nó là weak hoặc unowned
//Khi thuộc tính là weak, nó sẽ không tăng việc đếm tham chiếu lên.
//Kiểu unowned nằm ở giữa, nó không phải là strong và cũng không phải là optional . Trình biên dịch sẽ hiểu là đối tượng đó sẽ không bị giải phóng khi mà những đối tượng tham chiếu đến nó vẫn còn trong bộ nhớ.

//------------Demo Strong-------
class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    var gadget: Gadget?
    deinit {
        print("\(name) is being deinitialized")
    }
}

class Gadget {
    let model: String
    init(model: String) {
        self.model = model
        print("\(model) is being initialized")
    }
    var owner: Person?
    deinit {
        print("\(model) is being deinitialized")
    }
}
var kelvin: Person?
var iphone: Gadget?

kelvin = Person(name: "Kelvin")
iphone = Gadget(model: "iPhone 8 Plus")
kelvin!.gadget = iphone
iphone!.owner = kelvin

kelvin = nil
iphone = nil
//Kelvin is being initialized
//iPhone 8 Plus is being initialized
//--------------Demo Weak-------

class Gadget1 {
    let model1: String
    init(model: String) {
        self.model1 = model
        print("\(model) is being initialized")
    }
    weak var owner1: Person1?
    deinit {
        print("\(model1) is being deinitialized")
    }
}
class Person1 {
    let name1: String
    init(name: String) {
        self.name1 = name
        print("\(name) is being initialized")
    }
    weak var gadget1: Gadget1?
    deinit {
        print("\(name1) is being deinitialized")
    }
}
 

var kelvin1: Person1?
var iphone1: Gadget1?
 
kelvin1 = Person1(name: "Kelvin")
iphone1 = Gadget1(model: "iPhone 8 Plus")
kelvin1!.gadget1 = iphone1
iphone1!.owner1 = kelvin1

kelvin1 = nil
iphone1 = nil
//Kelvin is being initialized
//iPhone 8 Plus is being initialized
//iPhone 8 Plus is being deinitialized
//Kelvin is being deinitialized

//-------Demo owner---------
class Person2 {
    let name2: String
        
    init(name: String) {
        self.name2 = name
        print("\(name) is being initialized")
    }
        
    var gadget2: Gadget2?
    deinit {
        print("\(name2) is being deinitialized")
    }
}
 
class Gadget2 {
    let model2: String
    unowned var owner2: Person2
        
    init(model: String, owner: Person2) {
        self.model2 = model
        self.owner2 = owner
        print("\(model) is being initialized")
    }
    
    deinit {
        print("\(model2) is being deinitialized")
    }
}
var kelvin2: Person2?

kelvin2 = Person2(name: "Kelvin")
kelvin2!.gadget2 = Gadget2(model: "iPhone 8 Plus", owner: kelvin2!)
kelvin2 = nil
//Kelvin is being initialized
//iPhone 8 Plus is being initialized
//Kelvin is being deinitialized
//iPhone 8 Plus is being deinitialized
