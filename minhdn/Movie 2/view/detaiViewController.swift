//
//  detaiViewController.swift
//  Movie 2
//
//  Created by MinhDev on 7/16/21.
//

import UIKit
import HCSStarRatingView
class detaiViewController: UIViewController {
    //    MARK: - Outlet
    
    @IBOutlet weak var coverView: UIView!
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var addbut: UIButton!
    @IBOutlet weak var sharebut: UIButton!
    @IBOutlet weak var rateBar: HCSStarRatingView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var overView: UILabel!
    //    @IBOutlet weak var timeduration: UILabel!
    //    @IBOutlet weak var lenghtlabel: UILabel!
    //    @IBOutlet weak var contrylabel: UILabel!
    //    @IBOutlet weak var contryval: UILabel!
    //    @IBOutlet weak var yearlabel: UILabel!
    //    @IBOutlet weak var yeatval: UILabel!
    @IBOutlet weak var screenShort: UILabel!
    @IBOutlet weak var scrShotCLV: UICollectionView!
    
    @IBOutlet weak var coverImage: UIImageView!
    //  MARK: - Variables
    var delegateView =  HomeTableViewCell()
    //    var movieData = [MovieDataModel]()
    
    var movies: MovieDataModel?
    var movieData: MovieDataModel?
    override func viewDidLoad() {
        super.viewDidLoad()
    movies =  APIService.load("Movie.json")
        setupNavigationBar()

    }
    
    
    func setupViews(movie: MovieDataModel?){
        coverImage.downloaded(from: movie?.backdroppath ?? "")
        movieTitle.text = movie?.title?.uppercased()
//        rateBar.value = CGFloat(movie?.VoteAverage!/2)
        overView.text = movie?.overview
//        let subStr =  movie.ReleaseDate!.prefix(4)
        
    }
    
    
    func setupNavigationBar(){
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationItem.backBarButtonItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .white
    }
}

//  MARK: - DataSource
extension detaiViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "screenshots", for: indexPath)
//        let image:UIImageView = cell.contentView.viewWithTag(1) as! UIImageView
//        image.downloaded(from: movieData[indexPath.row].backdroppath ?? "")
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}

//  MARK:   - Delegate






