import UIKit

print("Application có 5 state")
print("- Not running: App của bạn chưa được chạy hoặc là đang chạy nhưng đã bị hệ thống chấm dứt kết nối (terminated)")
print("In active: App đang chạy ở Foreground nhưng không nhận bất kì sự kiện tương tác nào. Nó có thể xảy ra trong trường hợp có cuộc gọi hoặc có tin nhắn tới. App còn có thể ở trạng thái này khi bạn đang trong quá trình chuyển đổi qua các trạng thái khác và chúng ta không thể tương tác bất kì sự kiện nào với UI của app.")
print("Active: App đang chạy trên Foreground và nhận các sự kiện tương tác. Đây là một trạng thái bình thường của Foreground apps. Cách duy nhất để để đi tới (hoặc đi từ) trạng thái Active là qua trạng thái Inactive. User thường tương tác với UI 1 cách dễ dàng.")
print("Background: App chạy dưới background và vẫn thực thi code. Các ứng dụng mới chạy sẽ lập tức đi qua trạng thái In-Active và sau đó là Active. App nếu như bị đình chỉ(suspended) sẽ quay về trạng thái Background sau đó chuyển sang trạng thái In-Active -> Active. Ngoài ra, app được khởi chạy trực tiếp vào background sẽ chuyển sang trạng thái này thay vì trạng thái In-Active.")
print("Suspend: App chạy dưới background nhưng không thực thi code. Hệ thống sẽ tự động chuyển trạng thái của app sang trạng thái và không báo cho chúng ta biết trước. Trong trường hợp thiếu bộ nhớ, hệ thống sẽ lọc và tắt các ứng dụng đang trong trạng thái Suspended để tạo không gian trống cho các ứng dụng khác. Thông thường sau 5s ở dưới background, app sẽ chuyển trạng thái sang Suspended nhưng chúng ta có thể nới rộng thời gian ấy ra nếu như muốn.")
//background mode
print("Các task có thể sử dụng với background mode: Audio and airplay, Location updates, Voice over ip, Newsstand download, External accessory communication, Uses bluetooth LE accessory, Background fetch và Remote notifications")
