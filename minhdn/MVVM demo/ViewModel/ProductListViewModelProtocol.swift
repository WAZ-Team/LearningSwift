//
//  ProductListViewModelProtocol.swift
//  MVVM demo
//
//  Created by MinhDev on 9/9/21.
//

import Foundation
import UIKit

protocol ProductListViewModelProtocol: class {
    var products : [Product] { get }
    var productListDataSource: ProductListDataSource! { get set }
    var productsDidChange: ((ProductListViewModelProtocol) -> ())? { get set }
    init(products: [Product])
    func showProductList()
}
