//
//  LoginViewController.swift
//  Movie 2
//
//  Created by MinhDev on 7/22/21.
//


import UIKit
import RealmSwift

class LoginViewController: UIViewController {
    //  MARK:   - Variables
    var username =  UITextField()
    var passwordText =  UITextField()
    var vSpinner : UIView?
    var login = UserData()
    //    MARK:     - Getdata
    func getuser() -> UserData{
        let realm = try! Realm()
        let user:Results<UserData> = realm.objects(UserData.self)
        if user.count >= 0 {
            if let user = user.first {
                self.login.username = user.username
                self.login.password = user.password
                self.login.fistname = user.fistname
                self.login.lastname = user.lastname
            }
        } else {
            print("Error")
        }
        return login
    }
    //     MARK:    - View
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = true
        print(getuser())
        setupContentView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupContentView()
        
    }
    
}

