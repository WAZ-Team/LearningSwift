//
//  MovieDataModel.swift
//  Movie 2
//
//  Created by MinhDev on 7/9/21.
//

import Foundation

 struct MovieDataModel: Codable{
    public var adult: Bool?
    public var backdroppath: String?
    public var genreids: [Int]?
    public var id: Int?
    public var Mediatype : String?
    public var OriginalLanguage : String?
    public var OriginalTitle : String?
    public var overview : String?
    public var popularity : Double?
    public var Posterpath : String?
    public var ReleaseDate : String?
    public var title : String?
    public var video: Bool?
    public var VoteAverage: Double?
    public var VoteCount: Int?
    public var duration: String = String(Int.random(in: 90..<150))
    
     enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case backdroppath = "backdrop_path"
        case genreids = "genre_ids"
        case id = "id"
        case Mediatype = "media_type"
        case OriginalLanguage = "original_language"
        case OriginalTitle = "original_title"
        case overview = "overview"
        case popularity = "popularity"
        case Posterpath = "poster_path"
        case ReleaseDate = "release_date"
        case title = "title"
        case video = "video"
        case VoteAverage = "vote_average"
        case VoteCount = "vote_count"
    }
   
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        adult = try values.decodeIfPresent(Bool.self, forKey: .adult)
        backdroppath = try values.decodeIfPresent(String.self, forKey: .backdroppath)
        genreids = try values.decodeIfPresent([Int].self, forKey: .genreids)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        Mediatype = try values.decodeIfPresent(String.self, forKey: .Mediatype)
        OriginalLanguage = try values.decodeIfPresent(String.self, forKey: .OriginalTitle)
        OriginalTitle = try values.decodeIfPresent(String.self, forKey: .OriginalTitle)
        overview = try values.decodeIfPresent(String.self, forKey: .overview)
        popularity = try values.decodeIfPresent(Double.self, forKey: .popularity)
        Posterpath = try values.decodeIfPresent(String.self, forKey: .Posterpath)
        ReleaseDate = try values.decodeIfPresent(String.self, forKey: .ReleaseDate)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        video = try values.decodeIfPresent(Bool.self, forKey: .video)
        VoteAverage = try values.decodeIfPresent(Double.self, forKey: .VoteAverage)
        VoteCount = try values.decodeIfPresent(Int.self, forKey: .VoteCount)
    }
    
 

    func posterImageUrl() -> String? {
        if let posterPath = Posterpath {
            return "\(Constants.POSTER_BASE_URL)\(posterPath)"
        }
        return nil
    }
    
    func backDropImageUrl() -> String? {
        if let backdropPath = backdroppath {
            return "\(Constants.BACK_DROP_BASE_URL)\(backdropPath)"
        }
        return nil
    }

 }

