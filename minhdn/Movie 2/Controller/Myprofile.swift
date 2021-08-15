//
//  Myprofile.swift
//  Movie 2
//
//  Created by MinhDev on 7/30/21.
//

import UIKit
import RealmSwift
extension ProfileViewController: UINavigationControllerDelegate {
    //  MARK:   - Getdata
    func getchange() -> UserData{
        let realm = try! Realm()
        let user:Results<UserData> = realm.objects(UserData.self)
        if user.count > 0 {
            if let user = user.first {
                self.data.username = user.username
                self.data.password = user.password
                self.data.fistname = user.fistname
                self.data.lastname = user.lastname
            }
        } else {
            print("Error")
        }
        return data
    }
    //  MARK:   -   Alert
    func showAlert(_ message: String) {
        let alertController = UIAlertController(title: "Message", message: message, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    //    MARK:     -   ChangePassWord
    @objc func onChange() {
        if self.oldpasswordText.text == data.password {
            data.password = newpasswordText.text!
            do {
                let realm = try Realm()
                try realm.write {
                    data.password = newpasswordText.text!
                    data.fistname = fistname.text!
                    data.lastname = lastname.text!
                    //                    data.photo = NSData(data: (userImage().image?.pngData())! )
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
