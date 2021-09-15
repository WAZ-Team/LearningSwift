//
//  MovieViewModel.swift
//  Movie 2
//
//  Created by MinhDev on 9/14/21.
//

import Foundation
enum ListType: String{
    case Popular
    case HighestRated
    case Upcoming
    case NowPlaying
}

protocol ViewModelDelegate: class {
    func reloadTable(movieArr:[MovieDataModel])
}
class MoviesViewModel {
    
//    var movies = [[String:[MovieDataModel]]]()
    var movies = [MovieDataModel]()
    var movieHeader = [String]()
    weak var delegate: ViewModelDelegate?
    
    func getMovies(type:ListType)  {
        
        switch type {
      
            case .HighestRated:
                var arr = [MovieDataModel]()
                for item in arr{
                    for item1 in item.genreids ?? [] {
                               if item1 == 28{
                                   arr.append(item)
                               }
                           }
                       }
                break
            
            case .NowPlaying:
                var arr = [MovieDataModel]()
                for item in arr{
                    for item1 in item.genreids ?? [] {
                               if item1 == 28{
                                   arr.append(item)
                               }
                           }
                       }
                break
            
            case .Popular:
                var arr = [MovieDataModel]()
                for item in arr{
                    for item1 in item.genreids ?? [] {
                               if item1 == 28{
                                   arr.append(item)
                               }
                           }
                       }
                break
            
            case .Upcoming:
                var arr = [MovieDataModel]()
                for item in arr{
                    for item1 in item.genreids ?? [] {
                               if item1 == 28{
                                   arr.append(item)
                               }
                           }
                       }
                break
        }
    }
}
