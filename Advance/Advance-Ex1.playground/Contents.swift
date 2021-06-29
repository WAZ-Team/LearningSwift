import Foundation

protocol Flyable {
	var airspeedVelocity: Double { get }
}

protocol Animal {
	var name: String { get }

	func numberOfLegs() -> Int
}

/// 1. Định nghĩa ra các protocol/struct/class thể hiện các behavior riêng biệt của
/// một loài động vật khác ( Ví dụ như con người )
/// 2. Thử up-cast và down-cast các con vật trong cùng 1 loài với nhau
/// 3. Thử cast các con vật khác loài với nhau
/// Note: Sử dụng cả class và struct trong ví dụ
/// Sample

protocol Bird: Animal {
	var canFly: Bool { get }
}

class Penguin: Bird {
	let name: String
	let canFly: Bool

	init(name: String) {
		self.name = name
		self.canFly = false
	}

	func numberOfLegs() -> Int {
		return 2
	}

	func sayHello() {
		print("Hello")
	}
}

class VietNamPenguin: Penguin {
	override func sayHello() {
		print("Xin chào")
	}

	override func numberOfLegs() -> Int {
		return 3
	}
}

struct Eagle: Bird, Flyable {
	let name: String
	let canFly = true

	var airspeedVelocity: Double {
		return 100
	}

	func numberOfLegs() -> Int {
		return 2
	}
}

let eagle = Eagle(name: "Eagle")
print(eagle.canFly)
let penguin = Penguin(name: "Penguin")
print(penguin.canFly)
penguin.sayHello()

let vietNamePenguin = VietNamPenguin(name: "VietNamPenguin")
vietNamePenguin.sayHello()

if let upCast = vietNamePenguin as? Penguin {
	upCast.sayHello()
}

if let downCast = penguin as? VietNamPenguin {
	downCast.sayHello()
}
