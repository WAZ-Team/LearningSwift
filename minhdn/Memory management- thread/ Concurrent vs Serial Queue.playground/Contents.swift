//Phân biệt Concurrent vs Serial Queue
import UIKit

var str = "Hello, playground"
//Serial queue:
//Thưc hiện các task một cách tuần tự. Một task chỉ được thực hiện khi mà task phía trước nó trong hàng đợi đã thực hiện xong và kết thúc. Thứ tự các task được nhập vào hàng đợi chính cũng chính là thứ tự các task được thực hiện và kết thúc.
//Concurrent queue:
//Các task được thưc hiện 1 cách đồng thời.Khi các task nhập vào hàng đợi thì các task này có thời gian bắt đầu thực hiện gần như bằng nhau , nhưng tuỳ thuộc vào mỗi task mà chúng có thời gian hoàn thành khác nhau.
