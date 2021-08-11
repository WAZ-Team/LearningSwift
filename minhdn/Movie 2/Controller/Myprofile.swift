//
//  Myprofile.swift
//  Movie 2
//
//  Created by MinhDev on 7/30/21.
//

import UIKit
import RealmSwift
extension ProfileViewController {
    
    
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
        fistname.center.y = 300.0
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
        lastname.center.y = 360.0
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
        username.center.y = 420.0
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
        oldpasswordText.center.y = 480.0
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
        newpasswordText.center.y = 540.0
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
        button.center.y = 600.0
        button.addTarget(self, action: #selector(onChange), for: .touchUpInside)
        return button
    }
    
    func setupContentView() {
        view.backgroundColor = .white
        view.addSubview(lastnameTextField())
        view.addSubview(fistnameTextField())
        view.addSubview(usernameTextField())
        view.addSubview(oldpasswordTextField())
        view.addSubview(newPasswordTextField())
        view.addSubview(changePass())
    }
    func showAlert(_ message: String) {
        let alertController = UIAlertController(title: "Message", message: message, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func onChange() {
        if self.oldpasswordText.text == data.password {
            data.password = newpasswordText.text!
            do {
                let realm = try Realm()
                try realm.write {
                    data.password = newpasswordText.text!
                    data.fistname = fistname.text!
                    data.lastname = lastname.text!
                    realm.add(data, update: .all)
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

