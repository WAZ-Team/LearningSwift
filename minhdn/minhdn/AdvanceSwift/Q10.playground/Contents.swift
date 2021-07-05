//What is nil coalescing? When should you use nil coalescing in Swift ?
import UIKit

var str = "Hello, playground"
print("nil coalescing là một tùy chọn và trả về giá trị bên trong nếu có. Nếu có không phải là một giá trị - nếu tùy chọn là nil- sau đó một giá trị mặc định được sử dụng để thay thế. Dù bằng cách nào, kết quả sẽ không phải là tùy chọn: nó sẽ theo giá trị từ bên trong tùy chọn hoặc giá trị mặc định được sử dụng làm bản sao lưu.")

/* ----Demo nil coalescing--------*/

func username(for id: Int) -> String? {
    if id == 1 {
        return "Taylor Swift"
    } else {
        return nil
    }
}
let user = username(for: 15) ?? "Anonymous"
