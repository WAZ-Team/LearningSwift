import UIKit

var q5 = "Protocol được hiểu là một bản thiết kế bao gồm các thuộc tính, phương thức và các khai báo khác để thực hiện một nhiệm vụ, tính năng nào đó Protocol có thể được implement bởi một Class, Struct hay Enum.Khi implement một Protocol, ta sẽ phải khai báo, định nghĩa lại các thuộc tính, phương thức có trong Protocol đó."
//ex

protocol detailInformation {
    var fullname: String {get}
    func show() -> String
}

class User: detailInformation {
    var firstname:String
    var lastname:String
    init(firstname:String, lastname:String) {
        self.firstname = firstname
        self.lastname = lastname
    }
    var fullname:String {
        return firstname+lastname
    }
    func show() -> String {
        return "firstname = \(firstname), lastname = \(lastname)"
    }
}

var dong = User(firstname: "Nguyen", lastname: "Dong")

