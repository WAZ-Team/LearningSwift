import UIKit

var str = "Hello, playground"
//Use the singleton pattern when having more than one instance of a class would cause problems, or when it just wouldn’t be logical.Use the singleton plus pattern if a shared instance is useful most of the time, but you also want to allow custom instances to be created
// example
public class MySingleton {
  // 1: first declare a public static property called shared, which is the singleton instance.
  static let shared = MySingleton()
  // 2: mark init as private to prevent the creation of additional instances.
  private init() { }
}
//3: get the singleton instance by calling MySingleton.shared.
let mySingleton = MySingleton.shared
// 4: get a compiler error if you try to create additional instances of MySingleton
// let mySingleton2 = MySingleton()
