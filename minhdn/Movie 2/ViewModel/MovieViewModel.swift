//
//  MovieViewModel.swift
//  Movie 2
//
//  Created by MinhDev on 9/14/21.
//

import Foundation
enum ListType: String{
    case AllMovie
    case HighestRated
    case NowPlaying
    case Popular
    case Upcoming
}

protocol ViewModelDelegate: class {
    func reloadTable(movieArr:[[String:[MovieDataModel]]])
}
class MoviesViewModel {
    
    var moviesVM = [[String:[MovieDataModel]]]()
    weak var delegate: ViewModelDelegate?
    
    func getMovies(type:ListType)  {
        
        switch type {
            case .AllMovie:
                MovieDataRequest.shared.getAllMovie { [unowned self] (details) in
                    self.delegate?.reloadTable(movieArr:[["All Movie": details]])
                }
                break
                
            case .HighestRated:
                MovieDataRequest.shared.getHighestRatedMovies { [unowned self] (details) in
                    self.delegate?.reloadTable(movieArr: [["HighestRated": details]])
                
                }
                
                break
            
            case .NowPlaying:
                MovieDataRequest.shared.getNowPlayingMovies { [unowned self] (details) in
                    self.delegate?.reloadTable(movieArr:  [["NowPlaying": details]])
                    print(details)
                }
                break
            
            case .Popular:
                MovieDataRequest.shared.getPopularMovies() { [unowned self] (details) in
                    self.delegate?.reloadTable(movieArr:  [["Popular": details]])
                }
                break
            
            case .Upcoming:
                MovieDataRequest.shared.getUpcomingMovies()  { [unowned self] (details) in
                    self.delegate?.reloadTable(movieArr: [["Upcoming": details]])
                }
                break
        }
    }
}
