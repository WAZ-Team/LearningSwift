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
    
    func getuser() -> [UserData]{
        let realm = try! Realm()
        let user = realm.objects(UserData.self).toArray(ofType: UserData.self)
        if userlogin.count >= 0 {
            for item in user{
                userlogin.append(item)
            }
        } else {
            print("Error")
        }
        return userlogin
    }
//  MARK:   -   Alert
    private func showAlert(_ message: String) {
        let alertController = UIAlertController(title: "Message", message: message, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
//  MARK:   -   SignIn
    @objc func onSignInPress() {
        for item in userlogin{
            if self.username.text == item.username  ,
               self.username.text == item.password{
                login.username = self.username.text ?? ""
                login.password = self.passwordText.text ?? ""
            }
        }
        if self.username.text == "" || self.passwordText.text == ""{
            self.showAlert("wrong email/password")
        }else{
        if self.username.text == login.username ,
           self.passwordText.text == login.password{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let vc = storyboard.instantiateViewController(withIdentifier: Constants.homeTabBarController) as? HomeTabBarcontroller else {return}
            self.navigationController?.pushViewController(vc, animated: true)
            
        }else {
            self.showAlert("wrong email/password ")
        }
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




