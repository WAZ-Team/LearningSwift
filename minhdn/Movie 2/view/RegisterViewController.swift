//
//  RegisterViewController.swift
//  Movie 2
//
//  Created by MinhDev on 7/28/21.
//

import UIKit
import RealmSwift
class RegisterViewController: UIViewController {
    var emailText =  UITextField()
    var passwordText =  UITextField()
    var repasswordText =  UITextField()
    var vSpinner : UIView?
    let data = UserData()
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
    
@objc func onRegister() {
  
    if self.passwordText.text == self.repasswordText.text {
        data.mail = emailText.text!
        data.password = passwordText.text!
        
        do {
            let realm = try Realm()
            try realm.write {
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
        self.navigationController?.popViewController(animated: true)
    }else{
       showAlert("sai pass")
    }
  
}
    @objc func goBack() {
        self.navigationController?.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}


