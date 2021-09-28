//
//  FavoriteViewModeol.swift
//  Movie 2
//
//  Created by MinhDev on 9/28/21.
//

import Foundation
protocol FavoriteDelegate: class {
    func reloadTable(movieArr:[MovieDataModel])
}
class FavoriteViewModel {
    private var favoriteData = [MovieDataModel]
    weak var delegate: FavoriteDelegate?
    func getFavoriteMovie(){
        MovieDataRequest.shadred.getAllMovie { (details) in
            de
        }
    }
}
