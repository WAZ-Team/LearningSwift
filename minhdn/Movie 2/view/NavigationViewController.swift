//
//  NavigationViewController.swift
//  Movie 2
//
//  Created by MinhDev on 7/23/21.
//

import UIKit

class NavigationViewController: UINavigationController {
    
        override func viewDidLoad() {
            super.viewDidLoad()
            guard AppDelegate.isDark else { return }
            navigationBar.barStyle = .black
        }

    
    
    }
