//
//  detaiViewController.swift
//  Movie 2
//
//  Created by MinhDev on 7/16/21.
//

import UIKit
import HCSStarRatingView
class DetaiViewController: UIViewController {
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
    @IBOutlet weak var movieDifference: UICollectionView!
    @IBOutlet weak var coverImage: UIImageView!
    //  MARK: - Variables
    var delegateView =  HomeTableViewCell()
    private var moviesdata: [MovieDataModel] = [] {
        didSet{
            movieDifference.reloadData()
        }
    }
    var movieData: MovieDataModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        movieDifference.delegate = self
        movieDifference.dataSource = self
        self.movieDifference.register(UINib(nibName: Constants.homeCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: Constants.homeCollectionViewCell)
       setupViews(movie: movieData)
       setupNavigationBar()
        setupViews(movie: movieData)
        self.coverImage = coverImage.roundImage
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

//  MARK: - DataSource
extension DetaiViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.movieDifference.dequeueReusableCell(withReuseIdentifier: Constants.homeCollectionViewCell, for: indexPath) as? HomeCollectionViewCell else { return UICollectionViewCell() }
        cell.imageHomeCell.downloaded(from: movieData?.backdroppath ?? "" )
        return cell
      
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}

//  MARK:   - Delegate
extension DetaiViewController: UICollectionViewDelegate{
    
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




