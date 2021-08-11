//
//  FavViewController.swift
//  Movie 2
//
//  Created by MinhDev on 7/21/21.
//

import UIKit
import RealmSwift
class FavViewController: UIViewController {
    //  MARK:-  OutLet
    @IBOutlet weak var favCollectionview: UICollectionView!

    //  MARK:-  Variables
    var favoritedata = Favorite()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Favorite"
        favCollectionview.delegate = self
        favCollectionview.dataSource =  self
        self.favCollectionview.register(UINib(nibName: Constants.homeCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: Constants.homeCollectionViewCell)
    }
    //  MARK:-  Config
    
    func getFavorite() -> Favorite{
        let realm = try! Realm()
        let user:Results<Favorite> = realm.objects(Favorite.self)
        let listData:Favorite = Favorite()
        for item in user{
            if item.fav == true{
                listData.title = item.title
                listData.Posterpath = item.Posterpath
                listData.id = item.id
                listData.fav = item.fav
            }
        }
        return listData
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.favoritedata = self.getFavorite()
        print(favoritedata)
        favCollectionview.reloadData()
       
        
    }
    
}
//  MARK:   - DataSource
extension FavViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favoritedata.title.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.favCollectionview.dequeueReusableCell(withReuseIdentifier: Constants.homeCollectionViewCell, for: indexPath) as? HomeCollectionViewCell else { return UICollectionViewCell() }
        cell.imageHomeCell.downloaded(from: favoritedata.Posterpath )
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
        return CGSize(width: view.bounds.width/2 - 40  , height: view.bounds.height/3.2)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
}
//  MARK:   - Delegate
extension FavViewController: UICollectionViewDelegate{
    
}
