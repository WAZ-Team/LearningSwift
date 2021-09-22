import UIKit

var str = "Hello, playground"
// MVVM
//Model-View-ViewModel (MVVM) is a structural design pattern that separates objects into three distinct groups:
// Models hold app data. They’re usually structs or simple classes.

// Views display visual elements and controls on the screen. They’re typically subclasses of UIView.

// View models transform model information into values that can be displayed on a view. They’re usually classes, so they can be passed around as references.

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

//MVVM helps slim down view controllers, making them easier to work with. Thus combatting the "Massive View Controller" problem.
// View models are classes that take objects and transform them into different objects, which can be passed into the view controller and displayed on the view. They’re especially useful for converting computed properties such as Date or Decimal into a String or something else that actually can be shown in a UILabel or UIView.
// If you’re only using the view model with one view, it can be good to put all the configurations into the view model. However, if you’re using more than one view, you might find that putting all the logic in the view model clutters it. Having the configure code separated into each view may be simpler.
