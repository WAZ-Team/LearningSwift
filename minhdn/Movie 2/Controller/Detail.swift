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
                    realm.add(favdata)
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
                    realm.add(favdata)
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
}
