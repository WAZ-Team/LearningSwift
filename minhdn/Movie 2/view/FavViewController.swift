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
    @IBOutlet private weak var favCollectionview: UICollectionView!
    
    //  MARK:-  Variables
    var moviedata = [MovieDataModel]()
    var favoritedataa = [Favorite]()
    weak var favmovieDelegate:SelectedMoviefavoriteDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Favorite"
        favCollectionview.topAnchor.constraint(equalTo: view.topAnchor, constant: 40.0).isActive = true
        favCollectionview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10.0).isActive = true
        favCollectionview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -20.0).isActive = true
        favCollectionview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20.0).isActive = true
        favCollectionview.delegate = self
        favCollectionview.dataSource =  self
        self.favCollectionview.register(UINib(nibName: Constants.homeCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: Constants.homeCollectionViewCell)
    }
    //  MARK:-  Config
    
    func getFavorite() -> [Favorite]{
        let realm = try! Realm()
        let user = realm.objects(Favorite.self).toArray(ofType: Favorite.self)
        var listData:[Favorite] = [Favorite]()
        for item in user{
            if item.fav == true{
                listData.append(item)
            }
        }
        return listData
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        moviedata = APIService.load("Movie.json")
        //        self.favoritedata.removeAll()
        self.favoritedataa = self.getFavorite()
        print(favoritedataa)
        favCollectionview.reloadData()
        tabBarController?.tabBar.isHidden = false
        
    }
    
}
//  MARK:   - DataSource
extension FavViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favoritedataa.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.favCollectionview.dequeueReusableCell(withReuseIdentifier: Constants.homeCollectionViewCell, for: indexPath) as? HomeCollectionViewCell else { return UICollectionViewCell() }
        cell.imageHomeCell.downloaded(from: favoritedataa[indexPath.row].Posterpath )
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
        return CGSize(width: view.bounds.width/2.1 - 40  , height: view.bounds.height/4.2)
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
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.favmovieDelegate?.didSelectMovie(movie: favoritedataa[indexPath.row])
    }
}

protocol SelectedMoviefavoriteDelegate: class {
    func didSelectMovie(movie:Favorite)
}

extension FavViewController: SelectedMoviefavoriteDelegate{
    func didSelectMovie(movie: Favorite) {
        self.favoritedataa = [movie]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: Constants.detaiViewController) as? DetaiViewController else{return}
//        vc.getfav = favoritedataa
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

