//
//  Favorite.swift
//  Movie 2
//
//  Created by MinhDev on 7/28/21.
//

import Foundation
import RealmSwift

extension DetaiViewController{
    //  MARK:   -   Get Favorite Data
    
    func getDataFavorite() -> Favorite{
        let realm = try! Realm()
        let user = realm.objects(Favorite.self).toArray(ofType: Favorite.self)
        let listData:Favorite = Favorite()
        for item in user{
            if item.id == self.movieData?.id{
                listData.id = movieData?.id ?? 0
                listData.fav = item.fav
                listData.VoteAverage = item.VoteAverage
            }else{
                listData.id = movieData?.id ?? 0
            }
        }
        return listData
    }
    
    //  MARK:   -   Add Favorite
    @objc func onfav() {
        if self.favData.fav == false{
            let realm = try! Realm()
            try! realm.write {
                self.favData.fav = true
                self.favData.id = self.favData.id
                realm.add(favData, update: .all)
                print(favData)
            }
            print("Data saved successfully!")
            let ac = UIAlertController(title: "Favorite!", message: "I Like It.", preferredStyle: .actionSheet)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }else{
            let realm = try! Realm()
            try! realm.write {
                self.favData.fav = false
                realm.add(favData, update: .all)
            }
            print("Data saved successfully!")
            print(Realm.Configuration.defaultConfiguration.fileURL!)
            let ac = UIAlertController(title: "Favorite!", message: "Opp! Your movie has not been saved", preferredStyle: .actionSheet)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }
    
    // MARK:    -   Config
    func setupNavigationBar(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        title = movieData?.title
        self.navigationController?.navigationItem.backButtonTitle = "Home"
    }
    
    //  MARK:   - Share
    @objc func functionShare() {
        if let name = URL(string: Constants.BACK_DROP_BASE_URL + "\(movieData?.Posterpath ?? "")"), !name.absoluteString.isEmpty {
            let objectsToShare = [name]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            self.present(activityVC, animated: true, completion: nil)
        }else {
            print("error")
        }
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
