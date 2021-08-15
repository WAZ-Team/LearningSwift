//
//  Favorite.swift
//  Movie 2
//
//  Created by MinhDev on 8/12/21.
//

import Foundation
import RealmSwift

class Favorite: Object{
    @objc dynamic var id: Int = 0
    @objc dynamic var VoteAverage: Double = 0
    @objc dynamic var fav: Bool = false
    override static func primaryKey() -> String? {
        "id"
    }
    func initLoad(_ json:  [String: Any]) -> Favorite{
        if let temp = json["VoteAverage"] as? Double { VoteAverage = temp }
        if let temp = json["fav"] as? Bool { fav = temp }
        if let temp = json["id"] as? Int { id = temp }
        return self
    }
}

