//
//  TabBarItemTag.swift
//  Movie 2
//
//  Created by MinhDev on 7/23/21.
//

import Foundation

enum TabBarItemTag: String, CaseIterable {
    case home, favor, find, me

    var title: String {
        return rawValue.capitalized
    }
    
    var image: String {
        return rawValue
    }
    
    var selectedImage: String {
        return "\(rawValue)_1"
    }
}
