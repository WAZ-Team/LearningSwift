import UIKit
var str = "Hello, playground"
//  MARK: - Cocoapod la gi

//Cocoapods là chương trình giúp quản lý các bộ thư viện được được sử dụng trong ứng dụng mobile được phát triển dựa trên khung làm việc Cocoa. Thông thường một ứng dụng phần mềm sẽ cần phải sử dụng nhiều bộ thư viện khác nhau và ứng dụng như vậy sẽ phụ thuộc vào các bộ thư viện này. Chính vì vậy Cocoapod còn được gọi là dependencies manager hay phần mềm quản lý các bộ thư viện phụ thuộc của ứng dụng.

//  MARK: - phan biet pod install va pod update

//Sau khi tạo và liệt kê các thư viện trong Podfile việc cài đặt các bộ thư viện này được thực hiện một cách đơn giản sử dụng câu lệnh:

//$ pod install

//Nếu như muốn thay đổi phiên bản hay bỏ một bộ thư viện ra khỏi ứng dụng bạn chỉ cần điều chỉnh nội dung của Podfile và chạy câu lệnh:

//$ pod update

//  MARK: - khi tao cocoapod se tao ra file gi va chuc nang?

//Tạo cocoapod sẽ tạo ra 2 file
//SwiftyLib: Tất cả implementation sẽ được đặt ở đây
//SwiftyLibTests: Viết các phần test

//  MARK:   - Khi sử dụng bên thứ 3 cần chú ý gì?
//Cocoapod: Mỗi khi tiến hành built project, Cocoapod sẽ built và compile file pods (thư viện). Các lần built project tiếp theo, Cocoapod sẽ không tiến hành built lại pods.
//Cathage : Carthage lại có một tiến trình khác. Khi tiến hành lấy lại thư viện bằng lệnh carthage update nó sẽ lấy ra các phiên bản framework (binary) hoặc kéo source code và tiến hành biên dịch nó thành framework trên máy và tiến trình này chỉ xảy ra một lần.
// Note: Muốn sử dụng thư viện với codebase lớn, thì nên sử dụng Carthage để tích hợp vào project
