//
//  MeViewController.swift
//  Movie 2
//
//  Created by MinhDev on 7/29/21.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet private weak var SettingTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SettingTableView.delegate = self
        SettingTableView.dataSource = self
        setupNavigationBar()
    }

}
//  MARK:  - Datasource
extension SettingViewController: UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

}
//  MARK:   - Delegate
extension SettingViewController: UITableViewDelegate{
    
}
