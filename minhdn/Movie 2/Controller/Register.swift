//
//  Register.swift
//  Movie 2
//
//  Created by MinhDev on 7/28/21.
//

import UIKit
import RealmSwift
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
    
    func fistnameTextField() -> UITextField {
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
        fistname.center.y = 300.0
        return fistname
    }
    func lastnameTextField() -> UITextField {
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
        lastname.center.y = 360.0
        return lastname
    }
    func usernameTextField() -> UITextField {
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
        username.center.y = 420.0
        return username
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
        passwordText.center.y = 480.0
        return passwordText
    }
    func rePasswordTextField() -> UITextField {
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
        repasswordText.center.y = 540.0
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
        button.center.y = 600.0
        button.addTarget(self, action: #selector(onRegister), for: .touchUpInside)
        return button
    }
    
    func setupContentView() {
        view.backgroundColor = .black
        view.addSubview(logoView())
        view.addSubview(lastnameTextField())
        view.addSubview(fistnameTextField())
        view.addSubview(usernameTextField())
        view.addSubview(passwordTextField())
        view.addSubview(rePasswordTextField())
        view.addSubview(Register())
    }
    func showAlert(_ message: String) {
        let alertController = UIAlertController(title: "Message", message: message, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func onRegister() {
        if  self.lastname.text == "" , self.fistname.text == "" ,
            self.username.text == data.username , self.passwordText.text == "" {
            self.showAlert(" fistname/lastname/email/password can't be empty")
        }else {
            if self.passwordText.text == self.repasswordText.text {
                do {
                    let realm = try Realm()
                    try realm.write {
                        data.username = username.text!
                        data.password = passwordText.text!
                        data.fistname = fistname.text!
                        data.lastname = lastname.text!
                        realm.add(data)
                    }
                    print("Data saved successfully!")
                    print(Realm.Configuration.defaultConfiguration.fileURL!)
                    let ac = UIAlertController(title: "Conguarate!", message: "Your preferences have been saved.", preferredStyle: .actionSheet)
                    ac.addAction(UIAlertAction(title: "OK", style: .default))
                    present(ac, animated: true)
                    
                } catch {
                    print("Error: \(error)")
                }
            }else{
                showAlert("wrong password")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

