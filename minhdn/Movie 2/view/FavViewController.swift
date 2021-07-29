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
//    var movidata =
    let favdata = Favorite()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Favorite"
        favCollectionview.delegate = self
        favCollectionview.dataSource =  self
        self.favCollectionview.register(UINib(nibName: Constants.homeCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: Constants.homeCollectionViewCell)
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
//  MARK:   - DataSource
extension FavViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favdata.Posterpath.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.favCollectionview.dequeueReusableCell(withReuseIdentifier: Constants.homeCollectionViewCell, for: indexPath) as? HomeCollectionViewCell else { return UICollectionViewCell() }
        cell.imageHomeCell.downloaded(from: favdata.Posterpath)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        cell.layer.cornerRadius = 20.0
        cell.clipsToBounds = true
        cell.layer.borderWidth = 3.0
    }
}
    // MARK: - UICollectionViewDelegateFlowLayout
extension FavViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width/3.2 , height: view.bounds.height/3)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0)
    }
}
//  MARK:   - Delegate
extension FavViewController: UICollectionViewDelegate{
    
}
