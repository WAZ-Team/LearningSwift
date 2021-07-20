//
//  homTabBarcontroller.swift
//  Movie 2
//
//  Created by MinhDev on 7/20/21.
//

import UIKit

class homTabBarcontroller: UITabBarController {
    
        override func viewDidLoad() {
            super.viewDidLoad()
            setupTabBarController()
        }
        
        /// Creates the main view of the app with it`s respective tabs
        private func setupTabBarController(){
            
            /// Sets the selected colour for the icons and the
            self.tabBar.tintColor       = .appColor(.primaryColor)
            self.tabBar.backgroundColor = .white
        }
    }
