//
//  MovieViewModel.swift
//  Movie 2
//
//  Created by MinhDev on 9/14/21.
//

import Foundation

enum ListType : String, CaseIterable {
    case allMovie
    case highestRated
    case nowPlaying
    case popular
    case upComing
    
    func getTitle() -> String {
        switch self {
        case .allMovie:
            return "All Movie"
        case .highestRated:
            return "Highest Rated"
        case .nowPlaying:
            return "Now Playing"
        case .popular:
            return "Popular"
        case .upComing:
            return "Up Coming"
        }
    }
}

protocol ViewModelDelegate: class {
    func reloadTable(movieArr:[ListType:[MovieDataModel]])
}
class MoviesViewModel {
    
    weak var delegate: ViewModelDelegate?
    
    func getMovies()  {
        let group = DispatchGroup()
        var moviesVM = [ListType:[MovieDataModel]]()
        
        for type in ListType.allCases {
            switch type {
                case .allMovie:
                   group.enter()
                    MovieDataRequest.shared.getAllMovie { (details) in
                        moviesVM.updateValue(details, forKey: .allMovie)
                        group.leave()
                    }
                    
                case .highestRated:
                    group.enter()
                    MovieDataRequest.shared.getHighestRatedMovies { (details) in
                        moviesVM.updateValue(details, forKey: .highestRated)
                        group.leave()
                    }

                
                case .nowPlaying:
                    group.enter()
                    MovieDataRequest.shared.getNowPlayingMovies { (details) in
                        moviesVM.updateValue(details, forKey: .nowPlaying)
                        group.leave()
                    }
                
                case .popular:
                    group.enter()
                    MovieDataRequest.shared.getPopularMovies() { (details) in
                        moviesVM.updateValue(details, forKey: .popular)
                        group.leave()
                    }
                   
                
                case .upComing:
                    group.enter()
                    MovieDataRequest.shared.getUpcomingMovies()  { (details) in
                        moviesVM.updateValue(details, forKey: .upComing)
                        group.leave()
                    }
                    
            }
        }
        
        group.notify(queue: .main) {
            self.delegate?.reloadTable(movieArr: moviesVM)
        }
    }
}
