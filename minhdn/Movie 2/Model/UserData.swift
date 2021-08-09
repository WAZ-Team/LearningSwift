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
 
class Favorite: Object{
    @objc dynamic var adult: Bool = false
    @objc dynamic var backdroppath: String = ""
    @objc dynamic var id: Int = 0
    @objc dynamic var Mediatype : String = ""
    @objc dynamic var OriginalLanguage : String = ""
    @objc dynamic var OriginalTitle : String = ""
    @objc dynamic var overview : String = ""
    @objc dynamic var Posterpath : String = ""
    @objc dynamic var ReleaseDate : String = ""
    @objc dynamic var title : String = ""
    @objc dynamic var video: Bool = true
//    @objc dynamic var VoteAverage: Double = 0.0
    @objc dynamic var VoteCount: Int = 0
    @objc dynamic var fav: Bool = false
    @objc dynamic var photo:NSData?
    override static func primaryKey() -> String? {
        "id"
    }
    func initLoad(_ json:  [String: Any]) -> Favorite{
        if let temp = json["adult"] as? Bool {adult = temp}
        if let temp = json["backdroppath"] as? String { backdroppath = temp }
        if let temp = json["Mediatype"] as? String { Mediatype = temp }
        if let temp = json["OriginalLanguage"] as? String { OriginalLanguage = temp }
        if let temp = json["OriginalTitle"] as? String { OriginalTitle = temp }
        if let temp = json["overview"] as? String { overview = temp }
        if let temp = json["Posterpath"] as? String { Posterpath = temp }
        if let temp = json["ReleaseDate"] as? String { ReleaseDate = temp }
        if let temp = json["title"] as? String { title = temp }
        if let temp = json["video"] as? Bool { video = temp }
//        if let temp = json["VoteAverage" ] as? Double {VoteAverage = temp }
        return self
    }
}

struct Search: Decodable {
   let adult: Bool?
    let backdroppath: String?
    let genreids: [Int]?
    let id: Int?
    let Mediatype : String?
    let OriginalLanguage : String?
    let OriginalTitle : String?
    let overview : String?
    let popularity : Double?
    let Posterpath : String?
    let ReleaseDate : String?
    let title : String?
    let video: Bool?
    let VoteAverage: Double?
    let VoteCount: Int?
}
