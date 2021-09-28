//
//  SeachViewController.swift
//  Movie 2
//
//  Created by MinhDev on 7/21/21.
//

import UIKit

class SeachViewController: UIViewController {
    //  MARK:   - Outlet
    @IBOutlet private weak var collectionView: UICollectionView!
    
    //  MARK: - Variables
    private let searchController = UISearchController()
    private var data = String()
    private var searchViewModel = MoviesViewModel()
    private var datamovie = [ListType:[MovieDataModel]]()
    private var getMovieSearch : [MovieDataModel] = [MovieDataModel]()
    private var searchActive = false
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.91, green: 0.96, blue: 1.00, alpha: 1.00)
        searchViewModel.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
        self.collectionView.register(UINib(nibName: Constants.searchCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: Constants.searchCollectionViewCell)
        setUpSearch()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tabBarController?.tabBar.isHidden = false
        searchViewModel.getMovies()
    }
    func setUpSearch(){
        searchController.searchBar.delegate = self
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        definesPresentationContext = true
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
}
// MARK: - UISearchResultsUpdating
extension SeachViewController:UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        RequestForText(searchController.searchBar.text ?? "")
    }
    
    private func RequestForText(_ term:String?){
        guard let text = term, !text.isEmpty else{
            return
        }
        print("Filtering movie with name: \(text)...")
        self.data = text
    }
}
//  MARK:   - Delegate
extension SeachViewController:ViewModelDelegate{

    func reloadTable(movieArr: [ListType:[MovieDataModel]]) {
        datamovie = movieArr
        collectionView.reloadData()
    }
}

extension SeachViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: Constants.detaiViewController) as? DetaiViewController else{return}
        vc.movieData = getMovieSearch[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension SeachViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty == false {
            searchActive = true
            getMovieSearch.removeAll()
            for item in datamovie[.allMovie] ?? []{
                if item.title?.uppercased().contains(data.uppercased()) == true{
                    getMovieSearch.append(item)
                }
                print(item)
            }
        }else{
            searchActive = false
            getMovieSearch.removeAll()
            getMovieSearch = datamovie[.allMovie] ?? []
        }
        collectionView.reloadData()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        getMovieSearch.removeAll()
        collectionView.reloadData()
    }
}
//  MARK:   - DataSource
extension SeachViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return getMovieSearch.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: Constants.searchCollectionViewCell, for: indexPath) as? SearchCollectionViewCell else { return UICollectionViewCell() }
        cell.imageSearch.downloaded(from: getMovieSearch[indexPath.row].Posterpath ?? "" )
        cell.titleSearch.text = getMovieSearch[indexPath.row].title
        cell.releaseSearch.formatAndShowDate(dateString: getMovieSearch[indexPath.row].ReleaseDate, formatString: "MMM dd YYYY")
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

