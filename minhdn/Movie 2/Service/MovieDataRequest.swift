//
//  MovieDataRequest.swift
//  Movie 2
//
//  Created by MinhDev on 9/15/21.
//

import Foundation
public struct MovieDataRequest{
    
    static let shared = MovieDataRequest()
    var movieRequest :  [MovieDataModel] = APIService.load("Movie.json")
//   typealias completion = MovieDataModel
    
    func getAllMovie( completionHandler:@escaping ([MovieDataModel]) -> Void ){
        var listMovieRequest = [MovieDataModel]()
        for item in movieRequest{
                        listMovieRequest.append(item)
                       }
        completionHandler(listMovieRequest)
        
    }
    
    func getHighestRatedMovies(completionHandler:@escaping ([MovieDataModel]) -> Void){
        var listMovieRequest = [MovieDataModel]()
        for item in movieRequest{
            for item1 in item.genreids ?? [] {
                       if item1 == 28{
                        listMovieRequest.append(item)
                       }
                   }
               }
        completionHandler(listMovieRequest)
    }
    
    func getNowPlayingMovies( completionHandler:@escaping ([MovieDataModel]) -> Void){
        var listMovieRequest = [MovieDataModel]()
        listMovieRequest.removeAll()
        for item in movieRequest{
            for item1 in item.genreids ?? [] {
                       if item1 == 35{
                        listMovieRequest.append(item)
                       }
                   }
               }
        completionHandler(listMovieRequest)
    }
    
    func getPopularMovies(completionHandler:@escaping ([MovieDataModel]) -> Void){
        var listMovieRequest = [MovieDataModel]()
        listMovieRequest.removeAll()
        for item in movieRequest{
            for item1 in item.genreids ?? [] {
                       if item1 == 878{
                        listMovieRequest.append(item)
                       }
                   }
               }
        completionHandler(listMovieRequest)
    }
    
    func getUpcomingMovies(completionHandler:@escaping ([MovieDataModel]) -> Void){
        var listMovieRequest = [MovieDataModel]()
        listMovieRequest.removeAll()
        for item in movieRequest{
            for item1 in item.genreids ?? [] {
                       if item1 == 12{
                        listMovieRequest.append(item)
                       }
                   }
               }
        completionHandler(listMovieRequest)
    }
}
