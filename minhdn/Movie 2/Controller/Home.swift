//
//  Home.swift
//  Movie 2
//
//  Created by MinhDev on 8/19/21.
//

import Foundation
import UIKit
 
extension HomeMovieViewControllers{
     func navigationSearch(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        title = "Movie TV"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(tapSearch))
    }
    @objc func tapSearch(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: Constants.seachViewController) as? SeachViewController else {return}
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

