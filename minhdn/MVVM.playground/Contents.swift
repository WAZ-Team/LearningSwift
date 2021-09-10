import UIKit

var str = "Hello, playground"
// MVVM
//View Controller: Chỉ thực hiện những thứ liên quan đến UI — Show/get thông tin, một phần của view layer

//ViewModel: Nhận thông tin từ VC, xử lý tất cả những thông tin này và gửi lại nó cho VC.

//Model: Đây là những model của bạn, không có gì nhiều ở đây. Nó giống với model trong mô hình MVC, nó được sử dụng bởi ViewModel và update bất cứ khi nào ViewModel gửi update mới.
//Flow ứng dụng:
//
//ViewController sẽ được gọi và View sẽ có một tham chiếu tới ViewMdoel
//View sẽ nhận một vài hành động của user và View sẽ gọi ViewModel
//ViewModel sẽ request APIService và APIService gửi response ngược lại cho ViewModel
//Khi chúng ta nhận được một response, ViewModel thông báo cho View thông qua binding
//View sẽ update UI với data
