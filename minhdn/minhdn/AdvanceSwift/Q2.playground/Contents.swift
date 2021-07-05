//What is different between struct & class ?

import UIKit

var str = "Hello, playground"
print("struct khác class là :tính kế thừa,Kiểu tham chiếu và kiểu giá trị ")

/*----Demo Tính kế thừa----- */
struct Bird{
    var code: Int //1
    var name: String //1
    
    init(code: Int, name: String) { //3
        self.code = code
        self.name = name
    }
    
    func introduce(){ //2
        print("I am \(name).")
    }
}
class Vehicle{
    var manufacturer: String?
    let passengerCapacity: Int
    
    init(passengerCapacity: Int) {
        self.passengerCapacity = passengerCapacity
    }
}

class Car: Vehicle {
    var fuelType: String?
}
//struct bird2:Bird{} // struct k kế thừa được

let car = Car(passengerCapacity: 4)

//-----------------------------------------
/*-----Demo Struct-  Kiểu gía tri --------*/
struct Location{
    var longitude: Double
    var latitude: Double
    
    init(longitude: Double, latitude: Double) {
        self.longitude = longitude
        self.latitude = latitude
    }
}

var location1 = Location(longitude: 1.23, latitude: 1.23)
var location2 = location1

location1.longitude = 4.56

print(location1.longitude) //4.56
print(location2.longitude) //1.23

/*-------Demo Class-  kiểu tham chiếu----------**/

class Location3{
    var longitude: Double
    var latitude: Double
    
    init(longitude: Double, latitude: Double) {
        self.longitude = longitude
        self.latitude = latitude
    }
}

var location4 = Location3(longitude: 1.23, latitude: 1.23)
var location5 = location4

location1.longitude = 4.56

print(location1.longitude) //4.56
print(location2.longitude) //4.56
