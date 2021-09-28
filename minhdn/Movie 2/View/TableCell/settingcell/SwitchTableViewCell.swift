//
//  SwitchTableViewCell.swift
//  Movie 2
//
//  Created by MinhDev on 8/10/21.
//

import UIKit
import UserNotifications
class SwitchTableViewCell: UITableViewCell {
    
    // MARK: - Elements
    static let indentifier = "SwitchTableViewCell"
    
    private let iconContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
    }()
    
    private let mySwitch: UISwitch = {
        let mySwitch =  UISwitch()
        mySwitch.onTintColor = .systemGreen
        if mySwitch.isOn{
            mySwitch.addTarget(self, action: #selector(switchChanged(_:)), for: .valueChanged)
        }else{}
        
        return mySwitch
    }()
    
    @objc private func switchChanged(_ sender: UISwitch!) {
            let center = UNUserNotificationCenter.current()
            
            let content = UNMutableNotificationContent()
            content.title = "Notifiaction on a certail date"
            content.body = "This is a local notification on certain date"
            content.sound = .default
            content.userInfo = ["value": "Data with local notification"]
            
            
            let fireDate = Calendar.current.dateComponents([.day, .month, .year, .hour, .minute, .second], from: Date().addingTimeInterval(3))
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: fireDate, repeats: false)
//            UNTimeIntervalNotificationTrigger(timeInterval: 20, repeats: false)
            
            let request = UNNotificationRequest(identifier: "reminder", content: content, trigger: trigger)
            center.add(request) { (error) in
                if error != nil {
                    print("Error = \(error?.localizedDescription ?? "error local notification")")
                }
            }
            print("Table row switch Changed \(sender.tag)")
            print("The switch is \(sender.isOn ? "ON" : "OFF")")
        
    }
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(iconContainer)
        iconContainer.addSubview(iconImageView)
        contentView.addSubview(label)
        contentView.addSubview(mySwitch)
        contentView.clipsToBounds = true
        accessoryType = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Settings
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.backgroundColor = UIColor(red: 0.91, green: 0.96, blue: 1.00, alpha: 1.00)
        let size: CGFloat = contentView.frame.size.height - 12
        iconContainer.frame = CGRect(x: 15, y: 6, width: size, height: size)
        
        mySwitch.sizeToFit()
        mySwitch.frame = CGRect(x: (contentView.frame.size.width - 20 - mySwitch.frame.size.width),
                                y: (contentView.frame.size.height - mySwitch.frame.size.height)/2,
                                width: mySwitch.frame.size.width,
                                height: mySwitch.frame.size.height)
        
        let imageSize: CGFloat = size/1.5
        iconImageView.frame = CGRect(x: (size - imageSize)/2,
                                     y: (size - imageSize)/2,
                                     width: imageSize,
                                     height: imageSize)
        
        label.frame = CGRect(x: 25 + iconContainer.frame.size.width,
                             y: 0,
                             width: contentView.frame.size.width - 20 - iconContainer.frame.size.width,
                             height: contentView.frame.size.height)
    }
    
    // MARK: - Configure cell
    
    public func configure(with model: SettingViewController.SettingSwitchOptions) {
        label.text = model.title
        iconImageView.image = model.icon
        iconContainer.backgroundColor = model.iconBackgroundColor
        mySwitch.isOn = model.isOn
    }
}

