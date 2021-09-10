//
//  ProductListDataSource.swift
//  MVVM demo
//
//  Created by MinhDev on 9/9/21.
//

import Foundation
import UIKit

class ProductListDataSource: NSObject, UITableViewDataSource {
   
    
    var products = [Product(name: "minh", price: 10.9),
                    Product(name: "dong", price: 9.9)]
    
    init(products: [Product]) {
        self.products = products
    }
     
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath as IndexPath)
        let product = products[indexPath.row]
        cell.textLabel?.text = product.name
        cell.detailTextLabel?.text = String(product.price)
        return cell
    }
}
