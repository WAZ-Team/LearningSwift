//
//  RegisterViewController.swift
//  Movie 2
//
//  Created by MinhDev on 7/28/21.
//

import UIKit


class RegisterViewController: UIViewController {
    //  MARK:   - Variables
    var fistname = UITextField()
    var lastname = UITextField()
    var username =  UITextField()
    var passwordText =  UITextField()
    var repasswordText =  UITextField()
    var vSpinner : UIView?
    let data = UserData()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupContentView()
        self.navigationController?.navigationBar.isHidden =  false
        self.navigationController?.navigationBar.barTintColor = .none
        self.navigationController?.navigationBar.backgroundColor = .none
        
    }
}


