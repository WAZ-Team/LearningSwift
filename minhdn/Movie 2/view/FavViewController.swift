//
//  FavViewController.swift
//  Movie 2
//
//  Created by MinhDev on 7/21/21.
//

import UIKit
import RealmSwift
class FavViewController: UIViewController {

    @IBOutlet weak var favCollectionview: UICollectionView!
    let favdata = Favorite()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Favorite"
    }
    func getFaviroteSaved() -> [Favorite]{
        let realmObject = try! Realm()
        let userList = realmObject.objects(Favorite.self)
        var listData:[Favorite] = [Favorite]()
        for item in userList{
            if item.fav == true{
                listData.append(item)
            }
        }
        return listData
    }

  
}
