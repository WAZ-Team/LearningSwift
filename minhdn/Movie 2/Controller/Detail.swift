//
//  Favorite.swift
//  Movie 2
//
//  Created by MinhDev on 7/28/21.
//

import Foundation
import RealmSwift

extension DetaiViewController{
    
    @objc func onfav() {
        if favdata.fav == false {
            do {
                let realm = try Realm()
                try realm.write {
                    self.favdata.fav = true
                    realm.add(self.favdata, update: .all)
                    
                }
                print("Data saved successfully!")
                print(Realm.Configuration.defaultConfiguration.fileURL!)
                let ac = UIAlertController(title: "Conguarate!", message: "Your preferences have been saved.", preferredStyle: .actionSheet)
                ac.addAction(UIAlertAction(title: "OK", style: .default))
                present(ac, animated: true)
                
            } catch {
                print("Error: \(error)")
            }
        }else{
            do {
                let realm = try Realm()
                try realm.write {
                    self.favdata.fav = false
                    realm.add(self.favdata, update: .all)
                   
                }
                print("Data saved successfully!")
                print(Realm.Configuration.defaultConfiguration.fileURL!)
                let ac = UIAlertController(title: "Conguarate!", message: "Your preferences have been saved.", preferredStyle: .actionSheet)
                ac.addAction(UIAlertAction(title: "OK", style: .default))
                present(ac, animated: true)
                
            } catch {
                print("Error: \(error)")
            }
        }
    }
    
    func setupViews(movie: MovieDataModel?){
        coverImage.downloaded(from: movie?.backdroppath ?? "")
        movieTitle.text = movie?.title?.uppercased()
        rateBar.value = CGFloat((movie?.VoteAverage!)!/2)
        overView.text = movie?.overview
//       let subStr =  movie?.ReleaseDate!.prefix(4)
        
    }
    
    func setupNavigationBar(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        title = movieData?.title
        self.navigationController?.navigationItem.backButtonTitle = "Home"
    }
}
