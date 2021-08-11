//
//  ProfileViewController.swift
//  Movie 2
//
//  Created by MinhDev on 8/10/21.
//

import UIKit
import RealmSwift

class ProfileViewController: UIViewController {
    //  MARK:-  Veriable
    var fistname = UITextField()
    var lastname = UITextField()
    var username =  UITextField()
    var oldpasswordText =  UITextField()
    var newpasswordText =  UITextField()
    var vSpinner : UIView?
    var data = UserData()
    //  MARK:   - Getdata
    func getchange() -> UserData{
        let realm = try! Realm()
        let user:Results<UserData> = realm.objects(UserData.self)
        if user.count > 0 {
            if let user = user.first {
                self.data.username = user.username
                self.data.password = user.password
                self.data.fistname = user.fistname
                self.data.lastname = user.lastname
            }
        } else {
            print("Error")
        }
        return data
    }
    //  MARK:   -   View
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        setupContentView()
        self.data = self.getchange()
        username.isEnabled = false
        username.text = data.username
        fistname.text = data.fistname
        lastname.text = data.lastname
    }
}
