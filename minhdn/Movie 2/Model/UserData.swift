//
//  UserData.swift
//  Movie 2
//
//  Created by MinhDev on 7/28/21.
//


import Foundation
import RealmSwift

class UserData: Object {
    
    @objc dynamic var mail: String = ""
    @objc dynamic var password: String = ""
    
}
