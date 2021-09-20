//
//  UserData.swift
//  Movie 2
//
//  Created by MinhDev on 7/28/21.
//


import Foundation
import RealmSwift

class UserData: Object {
    @objc dynamic var fistname: String = ""
    @objc dynamic var lastname: String = ""
    @objc dynamic var username: String = ""
    @objc dynamic var password: String = ""
    override static func primaryKey() -> String? {
        "username"
    }
}
 


