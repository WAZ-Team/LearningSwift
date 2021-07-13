import UIKit

var str = "Hello, playground"

//dequeueReusableCell la Một chuỗi xác định đối tượng ô sẽ được sử dụng lại. Tham số này không được nil.
//Thay vì tạo ra từng cell và hiển thị tất cả cell trên TableView, dequeueReusableCellWithIdentifier giúp ta tạo ra một số cell với số lượng vừa đủ hiển thị trên TableView (hoặc thêm một vài cell). Khi chúng ta Scroll, chúng ta sẽ tải sử dụng lại số lượng cell đã được sroll khỏi tableView, giúp ta có thể tiết kiệm bộ nhớ hơn so với việc tạo ra rất nhiều cell.
func register(UINib?, forCellReuseIdentifier: String)
//Đăng ký một đối tượng nib có chứa một ô có dạng xem bảng dưới một số nhận dạng được chỉ định.
func register(AnyClass?, forCellReuseIdentifier: String)
//Đăng ký một lớp để sử dụng trong việc tạo các ô bảng mới.
func dequeueReusableCell(withIdentifier: String, for: IndexPath) -> UITableViewCell
//Trả về đối tượng ô xem bảng có thể sử dụng lại cho số nhận dạng tái sử dụng đã chỉ định và thêm nó vào bảng.
