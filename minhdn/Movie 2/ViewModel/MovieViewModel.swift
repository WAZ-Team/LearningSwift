//
//  MovieViewModel.swift
//  Movie 2
//
//  Created by MinhDev on 9/14/21.
//

import Foundation
enum ListType: String,CaseIterable{
    case allMovie
    case highestRated
    case nowPlaying
    case popular
    case upComing
    
    func getTitle() -> String {
        switch self {
        case .allMovie:
            return ""
        case .highestRated:
            return ""
        case .nowPlaying:
            return ""
        case .popular:
            return ""
        case .upComing:
            return ""
        }
    }
}

protocol ViewModelDelegate: class {
    func reloadTable(movieArr:[ListType:[MovieDataModel]])
}
class MoviesViewModel {
    
    
    weak var delegate: ViewModelDelegate?
    
    func getMovies(type:ListType)  {
        let group = DispatchGroup()
        var moviesVM = [ListType:[MovieDataModel]]()
        switch type {
            case .allMovie:
                group.enter()
                MovieDataRequest.shared.getAllMovie { (details) in
                    moviesVM = [.allMovie : details]
                    group.leave()
                }
                
            case .highestRated:
                group.enter()
                MovieDataRequest.shared.getHighestRatedMovies { (details) in
                    moviesVM = [.highestRated: details]
                    group.leave()
                }

            
            case .nowPlaying:
                group.enter()
                MovieDataRequest.shared.getNowPlayingMovies { (details) in
                    moviesVM = [.nowPlaying: details]
                    group.leave()
                }
            
            case .popular:
                group.enter()
                MovieDataRequest.shared.getPopularMovies() { (details) in
                    moviesVM = [.popular: details]
                    group.leave()
                }
               
            
            case .upComing:
                group.enter()
                MovieDataRequest.shared.getUpcomingMovies()  { (details) in
                    moviesVM = [.upComing: details]
                    group.leave()
                }
                
        }
        group.notify(queue: .main) {
            self.delegate?.reloadTable(movieArr: moviesVM)
        }
    }
}
