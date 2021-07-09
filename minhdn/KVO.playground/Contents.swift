// what is the KVO
import UIKit

var str = "Hello, playground"
//KVO , viết tắt của Key-Value Observing, là một trong những kỹ thuật để quan sát các thay đổi trạng thái chương trình có sẵn trong Objective-C và Swift.

//  Khái niệm: khi chúng ta có một đối tượng với một số biến cá thể, KVO cho phép các đối tượng khác thiết lập giám sát các thay đổi đối với bất kỳ biến cá thể nào đó.
class MyObjectToObserve: NSObject {
    @objc dynamic var myDate = NSDate(timeIntervalSince1970: 0) // 1970
    func updateDate() {
        myDate = myDate.addingTimeInterval(Double(2 << 30)) // Adds about 68 years.
    }
}
class MyObserver: NSObject {
    @objc var objectToObserve: MyObjectToObserve
    var observation: NSKeyValueObservation?
    
    init(object: MyObjectToObserve) {
        objectToObserve = object
        super.init()
        
        observation = observe(
            \.objectToObserve.myDate,
            options: [.old, .new]
        ) { object, change in
            print("myDate changed from: \(change.oldValue!), updated to: \(change.newValue!)")
        }
    }
}
let observed = MyObjectToObserve()
let observer = MyObserver(object: observed)
observed.updateDate() //phản hồi sự thay đổi thuộc tính bằng cách in cả giá trị mới và cũ .
