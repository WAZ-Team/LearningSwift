//
//  HomeMovie.swift
//  Movie 2
//
//  Created by MinhDev on 7/9/21.
//
import Foundation
import UIKit

class HomeMovieViewControllers: UIViewController, UITableViewDelegate {
    
    //    MARK: - IBoutlet
    @IBOutlet private weak var homeTableview: UITableView!
    
    //  MARK: - Variables
    var viewModel = MoviesViewModel()
    var movies = [ListType:[MovieDataModel]]()
    var selectedMovie: MovieDataModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeTableview.delegate = self
        self.homeTableview.dataSource = self
        homeTableview.register(UINib(nibName: Constants.homeTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.homeTableViewCell)
        homeTableview.register(UINib(nibName: Constants.upTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.upTableViewCell)
        viewModel.delegate = self
        title = "MovieTV"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tabBarController?.tabBar.isHidden = false
        viewModel.getMovies()
        homeTableview.reloadData()
    }
    
    
}
// MARK: - Delegate
extension HomeMovieViewControllers:ViewModelDelegate{

    func reloadTable(movieArr: [ListType:[MovieDataModel]]) {
        movies = movieArr
        homeTableview.reloadData()
    }
}

extension HomeMovieViewControllers: SelectedMovieDelegate{
    func didSelectMovie(movie: MovieDataModel) {
        self.selectedMovie = movie
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: Constants.detaiViewController) as? DetaiViewController else {return}
        vc.movieData = selectedMovie
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - DataSource
extension HomeMovieViewControllers: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return movies.keys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = self.homeTableview.dequeueReusableCell(withIdentifier:Constants.upTableViewCell , for: indexPath) as? UpTableViewCell else {return UITableViewCell()}
            cell.configurer(viewModel: movies[.allMovie] ?? [])
                return cell
        case 1:
            guard let cell = self.homeTableview.dequeueReusableCell(withIdentifier: Constants.homeTableViewCell , for: indexPath) as? HomeTableViewCell else  { return UITableViewCell()}
            cell.configure(viewModel: movies[.highestRated] ?? [])
            cell.movieDelegate = self
        case 2:
            guard let cell = self.homeTableview.dequeueReusableCell(withIdentifier: Constants.homeTableViewCell , for: indexPath) as? HomeTableViewCell else  { return UITableViewCell()}
            cell.configure(viewModel: movies[.nowPlaying] ?? [])
            cell.movieDelegate = self
        case 3:guard let cell = self.homeTableview.dequeueReusableCell(withIdentifier: Constants.homeTableViewCell , for: indexPath) as? HomeTableViewCell else  { return UITableViewCell()}
            cell.configure(viewModel: movies[.popular] ?? [])
            cell.movieDelegate = self
        case 4:
            guard let cell = self.homeTableview.dequeueReusableCell(withIdentifier: Constants.homeTableViewCell , for: indexPath) as? HomeTableViewCell else  { return UITableViewCell()}
            cell.configure(viewModel: movies[.upComing] ?? [])
            cell.movieDelegate = self
            
        default:
            guard let cell = self.homeTableview.dequeueReusableCell(withIdentifier: Constants.homeTableViewCell , for: indexPath) as? HomeTableViewCell else  { return UITableViewCell()}
            cell.configure(viewModel: movies[.highestRated] ?? [])
            cell.movieDelegate = self
            return cell
        }
        return UITableViewCell()
    }
//        if indexPath.section == 0{
//            guard let cell = self.homeTableview.dequeueReusableCell(withIdentifier:Constants.upTableViewCell , for: indexPath) as? UpTableViewCell else {return UITableViewCell()}
//            let type = Array(movies.keys)[indexPath.section]
//            cell.configurer(viewModel: movies[type] ?? [])
//                return cell
//
//        } else{
//            guard let cell = self.homeTableview.dequeueReusableCell(withIdentifier: Constants.homeTableViewCell , for: indexPath) as? HomeTableViewCell else  { return UITableViewCell()}
//            for i in ListType.allCases{
//                let type = Array(movies.)
//            }
////            let type1 = Array(movies.keys)[indexPath.section]
////            cell.configure(viewModel: movies[type1] ?? [])
//            cell.movieDelegate = self
//            return cell
//        }
//    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 0.0
        } else{
            return 40.0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 205.0
        } else {
            return 300.0
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let view = UIView()
           return view
        } else{
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 40.0))
        headerView.backgroundColor = UIColor(red: 0.91, green: 0.96, blue: 1.00, alpha: 1.00)
        let label = UILabel()
        label.frame = CGRect.init(x: 10, y: 0, width: headerView.frame.width-10, height: headerView.frame.height)
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 35.0)
        label.textColor = #colorLiteral(red: 0.1568627451, green: 0.1568627451, blue: 0.1568627451, alpha: 1)
        headerView.addSubview(label)
        headerView.clearsContextBeforeDrawing =  true
            var header = [String]()
            for i in ListType.allCases{
                header.append(i.getTitle())
            }
            label.text = header[section]
        return headerView
    }
    }
}

