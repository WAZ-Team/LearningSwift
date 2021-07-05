import UIKit

print("- Optional có thể nil hoặc có giá trị")
print("- ta cần unwrap optional để sử dụng chúng 1 cách an toàn")

//ex
let name:String? = "Huy Dong"
print(name)

print("có 4 cách unwrap")
print("sử dụng ! với force unwrapping và implicitly unwrapped optionals")
print("với optional binding sử dụng if let")
print("optional chaining sử dụng a?.b?.c")

//ex
let email:String? = "johndoe@example.com"

if email != nil {
    print(email!)
}
