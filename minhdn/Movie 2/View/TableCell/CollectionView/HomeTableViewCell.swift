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
    
    private var moviesTBVC = [MovieDataModel]() {
        didSet{
            homeCollectionview.reloadData()
        }
    }
    
    func configure(viewModel: [MovieDataModel]) {
        moviesTBVC = viewModel
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = UIColor(red: 0.91, green: 0.96, blue: 1.00, alpha: 1.00)
        homeCollectionview.delegate = self
        homeCollectionview.dataSource = self
        self.homeCollectionview.register(UINib(nibName: Constants.homeCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: Constants.homeCollectionViewCell)
    }
}

    // MARK: - Delegate

extension HomeTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.movieDelegate?.didSelectMovie(movie: moviesTBVC[indexPath.row])
    }
}

protocol SelectedMovieDelegate: class {
    func didSelectMovie(movie:MovieDataModel)
}

    // MARK: - DataSource
extension HomeTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesTBVC.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.homeCollectionview.dequeueReusableCell(withReuseIdentifier: Constants.homeCollectionViewCell, for: indexPath) as? HomeCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(model: moviesTBVC[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.layer.cornerRadius = 20.0
        cell.clipsToBounds = true
        cell.layer.borderWidth = 3.0
    }
    
}

    // MARK: - UICollectionViewDelegateFlowLayout
extension HomeTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: contentView.bounds.size.width/2.4 , height: contentView.bounds.size.height/1.2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
