import UIKit

print("Thông thường , khi một thuộc tính được tạo ra, thuộc tính đó là strong trừ phi chúng ta muốn nó là weak hoặc unowned")
print("Khi thuộc tính là weak, nó sẽ không tăng việc đếm tham chiếu lên.")
print("Kiểu unowned nằm ở giữa, nó không phải là strong và cũng không phải là optional . Trình biên dịch sẽ hiểu là đối tượng đó sẽ không bị giải phóng khi mà những đối tượng tham chiếu đến nó vẫn còn trong bộ nhớ.")

//strong

print("nó bảo vệ đối tượng được trỏ tới khỏi bị giải phóng bởi ARC bằng cách tăng retain count lên 1. Nếu retain count = 0 thì đối tượng sẽ bị giải phóng tức là chừng nào còn tham chiếu mạnh tới đối tượng thì đối tượng đó sẽ không bị giải phóng. Liên kết này rất chặt chẽ nên đây là lí do chính khiến cho bị memory leak")

//weak
print("weak luôn được khai báo là optional vì giá trị của biến có thể đặt là nil. ARC sẽ tự động đựat tham chiếu weak là nil khi instance bị giải phóng. Gía trị được gán là weak sẽ không thay đổi được giá trị của nó và như là một constant.")

// owner
print("Unowned khá giống với weak khi nó có thể sử dụng để phá liên kết chặt. Nhưng điểm khác biệt là nó luôn phải có giá trị. ARC sẽ không đặt giá trị của nó là nil. Unowned luôn phải có giá trị")
