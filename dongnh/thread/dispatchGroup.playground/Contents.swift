import UIKit

print("Dispatch group cho phép nhóm nhiều task vụ với nhau và chờ cho chúng hoàn thành hoặc nhận thông báo khi chúng hoàn thành mới thực hiện tiếp output của bạn. Những task vụ này có thể chạy đồng bộ hoặc bất đồng bộ và có thể chạy trên nhiều queue khác nhau.")
//ex
print("khi open 1 màn hình, bạn cần phải call nhiều api để lấy dữ liệu, sau khi hoàn thành call tất cả api này mới update data lên giao diện.")

print("Dispatch group cung cấp hàm wait() , hàm này block thread hiện tại cho tới khi các task vụ trong group được hoàn thành.")
