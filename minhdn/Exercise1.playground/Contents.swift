//Write function return top "n" of this array include random number from 0 to 100 ?


import UIKit

func makeList(_ n: Int) -> [Int] {
    return (0..<n).map //trả về dãy số tu 0 den n với day duọc chuyen doi thanh mang
    {_ in Int.random(in: 0 ... 100)}
//    lấy ngau nhien 1 so tu 0 den 100
    
}
//khai bao n là 1 Omitting parameter và n thuoc kiẻu Int

let list = makeList(20) //láy 20 phan tu ngau nhien trong day so tu 0 den 100
list.sorted() //sắp xep lại mang theo thu tu
