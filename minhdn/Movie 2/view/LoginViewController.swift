//
//  LoginViewController.swift
//  Movie 2
//
//  Created by MinhDev on 7/22/21.
//

import UIKit

class LoginViewController: UIViewController {
        var emailText =  UITextField()
        var passwordText =  UITextField()
        var vSpinner : UIView?
        override func viewDidLoad() {
            super.viewDidLoad()
            setupContentView()
            self.navigationController?.navigationBar.isHidden = true
            guard AppDelegate.isDark else { return }
        }
            
        func showAlert(_ message: String) {
            let alertController = UIAlertController(title: "Message", message: message, preferredStyle: UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
        
        @objc func onSignInPress() {
            guard let email = self.emailText.text, let password = self.passwordText.text else {
                self.showAlert("email/password can't be empty")
                return
            }
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let vc = storyboard.instantiateViewController(withIdentifier: Constants.homeTabBarController) as? HomeTabBarcontroller else {return}
            self.navigationController?.pushViewController(vc, animated: true)
                        }
            
//            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
//                if (error != nil) {
//                    self?.showAlert("\(error?.localizedDescription ?? "Unknow error")")
//                    return
//                }
//
//               self?.navigationController?.pushViewController(TabBarController(), animated: true)
//            }
//        }
//
//        @objc func goBack() {
//            self.navigationController?.popViewController(animated: true)
//        }
//
//        override func didReceiveMemoryWarning() {
//            super.didReceiveMemoryWarning()
//        }
//
//    }
//
}
