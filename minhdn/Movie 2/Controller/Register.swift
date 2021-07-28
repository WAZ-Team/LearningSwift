//
//  Register.swift
//  Movie 2
//
//  Created by MinhDev on 7/28/21.
//

import UIKit

extension RegisterViewController {
    
    func logoView() -> UIImageView {
        let img = UIImageView()
        img.frame = CGRect(x: 0, y: 0, width: 300, height: 200)
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        img.image = UIImage(named: "Logo")
        img.center.x = view.center.x
        img.center.y = 200.0
        return img
    }

    func emailTextField() -> UITextField {
        emailText.frame = CGRect(x: 0, y: 0, width: self.view!.bounds.width * 0.9, height: 50.0)
        emailText.placeholder = "Email"
        emailText.autocapitalizationType = .none
        emailText.font = UIFont.systemFont(ofSize: 17)
        emailText.borderStyle = UITextField.BorderStyle.roundedRect
        emailText.autocorrectionType = UITextAutocorrectionType.no
        emailText.keyboardType = UIKeyboardType.emailAddress
        emailText.returnKeyType = UIReturnKeyType.next
        emailText.clearButtonMode = UITextField.ViewMode.whileEditing
        emailText.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        emailText.center.x = view.center.x
        emailText.center.y = 300.0
        return emailText
    }
    
    func passwordTextField() -> UITextField {
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
        passwordText.center.y = 360.0
       return passwordText
    }
    func rePasswordTextField() -> UITextField {
        repasswordText.frame = CGRect(x: 0, y: 0, width: self.view!.bounds.width * 0.9, height: 50.0)
        repasswordText.placeholder = "Password"
        repasswordText.text = ""
        repasswordText.font = UIFont.systemFont(ofSize: 17)
        repasswordText.borderStyle = UITextField.BorderStyle.roundedRect
        repasswordText.autocorrectionType = UITextAutocorrectionType.no
        repasswordText.keyboardType = UIKeyboardType.default
        repasswordText.returnKeyType = UIReturnKeyType.send
        repasswordText.clearButtonMode = UITextField.ViewMode.whileEditing
        repasswordText.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        repasswordText.isSecureTextEntry = true
        repasswordText.center.x = view.center.x
        repasswordText.center.y = 420
       return repasswordText
    }
    func Register() -> UIButton {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: view!.bounds.width * 0.9, height: 50)
        button.backgroundColor = .red
        button.titleLabel?.font = UIFont(name: "Arial", size: 15)
        button.setTitle("Register", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 3
        button.center.x = view.center.x
        button.center.y = 480.0
        button.addTarget(self, action: #selector(onRegister), for: .touchUpInside)
        return button
    }

    func setupContentView() {
        view.backgroundColor = .black
        view.addSubview(logoView())
        view.addSubview(emailTextField())
        view.addSubview(passwordTextField())
        view.addSubview(rePasswordTextField())
        view.addSubview(Register())
    }
}
