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
    
    @IBOutlet private weak var coverView: UIView?
    @IBOutlet private weak var addbut: UIButton?
    @IBOutlet private weak var sharebut: UIButton?
    @IBOutlet private weak var rateBar: HCSStarRatingView!
    @IBOutlet private weak var ReleaseDate: UILabel?
    @IBOutlet private weak var movieTitle: UILabel?
    @IBOutlet weak var overView: UITextView!
    @IBOutlet private weak var coverImage: UIImageView?
    
    //  MARK: - Variables
    var delegateView =  HomeTableViewCell()
    var allMovie: [MovieDataModel] = [MovieDataModel]()
    var movieData: MovieDataModel?
    var favData = Favorite()
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = true
        addbut?.addTarget(self, action: #selector(onfav), for: .touchUpInside)
        sharebut?.addTarget(self, action: #selector(functionShare), for: .touchUpInside)
        self.favData = self.getDataFavorite()
        rateBar?.addTarget(self, action: #selector(changeRateBar), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupViews(movie: movieData)
        setupNavigationBar()
        self.coverImage = coverImage?.roundImage
        setupRateBar()
    }
    //  MARK:   -   Config
    func setupRateBar() {
        rateBar.maximumValue = 10
        rateBar.minimumValue = 0
        rateBar.allowsHalfStars = true
        rateBar.backgroundColor = UIColor(red: 0.91, green: 0.96, blue: 1.00, alpha: 1.00)
        self.rateBar?.value = CGFloat(favData.VoteAverage)
    }
    
    func setupViews(movie: MovieDataModel?){
        coverImage?.downloaded(from: movie?.backdroppath ?? "")
        movieTitle?.text = movie?.title?.uppercased()
        overView?.text = movie?.overview
        ReleaseDate?.formatAndShowDate(dateString: movie?.ReleaseDate, formatString: "MMM dd YYYY")
    }
    //    MARK: -   Rate
    @objc func changeRateBar() {
        let realm = try! Realm()
        try! realm.write {
            self.favData.VoteAverage = Double(self.rateBar.value)
            realm.add(favData, update: .all)
        }
    }
}
