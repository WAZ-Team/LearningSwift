//
//  Setting.swift
//  Movie 2
//
//  Created by MinhDev on 7/30/21.
//

import Foundation
import UIKit
import MessageUI
import StoreKit
import UserNotifications

extension SettingViewController:MFMailComposeViewControllerDelegate{
    
    // MARK: - Type of cell
    struct Sections{
        let options: [SettingsOptionType]
    }
    
    enum SettingsOptionType {
        case standardCell(model: SettingStandardOption)
        case switchCell(model: SettingSwitchOptions)
        
    }
    
    struct SettingStandardOption {
        let title: String
        let icon: UIImage?
        let iconBackgroundColor: UIColor
        let handler: (() -> Void)
    }
    
    struct SettingSwitchOptions {
        let title: String
        let icon: UIImage?
        let iconBackgroundColor: UIColor
        let handler: (() -> Void)
        var isOn: Bool
    }
    
    //  MARK:   - Config
    func setupNavigationBar(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        title = "Setting"
        self.navigationController?.navigationItem.backButtonTitle = "Home"
        UserDefaults.standard.setValue( false , forKey: "isOn")
    }
    
    func showAlert(_ message: String) {
        let alertController = UIAlertController(title: "Message", message: message, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    func showAlertNotification() {
        if UserDefaults.standard.object(forKey: "isOn") as! Bool == false{
            let alertController = UIAlertController(title: "Meseage", message: "you are turn on Notification", preferredStyle: UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
            UserDefaults.standard.setValue(true , forKey: "isOn")
            self.Notification()
        }else{
            let alertController = UIAlertController(title: "Meseage", message: "you are turn off Notification", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
            UserDefaults.standard.setValue(false , forKey: "isOn")
            UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        }
    }
    //  MARK:   -   Notification
    func Notification(){
        
        let center = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        content.title = "Notifiaction on a Movie"
        content.body = "This is a local notification on Movie"
        content.sound = .default        // setting sound
        content.userInfo = ["value": "Data with local notification"]
//        a repeating alarm at 21:00 pm every day
        var dateComponents = DateComponents()
        dateComponents.hour = 21
        dateComponents.minute = 00
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
//        test 5s
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

        let request = UNNotificationRequest(identifier: "reminder", content: content, trigger: trigger)
        center.add(request) { (error) in
            if error != nil {
                print("Error = \(error?.localizedDescription ?? "error local notification")")
            }
        }
    }
    //  MARK:   -Email
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["minhptit5896@gmail.com"])
            mail.setMessageBody("<p>You're so awesome!</p>", isHTML: true)
            present(mail, animated: true)
        } else {
            self.showAlert("error")
        }
    }
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    //  MARK:   - Share
    func tapFunctionShare() {
        if let name = URL(string: "https://itunes.apple.com/us/app/myapp/1537280676?ls=1&mt=8"), !name.absoluteString.isEmpty {
            let objectsToShare = [name]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            self.present(activityVC, animated: true, completion: nil)
        }else {
            self.showAlert("error")
        }
    }
    //  MARK:   -Rate
    @objc func tapFunctionRateApp() {
        print("tap tapFunctionRateApp")
        SKStoreReviewController.requestReview()
    }
    // MARK: - Configure cell
    
    func configure() {
        
        models.append(Sections(options: [
            
            .standardCell(model: SettingStandardOption(
                            title: "profile",
                            icon: UIImage(named: "account"),
                            iconBackgroundColor: UIColor(red: 0.91, green: 0.96, blue: 1.00, alpha: 1.00),
                            handler: {
                                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                guard let vc = storyboard.instantiateViewController(withIdentifier: Constants.profileViewController) as? ProfileViewController else{return}
                                self.navigationController?.pushViewController(vc, animated: true)
                            })),
            
        ]))
        
        models.append(Sections(options: [
            
            .standardCell(model: SettingStandardOption(
                            title: "Notification",
                            icon: UIImage(named: "notification"),
                            iconBackgroundColor: UIColor(red: 0.91, green: 0.96, blue: 1.00, alpha: 1.00),
                            handler: {
                                self.showAlertNotification()
                            })),
            .standardCell(model: SettingStandardOption(
                            title: "Feed Back",
                            icon: UIImage(named: "feedback"),
                            iconBackgroundColor: UIColor(red: 0.91, green: 0.96, blue: 1.00, alpha: 1.00),
                            handler: {
                                self.sendEmail()
                            })),
            
            .standardCell(model: SettingStandardOption(
                            title: "Shared",
                            icon: UIImage(named: "share"),
                            iconBackgroundColor: UIColor(red: 0.91, green: 0.96, blue: 1.00, alpha: 1.00),
                            handler: {
                                self.tapFunctionShare()
                            })),
            
            .standardCell(model: SettingStandardOption(
                            title: "Rate App",
                            icon: UIImage(named: "rate"),
                            iconBackgroundColor: UIColor(red: 0.91, green: 0.96, blue: 1.00, alpha: 1.00),
                            handler: {
                                self.tapFunctionRateApp()
                            })),
            .standardCell(model: SettingStandardOption(
                            title: "Policy",
                            icon: UIImage(named: "book"),
                            iconBackgroundColor: UIColor(red: 0.91, green: 0.96, blue: 1.00, alpha: 1.00),
                            handler: {
                                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                guard let vc = storyboard.instantiateViewController(withIdentifier: Constants.polyciViewController) as? PolyciViewController else{return}
                                self.navigationController?.pushViewController(vc, animated: true)
                                
                            })),
            .standardCell(model: SettingStandardOption(
                            title: "Logout",
                            icon: UIImage(named: "logout"),
                            iconBackgroundColor: UIColor(red: 0.91, green: 0.96, blue: 1.00, alpha: 1.00),
                            handler: {
                                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                guard let vc = storyboard.instantiateViewController(withIdentifier: Constants.loginViewController) as? LoginViewController else{return}
                                self.navigationController?.pushViewController(vc, animated: true)
                            })),
        ]))
        
        
    }
    
}
