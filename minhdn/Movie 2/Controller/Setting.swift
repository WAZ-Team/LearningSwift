//
//  Setting.swift
//  Movie 2
//
//  Created by MinhDev on 7/30/21.
//

import Foundation
extension SettingViewController{
    
    func setupNavigationBar(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        title = "Setting"
        self.navigationController?.navigationItem.backButtonTitle = "Home"
    }
    
}
