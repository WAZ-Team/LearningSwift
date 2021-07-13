//Những task nào có thể chạy dưới background mode
import UIKit

var str = "Hello, playground"
//tast chạy dưới backgroud mode là:
//Audio and airplay:app của bạn có thể play/record khi về background
//Location updates:app vẫn tiếp tục callback khi location thay đổi
//Voice over ip: gọi điện
//Newsstand download: trình bày nội dung được tải xuống (hoặc đã tải xuống) từ máy chủ của ứng dụng.
//External accessory communication:Giao tiếp với các phụ kiện kết nối với thiết bị có đầu nối Apple Lightning hoặc với công nghệ không dây Bluetooth.
//Uses bluetooth LE accessory: quét bluetooth
//Background fetch:Tìm nạp nội dung trong nền và cập nhật giao diện ứng dụng của bạn.
//Remote notifications: nhận thông báo
