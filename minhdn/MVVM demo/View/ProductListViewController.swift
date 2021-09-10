//
//  ProductListViewController.swift
//  MVVM demo
//
//  Created by MinhDev on 9/9/21.
//

import UIKit

class ProductListViewController: UIViewController {
    
    @IBOutlet private weak var tableview: UITableView!
    var viewModel: ProductListViewModelProtocol? {
        didSet {
            self.viewModel?.productsDidChange = { [self] viewModel in
                self.tableview.dataSource = self.viewModel?.productListDataSource
                self.tableview.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel?.showProductList()
    }

}
