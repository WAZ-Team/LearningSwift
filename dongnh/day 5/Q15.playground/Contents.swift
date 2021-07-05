import UIKit

print("Các param của closure mặc định thoát khỏi closure ở các phiên bản trước Swift 3. Một closure sẽ không thoát khỏi nội dung của function nếu closure param được đánh dấu là non-escaping. Từ Swift 3, mọi thứ được đảo ngược. Khi ta truyền closure như một tham số của function, closure được thực thi với function body và trả về compiler. Khi việc thực thi kết thúc, closure được truyền vào sẽ thoát khỏi phạm vi của function và không còn tồn tại trong bộ nhớ.")
print("Các  non-escaping có vòng đời sau:")
print("Truyền closure vào làm tham số của function")
print("Thực thi function và closure")
print("function return")

//ex
func getSumOf(array:[Int], handler: ((Int)->Void)) {
        var sum: Int = 0
        for value in array {
            sum += value
        }
            handler(sum)
    }
    func doSomething() {
        self.getSumOf(array: [16,756,442,6,23]) { [weak self](sum) in
            print(sum)
            // finishing the execution
        }
    }

//escaping closure
print("Một closure được gọi là escape khỏi function khi closure này được truyền vào function làm tham số, nhưng được gọi đến sau khi function return. Việc đánh dấu closure với từ khoá @escaping sẽ báo cho ta biết ta cần phải tham chiếu tới self bên trong closure. Khi khai báo function với param có chứa một closure, ta có thể dùng @escaping trước param type để chỉ định rằng closure này được phép escape.")
//ex
var complitionHandler: ((Int)->Void)?
    func getSumOf(array:[Int], handler: @escaping ((Int)->Void)) {
       //here I'm taking for loop just for example, in real case it'll be something else like API call
       var sum: Int = 0
        for value in array {
            sum += value
        }
        self.complitionHandler = handler
    }
      
    func doSomething() {
        self.getSumOf(array: [16,756,442,6,23]) { [weak self](sum) in
            print(sum)
            //finishing the execution
        }
    }
