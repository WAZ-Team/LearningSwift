//phân biệt Synchronous và Asynchronous
import UIKit

var str = "Hello, playground"
//Synchronous: sẽ trả về chỉ sau khi task được hoàn thành. Có nghĩa là khả năng block thread hiện tại nếu sử dụng để thực thi một task tốn nhiều thời gian (request APIs, download media content,…)

//Asynchronous: sẽ trả về ngay lập tức mà không cần phải chờ. Dễ hiểu hơn là nó sẽ add task vào queue vào tiếp tục thực hiện các công việc khác mà không gây block.

