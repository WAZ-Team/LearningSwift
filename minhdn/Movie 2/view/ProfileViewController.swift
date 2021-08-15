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
    
    //  MARK:   -   Setup View
    
    func fistnameTextField() -> UITextField {
        fistname.frame = CGRect(x: 0, y: 0, width: self.view!.bounds.width * 0.9, height: 50.0)
        fistname.text = data.fistname
        fistname.autocapitalizationType = .none
        fistname.font = UIFont.systemFont(ofSize: 17)
        fistname.borderStyle = UITextField.BorderStyle.roundedRect
        fistname.autocorrectionType = UITextAutocorrectionType.no
        fistname.keyboardType = UIKeyboardType.emailAddress
        fistname.returnKeyType = UIReturnKeyType.next
        fistname.clearButtonMode = UITextField.ViewMode.whileEditing
        fistname.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        fistname.center.x = view.center.x
        fistname.center.y = 350.0
        return fistname
    }
    func lastnameTextField() -> UITextField {
        lastname.frame = CGRect(x: 0, y: 0, width: self.view!.bounds.width * 0.9, height: 50.0)
        lastname.text = data.lastname
        lastname.autocapitalizationType = .none
        lastname.font = UIFont.systemFont(ofSize: 17)
        lastname.borderStyle = UITextField.BorderStyle.roundedRect
        lastname.autocorrectionType = UITextAutocorrectionType.no
        lastname.keyboardType = UIKeyboardType.emailAddress
        lastname.returnKeyType = UIReturnKeyType.next
        lastname.clearButtonMode = UITextField.ViewMode.whileEditing
        lastname.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        lastname.center.x = view.center.x
        lastname.center.y = 410.0
        return lastname
    }
    
    func usernameTextField() -> UITextField {
        username.frame = CGRect(x: 0, y: 0, width: self.view!.bounds.width * 0.9, height: 50.0)
        username.text = data.username
        username.autocapitalizationType = .none
        username.font = UIFont.systemFont(ofSize: 17)
        username.borderStyle = UITextField.BorderStyle.roundedRect
        username.autocorrectionType = UITextAutocorrectionType.no
        username.keyboardType = UIKeyboardType.emailAddress
        username.returnKeyType = UIReturnKeyType.next
        username.clearButtonMode = UITextField.ViewMode.whileEditing
        username.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        username.center.x = view.center.x
        username.center.y = 470.0
        return username
    }
    
    func oldpasswordTextField() -> UITextField {
        oldpasswordText.frame = CGRect(x: 0, y: 0, width: self.view!.bounds.width * 0.9, height: 50.0)
        oldpasswordText.placeholder = "Old Password"
        oldpasswordText.font = UIFont.systemFont(ofSize: 17)
        oldpasswordText.borderStyle = UITextField.BorderStyle.roundedRect
        oldpasswordText.autocorrectionType = UITextAutocorrectionType.no
        oldpasswordText.keyboardType = UIKeyboardType.default
        oldpasswordText.returnKeyType = UIReturnKeyType.send
        oldpasswordText.clearButtonMode = UITextField.ViewMode.whileEditing
        oldpasswordText.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        oldpasswordText.isSecureTextEntry = true
        oldpasswordText.center.x = view.center.x
        oldpasswordText.center.y = 530.0
        return oldpasswordText
    }
    func newPasswordTextField() -> UITextField {
        newpasswordText.frame = CGRect(x: 0, y: 0, width: self.view!.bounds.width * 0.9, height: 50.0)
        newpasswordText.placeholder = "New Password"
        newpasswordText.font = UIFont.systemFont(ofSize: 17)
        newpasswordText.borderStyle = UITextField.BorderStyle.roundedRect
        newpasswordText.autocorrectionType = UITextAutocorrectionType.no
        newpasswordText.keyboardType = UIKeyboardType.default
        newpasswordText.returnKeyType = UIReturnKeyType.send
        newpasswordText.clearButtonMode = UITextField.ViewMode.whileEditing
        newpasswordText.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        newpasswordText.isSecureTextEntry = true
        newpasswordText.center.x = view.center.x
        newpasswordText.center.y = 590.0
        return newpasswordText
    }
    func changePass() -> UIButton {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: view!.bounds.width * 0.9, height: 50)
        button.backgroundColor = .black
        button.titleLabel?.font = UIFont(name: "Arial", size: 15)
        button.setTitle("ChangePassword", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 3
        button.center.x = view.center.x
        button.center.y = 650.0
        button.addTarget(self, action: #selector(onChange), for: .touchUpInside)
        return button
    }
    
    func setupContentView() {
        view.backgroundColor = UIColor(red: 0.91, green: 0.96, blue: 1.00, alpha: 1.00)
        view.addSubview(lastnameTextField())
        view.addSubview(fistnameTextField())
        view.addSubview(usernameTextField())
        view.addSubview(oldpasswordTextField())
        view.addSubview(newPasswordTextField())
        view.addSubview(changePass())
    }
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
