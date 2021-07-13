//DispatchGroup là gì? Ứng dụng của dispatch group?
import UIKit

var str = "Hello, playground"
//Dispatch groups là một cách để block 1 thread đến khi một hoặc nhiều tác vụ hoàn thành việc thực thi của mình. Chúng ta sẽ sử dụng nó ở những nơi mà ta không chắc chắn được việc thực thi của tất cả những tác vụ là lúc nào sẽ hoành thành. Ví dụ như, khi download một list các image trên server thì ta nhóm nó vào 1 group để biết được khi nào thì các tác vụ download sẽ xong.
