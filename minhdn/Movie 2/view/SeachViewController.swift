//
//  SeachViewController.swift
//  Movie 2
//
//  Created by MinhDev on 7/21/21.
//

import UIKit

class SeachViewController: UIViewController {
//  MARK:   - Outlet
    
    
    @IBOutlet weak var collectionView: UICollectionView!
//  MARK: - Variables
    private var timer:Timer?
    // Controls if the list is loading more items
    private var isLoadingMore = false

    // Controls the Scroll's last position
    private var lastOffset: CGFloat = 0.0
    
    let searchController = UISearchController()
    var data = String()
    var movieData = [MovieDataModel]()
//    var data = [MovieDataModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        movieData = APIService.load("Movie.json")
//        guard AppDelegate.isDark else { return }
//        view.backgroundColor = UIColor.black
        
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        definesPresentationContext = true
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
        self.collectionView.register(UINib(nibName: Constants.homeCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: Constants.homeCollectionViewCell)
    }
    
  
}
// MARK: - UISearchResultsUpdating
extension SeachViewController:UISearchResultsUpdating{
    
    func updateSearchResults(for searchController: UISearchController) {
        triggerRequestForText(searchController.searchBar.text)
    }
    
    /// Triggers the timer to execute the filtering
    private func triggerRequestForText(_ term:String?){
        guard let text = term, !text.isEmpty else{
            return
        }
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) { [weak self] _ in
            print("Filtering movie with name: \(text)...")
            self?.data = text
//            self?.presenter.searchTerm = text
//            self?.presenter.getMovies()
        }
    }
}
extension SeachViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.isEmpty == false {
//            data = movieData.filter({ $0.title(searchText) })
        }
        
        collectionView.reloadData()
    }
}

extension SeachViewController: UICollectionViewDelegate{
    
}
extension SeachViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: Constants.homeCollectionViewCell, for: indexPath) as? HomeCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(model: movieData[indexPath.row])
        return cell
    }
}
// MARK: - UICollectionViewDelegateFlowLayout
extension SeachViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width/4 , height: view.bounds.height/3)
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
