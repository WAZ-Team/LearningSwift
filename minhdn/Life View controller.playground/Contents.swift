//Life cycle của 1 viewcontroller. Giải thích việc chạy các function trong life cycle của 2 viewcontroller khi thực hiện chuyển màn hình.
import UIKit

var str = "Hello, playground"
//// loadView
override func loadView(){
    super.loadView()
}
//Cái hàm loadView này thường được dùng khi mà View Controller(VC) được tạo từ code.
//Chức năng của hàm: loadView( ) là một hàm được quản lý bởi VC. nó sẽ được VC gọi khi view hiện tại của VC bị chuyển thành nil. loadView() đơn giản sẽ lấy view (bạn tạo) và đưa nó thành view của VC (superview).
//VC(nil view) -> loadView( ) -> VC(có view)
//
//viewDidLoad:
override func viewDidLoad(){
    super.viewDidLoad()
}
//Hàm này được gọi 1 lần trong vòng đời của VC. Như cái tên của nó, được gọi khi view đã được load xong.
// chú ý: Cái hàm viewDidLoad này được chạy trước khi bound được set và rotation(xoay) xảy ra.
//
//viewWillAppear:
override func viewWillAppear(_animated: Bool){
    supper.viewWillAppear(animated)
}
//Hàm viewWillAppear được gọi mỗi khi view được hiển thị (visible) và trước khi mỗi animation được thiết lập (configured). Ở hàm này view đã có bound nhưng phần rotation vẫn chưa (<- chưa nhé) được set. có thể override method này để thực thiện những task liên quan tới tuỳ chỉnh hiển thị view:
//
//viewWillLayoutSubviews:
//viewWillLayoutSubviews mặc định không làm gì cả. Khi bounds của một view bị thay đổi, thì view phải điều chỉnh lại vị trí của những view con (subviews), trước hành động điều chỉnh đó viewWillLayoutSubviews được gọi. VC có thể override hàm này để thực hiện task gì đó trước khi view điều chỉnh lại các subviews của nó.
//
//viewDidLayoutSubviews:
//viewWillLayourSubviews phía trên được gọi trước khi view điều chỉnh subviews của nó, còn viewDidLayoutSubviews được gọi sau khi điều chỉnh subviews (đơn giản). Dùng viewDidLayoutSubviews theo ý nghĩa đó, thực hiện task gì đó sau khi subviews đã được set.
//
//viewDidAppear:
override func viewDidlAppear(_animated: Bool){
    supper.viewDidAppear(animated)
}
//Hàm viewDidAppear được gọi sau khi view đã được hiển thị trên màn hình (viewWillAppear thì trước, cái này sau, đi theo cặp).

//viewWillDisappear:
override func viewWillDisAppear(_animated: Bool){
    supper.viewWillDisAppear(animated)
}
// viewWillDisappear được gọi trước khi view bị xoá khỏi view hierarchy (cây view). Khi gọi viewWillDisappear thì view vẫn chưa bị xoá khỏi view hierarchy. Những animation chưa được load vẫn sẽ còn.
//

//viewDidDisappear:
override func viewDidDisAppear(_animated: Bool){
    supper.viewDidDisAppear(animated)
}
// viewDidDisapper, nó được gọi sau khi view bị xoá khỏi view hierarchy.

//init
override init(nibName nibNameOrNil: String?. bundle niBundleOrNil: Bundle?){
    super.init
}
//Nó là hàm init, như mọi hàm init khác thì init sẽ được gọi 1 lần duy nhất trong vòng đời của view
//
//deinit:
//Trước khi VC được xoá khỏi bộ nhớ, nó bị deinitialized(xoá init). AE có thể dùng deinit() để xoá sach resources của VC đã được allocated(chỉ định ô nhớ) nhưng chưa được giải phóng bởi ARC.
//Nhớ là vì VC đã không hiển thị, không có nghĩa là nó đã được deallocated. Container của VC như là NavigationController có thể giữ những VCs của nó: available trong bộ nhớ.
//Một lần nữa, VCs đã off screen rồi thì nó vẫn còn ở trong bộ nhớ, nó vẫn có thể hoạt động bình thường và thậm chí nhận notifications.
//
//didReceiveMemoryWarning()
//Khi mà bộ nhớ sử dụng tăng cao, iOS sẽ không tự động tối ưu lại, di chuyển data của bạn từ memory sang vùng nào đó khác như hard disk.
//

