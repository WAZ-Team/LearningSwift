//
//  ProductListViewModel.swift
//  MVVM demo
//
//  Created by MinhDev on 9/9/21.
//

import Foundation
import UIKit

class ProductListViewModel: ProductListViewModelProtocol {
     var products: [Product]
    
    var productListDataSource: ProductListDataSource! {
        didSet {
            self.productsDidChange?(self)
        }
    }
    
    var productsDidChange: ((ProductListViewModelProtocol) -> ())?
    
    required init(products: [Product]) {
        self.products = products
    }
    
    func showProductList() {
        productListDataSource = ProductListDataSource(products: products)
    }
}
