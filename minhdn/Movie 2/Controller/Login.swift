//
//  Login.swift
//  Movie 2
//
//  Created by MinhDev on 7/22/21.
//
import UIKit

extension LoginViewController {
    
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
    
    private func usernameTextField() -> UITextField {
        username.frame = CGRect(x: 0, y: 0, width: self.view!.bounds.width * 0.9, height: 50.0)
        username.placeholder = "User Name"
        username.autocapitalizationType = .none
        username.font = UIFont(name: "Helvetica Neue", size: 15)
        username.borderStyle = UITextField.BorderStyle.roundedRect
        username.autocorrectionType = UITextAutocorrectionType.no
        username.keyboardType = UIKeyboardType.emailAddress
        username.returnKeyType = UIReturnKeyType.next
        username.clearButtonMode = UITextField.ViewMode.whileEditing
        username.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        username.center.x = view.center.x
        username.center.y = 360.0
        return username
    }
    
    private func passwordTextField() -> UITextField {
        passwordText.frame = CGRect(x: 0, y: 0, width: self.view!.bounds.width * 0.9, height: 50.0)
        passwordText.placeholder = "Password"
        passwordText.backgroundColor = .white
        passwordText.font = UIFont(name: "Helvetica Neue", size: 15)
        passwordText.borderStyle = UITextField.BorderStyle.roundedRect
        passwordText.autocorrectionType = UITextAutocorrectionType.no
        passwordText.keyboardType = UIKeyboardType.default
        passwordText.returnKeyType = UIReturnKeyType.send
        passwordText.clearButtonMode = UITextField.ViewMode.whileEditing
        passwordText.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        passwordText.isSecureTextEntry = true
        passwordText.center.x = view.center.x
        passwordText.center.y = 420.0
        return passwordText
    }
    
    private func signInButton() -> UIButton {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: view!.bounds.width * 0.9, height: 50)
        button.backgroundColor = .systemBlue
        button.titleLabel?.font = UIFont(name: "Arial", size: 15)
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 3
        button.center.x = view.center.x
        button.center.y = 500.0
        button.addTarget(self, action: #selector(onSignInPress), for: .touchUpInside)
        return button
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
        button.center.y = 560.0
        button.addTarget(self, action: #selector(onRegisterPress), for: .touchUpInside)
        return button
    }
    
    func setupContentView() {
    
        view.addSubview(logoView())
        view.addSubview(usernameTextField())
        view.addSubview(passwordTextField())
        view.addSubview(signInButton())
        view.addSubview( Register())
    }
    private func showAlert(_ message: String) {
        let alertController = UIAlertController(title: "Message", message: message, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc private func onSignInPress() {
        if self.username.text == login.username ,
           self.passwordText.text == login.password{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let vc = storyboard.instantiateViewController(withIdentifier: Constants.homeTabBarController) as? HomeTabBarcontroller else {return}
            self.navigationController?.pushViewController(vc, animated: true)
            
        }else {
            self.showAlert("wrong email/password ")
        }
    }
    @objc private func onRegisterPress() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: Constants.registerViewController) as? RegisterViewController else {return}
        self.navigationController?.pushViewController(vc, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}




