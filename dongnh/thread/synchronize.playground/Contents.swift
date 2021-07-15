import UIKit

//ex: Synchronous
print("Nếu task được đánh dấu là Synchronous(đồng bộ) thì về mặt cơ chế muốn đồng bộ dữ liệu sẽ phải lock các threads trong cùng queue với nó và trả quyền điều khiển cho main queue để thực thi task cần đồng bộ, sau khi task này được thực thi, nó sẽ unlock các threads và đẩy task mới vào.")
print("nó sẽ thực hiện đồng bộ, qua task trước mới thực hiện được task sau")

// Asynchronous
print("Nếu task được đánh dấu là Asynchronous(bất đồng bộ) thì task này được đẩy vào queue và ngay sau đó nó trả quyền điều khiển cho hàm gọi nó trong khi queue này đang thực thi một task.")
print("Ta sẽ có thể thực hiện đồng thời nhiều tác vụ cùng lúc mà ko phải chờ đợi theo cơ chế chờ đợi")

