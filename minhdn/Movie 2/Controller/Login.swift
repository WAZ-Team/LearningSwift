//
//  Login.swift
//  Movie 2
//
//  Created by MinhDev on 7/22/21.
//
import UIKit

extension LoginViewController {
    
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
        username.center.y = 300.0
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
        passwordText.center.y = 360.0
       return passwordText
    }
    
    func signInButton() -> UIButton {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: view!.bounds.width * 0.9, height: 50)
        button.backgroundColor = .red
        button.titleLabel?.font = UIFont(name: "Arial", size: 15)
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 3
        button.center.x = view.center.x
        button.center.y = 440.0
        button.addTarget(self, action: #selector(onSignInPress), for: .touchUpInside)
        return button
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
        button.center.y = 500.0
        button.addTarget(self, action: #selector(onRegisterPress), for: .touchUpInside)
        return button
    }
    
    func setupContentView() {
        view.backgroundColor = .black
        view.addSubview(logoView())
        view.addSubview(usernameTextField())
        view.addSubview(passwordTextField())
        view.addSubview(signInButton())
        view.addSubview( Register())
    }
    func showAlert(_ message: String) {
        let alertController = UIAlertController(title: "Message", message: message, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func onSignInPress() {
        guard self.username.text == UserData.init().username , self.passwordText.text == UserData.init().password else {
            self.showAlert("wrong email/password ")
            return
        }
       
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: Constants.homeTabBarController) as? HomeTabBarcontroller else {return}
        self.navigationController?.pushViewController(vc, animated: true)
    }
@objc func onRegisterPress() {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    guard let vc = storyboard.instantiateViewController(withIdentifier: Constants.registerViewController) as? RegisterViewController else {return}
    self.navigationController?.pushViewController(vc, animated: true)
}
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}




