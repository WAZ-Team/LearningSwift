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
    //  MARK:   -   Setup View
    private func logoView() -> UIImageView {
        let img = UIImageView()
        img.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        img.contentMode = .scaleToFill
        img.layer.cornerRadius = img.frame.size.width/2
        img.layer.borderWidth = 3
        img.layer.borderColor = UIColor.black.cgColor
        img.clipsToBounds = true
        img.image = UIImage(named: "logo")
        img.center.x = view.center.x
        img.center.y = 200.0
        return img
    }
    
    private func fistnameTextField() -> UITextField {
        fistname.frame = CGRect(x: 0, y: 0, width: self.view!.bounds.width * 0.9, height: 50.0)
        fistname.placeholder = "Fist Name"
        fistname.autocapitalizationType = .none
        fistname.font = UIFont.systemFont(ofSize: 17)
        fistname.borderStyle = UITextField.BorderStyle.roundedRect
        fistname.autocorrectionType = UITextAutocorrectionType.no
        fistname.keyboardType = UIKeyboardType.emailAddress
        fistname.returnKeyType = UIReturnKeyType.next
        fistname.clearButtonMode = UITextField.ViewMode.whileEditing
        fistname.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        fistname.center.x = view.center.x
        fistname.center.y = 360.0
        return fistname
    }
    private func lastnameTextField() -> UITextField {
        lastname.frame = CGRect(x: 0, y: 0, width: self.view!.bounds.width * 0.9, height: 50.0)
        lastname.placeholder = "Last Name"
        lastname.autocapitalizationType = .none
        lastname.font = UIFont.systemFont(ofSize: 17)
        lastname.borderStyle = UITextField.BorderStyle.roundedRect
        lastname.autocorrectionType = UITextAutocorrectionType.no
        lastname.keyboardType = UIKeyboardType.emailAddress
        lastname.returnKeyType = UIReturnKeyType.next
        lastname.clearButtonMode = UITextField.ViewMode.whileEditing
        lastname.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        lastname.center.x = view.center.x
        lastname.center.y = 420.0
        return lastname
    }
    private func usernameTextField() -> UITextField {
        username.frame = CGRect(x: 0, y: 0, width: self.view!.bounds.width * 0.9, height: 50.0)
        username.placeholder = "User Name"
        username.autocapitalizationType = .none
        username.font = UIFont.systemFont(ofSize: 17)
        username.borderStyle = UITextField.BorderStyle.roundedRect
        username.autocorrectionType = UITextAutocorrectionType.no
        username.keyboardType = UIKeyboardType.emailAddress
        username.returnKeyType = UIReturnKeyType.next
        username.clearButtonMode = UITextField.ViewMode.whileEditing
        username.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        username.center.x = view.center.x
        username.center.y = 480.0
        return username
    }
    
    private func passwordTextField() -> UITextField {
        passwordText.frame = CGRect(x: 0, y: 0, width: self.view!.bounds.width * 0.9, height: 50.0)
        passwordText.placeholder = "Password"
        passwordText.font = UIFont.systemFont(ofSize: 17)
        passwordText.borderStyle = UITextField.BorderStyle.roundedRect
        passwordText.autocorrectionType = UITextAutocorrectionType.no
        passwordText.keyboardType = UIKeyboardType.default
        passwordText.returnKeyType = UIReturnKeyType.send
        passwordText.clearButtonMode = UITextField.ViewMode.whileEditing
        passwordText.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        passwordText.isSecureTextEntry = true
        passwordText.center.x = view.center.x
        passwordText.center.y = 540.0
        return passwordText
    }
    private func rePasswordTextField() -> UITextField {
        repasswordText.frame = CGRect(x: 0, y: 0, width: self.view!.bounds.width * 0.9, height: 50.0)
        repasswordText.placeholder = "Confirm Password"
        repasswordText.font = UIFont.systemFont(ofSize: 17)
        repasswordText.borderStyle = UITextField.BorderStyle.roundedRect
        repasswordText.autocorrectionType = UITextAutocorrectionType.no
        repasswordText.keyboardType = UIKeyboardType.default
        repasswordText.returnKeyType = UIReturnKeyType.send
        repasswordText.clearButtonMode = UITextField.ViewMode.whileEditing
        repasswordText.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        repasswordText.isSecureTextEntry = true
        repasswordText.center.x = view.center.x
        repasswordText.center.y = 600.0
        return repasswordText
    }
    private func Register() -> UIButton {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: view!.bounds.width * 0.9, height: 50)
        button.backgroundColor = .systemBlue
        button.titleLabel?.font = UIFont(name: "Arial", size: 15)
        button.setTitle("Register", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 3
        button.center.x = view.center.x
        button.center.y = 660.0
        button.addTarget(self, action: #selector(onRegister), for: .touchUpInside)
        return button
    }
    
    func setupContentView() {
        view.addSubview(logoView())
        view.addSubview(lastnameTextField())
        view.addSubview(fistnameTextField())
        view.addSubview(usernameTextField())
        view.addSubview(passwordTextField())
        view.addSubview(rePasswordTextField())
        view.addSubview(Register())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupContentView()
        self.navigationController?.navigationBar.isHidden =  false
        self.navigationController?.navigationBar.barTintColor = .none
        self.navigationController?.navigationBar.backgroundColor = .none
        
    }
}
