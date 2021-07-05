//
import UIKit

var str = "Hello, playground"

// table view Delegate : để quản lý các lựa chọn, định cấu hình đầu trang và chân trang của phần, xóa và sắp xếp lại các ô cũng như thực hiện các hành động khác trong chế độ xem Table view.

//Chức năng Của Delegate
//Báo cáo số phần và số hàng trong bảng.
//Cung cấp các ô cho mỗi hàng của bảng.
//Cung cấp tiêu đề cho đầu trang và chân trang của phần
//Định cấu hình chỉ mục của bảng, nếu có.
//Phản hồi các bản cập nhật do người dùng hoặc bảng khởi tạo yêu cầu thay đổi dữ liệu cơ bản.
//---------------------------------------------------------
//table view DataSource :sử dụng để quản lý dữ liệu và cung cấp các ô cho chế độ Table View.

//chức năng của data Source
//Báo cáo số phần và số hàng trong bảng.
//Cung cấp các ô cho mỗi hàng của bảng.
//Cung cấp tiêu đề cho đầu trang và chân trang của phần.
//Định cấu hình chỉ mục của bảng, nếu có.
//Phản hồi các bản cập nhật do người dùng hoặc bảng khởi tạo yêu cầu thay đổi dữ liệu cơ bản.

//----------------------------------------------------------------

//numberOfSections : Có bao nhiêu danh sách cần hiển thị?
//numberOfRowsInSection :Có bao nhiêu phần tử cần hiển thị có từng danh sách?
//cellForRowAt indexPath: cell là loại cell nào ? thứ tự của cell là indexPath
//didSelectRowAt indexPath:người dùng vừa chọn vào cell  (TableView),  báo cho ViewController biết. Thứ tự cell nó chạm là indexPath

