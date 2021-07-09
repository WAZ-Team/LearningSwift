//UIViewController, ViewController lifecycle
import UIKit

var str = "Hello, playground"
print("UIViewcontroller là chung cho tất cả các bộ điều khiển.")
//Các trách nhiệm chính của UIViewcontroller bao gồm
//   - Cập nhật nội dung của chế độ xem, thường là để đáp ứng với những thay đổi đối với dữ liệu cơ bản.
//  - Phản hồi các tương tác của người dùng với lượt xem.
// - Thay đổi kích thước các chế độ xem và quản lý bố cục của giao diện tổng thể.
// - Phối hợp với các đối tượng khác — bao gồm cả các bộ điều khiển chế độ xem khác — trong ứng dụng của bạn.


//------------------------------------------
// viewcontroller lifecycle
//--------LoadView--------------------------
//Hàm này sẽ được gọi đầu tiên khi khởi tạo một view controller.
//
//Hàm này được dùng khá nhiều vào cái thời code giao diện bằng tay hay nói cách khác là thời chưa có Storyboard.
//
//Mục đích chính là dùng để khởi tạo các UI (Label, Button, Text Field…) chứa trong View lớn này.
//----------------------------------------

//viewDidLoad
//Khi view controller đã được nạp vào bộ nhớ( điều kiện là cái view controller này chưa tồn tại trong bộ nhớ), thì hàm viewDidLoad được gọi.
//
//Chỉ được gọi một lần duy nhất trong chu kỳ sống của view đó thôi.
//
//Thường dùng để chuẩn bị data hoặc là khởi tạo các giá trị mặc định cho các object cũng như UI trên màn hình.
//--------------------------------------------

//viewDidUnload
//
//Khi app của bạn nhận được cảnh báo từ hệ thống về trạng thái bộ nhớ đang gần hết thì hàm này sẽ được gọi
//
//Tại hàm này sẽ giải phóng bớt các property không cần dùng, gán nil chúng để giải phóng bộ nhớ.
//--------------------------------------------

//viewWillAppear
//
//Hàm sẽ được gọi trước khi một view được thêm vào hệ thống view và trước animation hiển thị một view.
//
//Tại thời điểm animation để hiển thị view thì nếu bạn muốn tuỳ chỉnh gì thì hàm này sẽ giúp bạn làm điều đó.
//---------------------------------

//viewDidAppear
//
//Hàm sẽ được gọi khi một view đã được thêm vài hệ thống view và đã hiển thị lên màn hình.
//----------------------------------------------------

//viewWillDisappear
//
//Gọi khi một view đã được ẩn khỏi màn hình và amination khi ẩn view đó.
//---------------------------------------------------

//viewDidDisappear
//
//Gọi khi một view đã được ẩn khỏi màn hình.
//
