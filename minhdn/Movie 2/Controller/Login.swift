//
//  Login.swift
//  Movie 2
//
//  Created by MinhDev on 7/22/21.
//
import UIKit
import RealmSwift
extension LoginViewController {
    //    MARK:     - Getdata
    
    func getuser() -> UserData{
        let realm = try! Realm()
        let user = realm.objects(UserData.self)
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
//  MARK:   -   Alert
    private func showAlert(_ message: String) {
        let alertController = UIAlertController(title: "Message", message: message, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
//  MARK:   -   SignIn
    @objc func onSignInPress() {
        if self.username.text == login.username ,
           self.passwordText.text == login.password{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let vc = storyboard.instantiateViewController(withIdentifier: Constants.homeTabBarController) as? HomeTabBarcontroller else {return}
            self.navigationController?.pushViewController(vc, animated: true)
            
        }else {
            self.showAlert("wrong email/password ")
        }
    }
//  MARK:   -   Register
    @objc func onRegisterPress() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: Constants.registerViewController) as? RegisterViewController else {return}
        self.navigationController?.pushViewController(vc, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}




