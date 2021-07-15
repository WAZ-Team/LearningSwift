import UIKit

//concurrent queue
print("Là hàng đợi thực hiện đồng thời. Trong một thời điểm có thể có nhiều task được thực hiện cùng một lúc. Hệ thống sẽ tuỳ vào tải hiện thời của hệ thống và cấu hình phần cứng thực tế để khởi tạo và cấp phát các Threads để xử lý các tác vụ. Global queue là concurrent queue và có sẵn trong hệ thống. Thực hiện theo nguyên tắc FIFO")
// serial queue
print("Là hàng đợi thực hiện tuần tự tức là chỉ có 1 task được thực hiện trong 1 thời điểm và khi nào task này thực hiện xong thì task khác mới được bắt đầu.")
// main queue
print("là queue đặc biệt có sẵn trong hệ thống và là Serial queue, nó chạy những tasks trên main thread của ứng dụng. Được sử dụng để update UI của app, thực hiện những task liên quan đến update UIViews hay posting notifications. Bởi vì nó là serial queue nên chỉ có một task được chạy tại một thời điểm")

