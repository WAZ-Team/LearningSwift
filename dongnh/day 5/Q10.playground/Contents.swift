import UIKit

print("Nil Coelescing cho phép chúng ta unwrap optional nhưng cung cấp 1 giá trị mặc định nếu optional chứa giá trị nil")

//ex
func username(for id: Int) -> String? {
    if id == 1 {
        return "Taylor Swift"
    } else {
        return nil
    }
}

let user = username(for: 15) ?? "Dong"
