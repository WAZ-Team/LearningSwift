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
    func getchange() -> [UserData]{
        let realm = try! Realm()
        let user = realm.objects(UserData.self).toArray(ofType: UserData.self)
        if dataUserCheck.count >= 0 {
            for item in user{
                dataUserCheck.append(item)
            }
        } else {
            print("Error")
        }
        return dataUserCheck
    }
    //  MARK:   -   Alert
    func showAlert(_ message: String) {
        let alertController = UIAlertController(title: "Message", message: message, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    //    MARK:     -   ChangePassWord
    @objc func onChange() {
        if self.oldpasswordText.text == dataUser.password {
            dataUser.password = newpasswordText.text ?? ""
            do {
                let realm = try Realm()
                try realm.write {
                    dataUser.password = newpasswordText.text ?? ""
                    dataUser.fistname = fistname.text ?? ""
                    dataUser.lastname = lastname.text ?? ""
                    //                    data.photo = NSData(data: (userImage().image?.pngData())! )
                    realm.add(dataUser, update: .all)
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
