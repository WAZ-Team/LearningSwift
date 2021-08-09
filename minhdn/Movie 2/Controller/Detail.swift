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
                    self.favdata.title = self.movieData?.title ?? ""
                    self.favdata.Posterpath = self.movieData?.Posterpath ?? ""
                    realm.add(self.favdata, update: .all)
                   
                }
//                self.favdata.Posterpath = self.movieData?.Posterpath ?? ""
                print("Data saved successfully!")
                print(Realm.Configuration.defaultConfiguration.fileURL!)
                let ac = UIAlertController(title: "Favorite!", message: "Your movie have been saved.", preferredStyle: .actionSheet)
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
                let ac = UIAlertController(title: "Favorite!", message: "Opp! Your movie has not been saved", preferredStyle: .actionSheet)
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
extension Results {
    func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for i in 0 ..< count {
            if let result = self[i] as? T {
                array.append(result)
            }
        }
        return array
    }
}
