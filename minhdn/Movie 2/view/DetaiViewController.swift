//
//  detaiViewController.swift
//  Movie 2
//
//  Created by MinhDev on 7/16/21.
//

import UIKit
import HCSStarRatingView
import RealmSwift
class DetaiViewController: UIViewController {
    //    MARK: - Outlet
    
    @IBOutlet weak var coverView: UIView!
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var addbut: UIButton!
    @IBOutlet weak var sharebut: UIButton!
    @IBOutlet weak var rateBar: HCSStarRatingView!
    @IBOutlet weak var ReleaseDate: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var overView: UILabel!
    @IBOutlet weak var screenShort: UILabel!
    @IBOutlet weak var movieDifference: UICollectionView!
    @IBOutlet weak var coverImage: UIImageView!
    
    //  MARK: - Variables
    var delegateView =  HomeTableViewCell()
    var allMovie: [MovieDataModel] = [MovieDataModel]()
    var movieData: MovieDataModel?
    var favdata = Favorite()
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = true
        movieDifference.delegate = self
        movieDifference.dataSource = self
        allMovie = APIService.load("Movie.json")
        self.movieDifference.register(UINib(nibName: Constants.homeCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: Constants.homeCollectionViewCell)
        addbut.addTarget(self, action: #selector(onfav), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupViews(movie: movieData)
        setupNavigationBar()
        self.coverImage = coverImage.roundImage
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
//        movieData.removeAll()
    }
}

//  MARK: - DataSource
extension DetaiViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allMovie.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.movieDifference.dequeueReusableCell(withReuseIdentifier: Constants.homeCollectionViewCell, for: indexPath) as? HomeCollectionViewCell else { return UICollectionViewCell() }
        cell.imageHomeCell.downloaded(from: allMovie[indexPath.row].backdroppath ?? "" )
        return cell
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension DetaiViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.size.width/2.4, height: view.bounds.size.height/1.1)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}




