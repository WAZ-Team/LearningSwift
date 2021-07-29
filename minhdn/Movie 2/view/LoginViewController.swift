//
//  LoginViewController.swift
//  Movie 2
//
//  Created by MinhDev on 7/22/21.
//

import UIKit

class LoginViewController: UIViewController {
    //  MARK:   - Variables
        var username =  UITextField()
        var passwordText =  UITextField()
        var vSpinner : UIView?
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        username.text = ""
        passwordText.text = ""
    }
        override func viewDidLoad() {
            super.viewDidLoad()
            setupContentView()
            self.navigationController?.navigationBar.isHidden = true
            guard AppDelegate.isDark else { return }
        }
    //  MARK: - Config
            
}
