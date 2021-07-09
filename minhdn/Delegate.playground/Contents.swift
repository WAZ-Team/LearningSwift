//Delegate
import UIKit

var str = "Hello, playground"
//delegates là "design patterns" cho phép đối tượng gửi "message" đến đối tượng khác khi có một sự kiện đặc biệt xảy ra
/*------Demo delegate------*/
struct Cookie {
    var size:Int = 5
    var hasChocolateChips:Bool = false
}
//class Bakery {
//    func makeCookie() {
//        var cookie = Cookie()
//        cookie.size = 6
//        cookie.hasChocolateChips = true
//    }
//}
protocol BakeryDelegate {
    func cookieWasBaked(_ cookie: Cookie)
}
class Bakery {
    var delegate: BakeryDelegate?

    func makeCookie() {
        var cookie = Cookie()
        cookie.size = 6
        cookie.hasChocolateChips = true

        delegate?.cookieWasBaked(cookie)
    }
}
class CookieShop: BakeryDelegate {
    func cookieWasBaked(_ cookie: Cookie) {
        print("Yay! A new cookie was baked, with size \(cookie.size)")
    }
}
let shop = CookieShop()

let bakery = Bakery()
bakery.delegate = shop

bakery.makeCookie()
// Output: Yay! A new cookie was baked, with size 6
