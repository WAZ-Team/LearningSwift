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
    }
    
    func showAlert(_ message: String) {
        let alertController = UIAlertController(title: "Message", message: message, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    //  MARK:   -   Notification
    func Notification(){
        let center = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = "Notifiaction on a certail date"
        content.body = "This is a local notification on certain date"
        content.sound = .default
        content.userInfo = ["value": "Data with local notification"]
        
        
        let fireDate = Calendar.current.dateComponents([.day, .month, .year, .hour, .minute, .second], from: Date().addingTimeInterval(10))
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: fireDate, repeats: false)
        //UNTimeIntervalNotificationTrigger(timeInterval: 20, repeats: false)
        
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
            
            .switchCell(model: SettingSwitchOptions(
                            title: "Notification",
                            icon: UIImage(named: "notification"),
                            iconBackgroundColor: UIColor(red: 0.91, green: 0.96, blue: 1.00, alpha: 1.00),
                            handler: {
                                self.Notification()
                            }, isOn: true)),
            
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
