//
//  MovieDataRequest.swift
//  Movie 2
//
//  Created by MinhDev on 9/15/21.
//

import Foundation
public struct MovieDataRequest{
    
    static let shared = MovieDataRequest()
    func getHighestRatedMovies(_ handler:@escaping ([MovieDataModel?]) -> Void){
        var arr = [MovieDataModel]()
        for item in arr{
            for item1 in item.genreids ?? [] {
                       if item1 == 28{
                           arr.append(item)
                       }
                   }
               }
    }
    func getNowPlayingMovies(_ handler:@escaping ([MovieDataModel?]) -> Void){
        var arr = [MovieDataModel]()
        for item in arr{
            for item1 in item.genreids ?? [] {
                       if item1 == 28{
                           arr.append(item)
                       }
                   }
               }
    }
    func getPopularMovies(_ handler:@escaping ([MovieDataModel?]) -> Void){
        var arr = [MovieDataModel]()
        for item in arr{
            for item1 in item.genreids ?? [] {
                       if item1 == 28{
                           arr.append(item)
                       }
                   }
               }
    }
    func getUpcomingMovies(_ handler:@escaping ([MovieDataModel?]) -> Void){
        var arr = [MovieDataModel]()
        for item in arr{
            for item1 in item.genreids ?? [] {
                       if item1 == 28{
                           arr.append(item)
                       }
                   }
               }
    }
}
