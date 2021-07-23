//
//  HomeTableViewCell.swift
//  Movie 2
//
//  Created by MinhDev on 7/9/21.
//

import UIKit



class HomeTableViewCell: UITableViewCell {
    // MARK: - IBOutlets
    @IBOutlet private weak var homeCollectionview: UICollectionView!

    // MARK: - Variables
   weak var movieDelegate:SelectedMovieDelegate?
    
    private var movies: [MovieDataModel] = [] {
        didSet{
            
            homeCollectionview.reloadData()
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        homeCollectionview.delegate = self
        homeCollectionview.dataSource = self
        self.homeCollectionview.register(UINib(nibName: Constants.homeCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: Constants.homeCollectionViewCell)
        guard AppDelegate.isDark else { return }
        homeCollectionview.backgroundColor = UIColor.black
    }
    
}

// MARK: - Config
extension HomeTableViewCell {
    func configure(movies: [MovieDataModel]) {
        self.movies = movies
    }
}
// MARK: - Delegate

//extension HomeMovie: UICollectionViewDelegate {
//   
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        navigateToDetailsViewController(indexPath: indexPath)
//    }
//    func navigateToDetailsViewController (indexPath: IndexPath) {
//        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "detaiViewController") as! detaiViewController
//        detailController.movies = self.selectedMovie[indexPath.row]
//        self.navigationController!.pushViewController(detailController, animated: true)
//    }
// 
//}

extension HomeTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            self.movieDelegate?.didSelectMovie(movie: movies[indexPath.row])
    }
}

protocol SelectedMovieDelegate: class {
    func didSelectMovie(movie:MovieDataModel)

}

// MARK: - DataSource
extension HomeTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.homeCollectionview.dequeueReusableCell(withReuseIdentifier: Constants.homeCollectionViewCell, for: indexPath) as? HomeCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(model: movies[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        let radius = cell.contentView.layer.cornerRadius
//        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: radius).cgPath
        cell.layer.cornerRadius = 10.0
        cell.clipsToBounds = true
        cell.layer.borderWidth = 1.0
//       cell.translatesAutoresizingMaskIntoConstraints = false
    }
    
}
// MARK: - UICollectionViewDelegateFlowLayout
extension HomeTableViewCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: contentView.bounds.size.width/2.4, height: contentView.bounds.size.height/1.2)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets.init(top: 8, left: 8, bottom: 8, right: 8)
//    }
}
