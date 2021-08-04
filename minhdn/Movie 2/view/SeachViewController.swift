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
    let searchController = UISearchController()
    var data = String()
    var selectmovie = [MovieDataModel]()
    var movidata: MovieDataModel?
    var movi: MovieDataModel?
//    var data = [MovieDataModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
//        movidata = APIService.load("Movie.json")
        searchController.loadViewIfNeeded()
//        searchController.searchResultsUpdater = self
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
        self.collectionView.register(UINib(nibName: Constants.searchCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: Constants.searchCollectionViewCell)
    }
    fileprivate func performSearch(searchTerm: String) {
        Service.shared.searchMovies(searchTerm: searchTerm) { [weak self] (result) in
            switch result {
            case .failure(let error):
                print("Error in searching", error)
            case.success(let response):

                self?.selectmovie = 
                self?.collectionView.reloadData()
            }
        }
    }

}
    // MARK: - UISearchResultsUpdating
//extension SeachViewController:UISearchResultsUpdating{
//
//
//
//    func updateSearchResults(for searchController: UISearchController) {
//        RequestForText(searchController.searchBar.text)
//    }
//
//    /// Triggers the timer to execute the filtering
//    private func RequestForText(_ term:String?){
//        guard let text = term, !text.isEmpty else{
//            return
//        }
//        timer?.invalidate()
//        timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) { [weak self] _ in
//            print("Filtering movie with name: \(text)...")
//            self?.data = text
//
////
//        }
//    }
//}

    //  MARK:   - Delegate
extension SeachViewController: UICollectionViewDelegate{
    
}
extension SeachViewController: UISearchBarDelegate{
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text, searchTerm.count > 0 else {
            print("Invalid search term")
            return
        }

        performSearch(searchTerm: searchTerm)
    }
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//
//        if searchText.isEmpty == false {
//            self.data = movidata?.title ?? ""
////            self.movidata = self.selectmovie
//        }
//
//        collectionView.reloadData()
//    }
}
    //  MARK:   - DataSource
extension SeachViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectmovie.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: Constants.searchCollectionViewCell, for: indexPath) as? SearchCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(model: selectmovie[indexPath.row])
        cell.titleSearch.text = selectmovie[indexPath.row].title
        cell.releaseSearch.formatAndShowDate(dateString: selectmovie[indexPath.row].ReleaseDate, formatString: "MMM dd YYYY")
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        cell.layer.cornerRadius = 20.0
        cell.clipsToBounds = true
        cell.layer.borderWidth = 2.0
    }
}
    // MARK: - UICollectionViewDelegateFlowLayout
extension SeachViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width - 20.0 , height: view.bounds.height/6.3)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }

   
}
