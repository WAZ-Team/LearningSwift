//Write function return intersection of two arrays ?
//y tương: so sánh từng phần tử của 1 mảng với từng phần tử của mảng còn lại nếu gioóng nhau thì in ra

import UIKit

func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
       guard nums1.count > 0 && nums2.count > 0 else {
            return []
        }
//kiem tra nums1,num 2 co gias tri hay khong
// so sanh so thu nhat cuar mang 1 voi tung so mang 2 neu giong thi luu ra array
    
        var nums2 = nums2
        var array = [Int]()
        for item in 0..<nums1.count {
// vòng lặp for chay từ vị trí 0 đến vị trí cuối của nums1
            for (index,value) in nums2.enumerated() {
// enumerated dùng để liệt kê các ký tự của chuỗi và in từng ký tự cùng với vị trí của nó trong chuỗi.vị trí là index,phần tử là value

                if(value == nums1[item]){
                    array.append(nums1[item])
                    nums2.remove(at: index)
                    break
                }
// nếu phần tử của nums2 giống nums1 thì in phần tử của nums1 vào dãy array và remove phân tử đó ra khỏi dãy nums2 và kết thúc điều kiện
            }
       
        }
        
        return array
    }
intersect([3,5],[3,4])
