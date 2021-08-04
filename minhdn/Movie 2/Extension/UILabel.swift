//
//  UILabel.swift
//  Movie 2
//
//  Created by MinhDev on 8/3/21.
//

import UIKit

extension UILabel {
    
    func formatAndShowDate(dateString: String?, formatString: String) {
        guard let string = dateString else { return }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        if let date = formatter.date(from: string) {
            let stringFormatter = DateFormatter()
            stringFormatter.dateFormat = formatString
            self.text = "Release: \(stringFormatter.string(from: date))"
        }
        
    }
    
}