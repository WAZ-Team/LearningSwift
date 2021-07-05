//Q3: What is mutation method ?

import UIKit

var str = "Hello, playground"
print("mutation có khả năng thay đổi giá trị của các thuộc tính và ghi nó trở lại cấu trúc ban đầu khi quá trình triển khai phương thức kết thúc.")

/*---------Demo mutation ---------*/
struct Employee {
    var name : String
    var teamName : String

    init(name: String, teamName: String) {
        self.name = name
        self.teamName = teamName
    }

    func changeTeam(newTeamName : String){
        self.teamName = newTeamName
        //cannot assign to property: 'self' is immutable
    }
}

//----------------
struct Employee1 {
    var name1 : String
    var teamName1 : String

    init(name: String, teamName: String) {
        self.name1 = name
        self.teamName1 = teamName
    }
    
    mutating func changeTeam1(newTeamName : String){
        self.teamName1 = newTeamName
    }
    
}

var emp1 = Employee1(name : "Suneet", teamName:"Engineering")
print(emp1.teamName1)    //Engineering
emp1.changeTeam1(newTeamName : "Product")
print(emp1.teamName1)    //Product
