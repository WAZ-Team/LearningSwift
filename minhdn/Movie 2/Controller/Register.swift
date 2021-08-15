//
//  Register.swift
//  Movie 2
//
//  Created by MinhDev on 7/28/21.
//

import UIKit
import RealmSwift
extension RegisterViewController {
    
    private func showAlert(_ message: String) {
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
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    guard let vc = storyboard.instantiateViewController(withIdentifier: Constants.loginViewController) as? LoginViewController else {return}
                    self.navigationController?.pushViewController(vc, animated: true)
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

