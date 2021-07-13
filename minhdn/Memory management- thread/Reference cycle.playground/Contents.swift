//Reference cycle là gì? Tại sao phải capture variable trong closure
import UIKit

var str = "Hello, playground"
//Một reference cycle xảy ra khi một đối tượng A có strong reference đến đối tượng B và ngược lại.
//Một reference cycle sẽ xảy ra nếu và chỉ nếu:

//Class instance có một strong reference đến closure
//Closure có một strong reference đến class .
