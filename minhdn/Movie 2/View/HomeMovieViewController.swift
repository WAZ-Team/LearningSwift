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
//    var topView: UIView?
    var viewModel = MoviesViewModel()
//    var movies: [MovieDataModel] = [MovieDataModel]()
    var movies = [MovieDataModel]()
    var selectedMovie: MovieDataModel?
//    var sectionMovie: [SectionType] = [SectionType.AllMovie, .HighRate, .NowPlaying, .Popular, .UpComing]
    override func viewDidLoad() {
        super.viewDidLoad()
//        movies = APIService.load("Movie.json")
       
        self.homeTableview.delegate = self
        self.homeTableview.dataSource = self
        homeTableview.register(UINib(nibName: Constants.homeTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.homeTableViewCell)
        homeTableview.register(UINib(nibName: Constants.upTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.upTableViewCell)
        viewModel.delegate = self
        navigationSearch()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tabBarController?.tabBar.isHidden = false
        getAllData()
        homeTableview.reloadData()
       
    }
    
    func getAllData(){
        viewModel.getMovies(type: .HighestRated)
        viewModel.getMovies(type: .NowPlaying)
        viewModel.getMovies(type: .Popular)
        viewModel.getMovies(type: .Upcoming)
    }
}
// MARK: - Delegate

extension HomeMovieViewControllers: SelectedMovieDelegate{
    func didSelectMovie(movie: MovieDataModel) {
        self.selectedMovie = movie
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: Constants.detaiViewController) as? DetaiViewController else{return}
        vc.movieData = selectedMovie
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - DataSource
extension HomeMovieViewControllers: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            guard let cell = self.homeTableview.dequeueReusableCell(withIdentifier:Constants.upTableViewCell , for: indexPath) as? UpTableViewCell else {return UITableViewCell()}
            cell.cellData = [movies[indexPath.section]]
            return cell
        } else{
            guard let cell = self.homeTableview.dequeueReusableCell(withIdentifier: Constants.homeTableViewCell , for: indexPath) as? HomeTableViewCell else  { return UITableViewCell()}
            
            cell.moviesTBVC = [movies[indexPath.section]]
            cell.movieDelegate = self
            return cell
        }
    }
//        switch sectionMovie[indexPath.section] {
//        case .AllMovie:
//            guard let cell = self.homeTableview.dequeueReusableCell(withIdentifier:Constants.upTableViewCell , for: indexPath) as? UpTableViewCell else {return UITableViewCell()}
//            cell.configurer(movies: movies)
//            return cell
//        case .NowPlaying:
//            guard let cell = self.homeTableview.dequeueReusableCell(withIdentifier: Constants.homeTableViewCell , for: indexPath) as? HomeTableViewCell else  { return UITableViewCell()}
//            cell.nowPlay(movies: movies)
//            cell.movieDelegate = self
//            return cell
//        case .HighRate:
//            guard let cell = self.homeTableview.dequeueReusableCell(withIdentifier: Constants.homeTableViewCell , for: indexPath) as? HomeTableViewCell else  { return UITableViewCell()}
//            cell.hightRate(movies: movies)
//            cell.movieDelegate = self
//            return cell
//        case .UpComing:
//            guard let cell = self.homeTableview.dequeueReusableCell(withIdentifier: Constants.homeTableViewCell , for: indexPath) as? HomeTableViewCell else  { return UITableViewCell()}
//            cell.upComing(movies: movies)
//            cell.movieDelegate = self
//            return cell
//        case .Popular:
//            guard let cell = self.homeTableview.dequeueReusableCell(withIdentifier: Constants.homeTableViewCell , for: indexPath) as? HomeTableViewCell else  { return UITableViewCell()}
//            cell.popular(movies: movies)
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
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 40.0))
        headerView.backgroundColor = UIColor(red: 0.91, green: 0.96, blue: 1.00, alpha: 1.00)
        let label = UILabel()
        label.frame = CGRect.init(x: 10, y: 0, width: headerView.frame.width-10, height: headerView.frame.height)
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 35.0)
        label.textColor = #colorLiteral(red: 0.1568627451, green: 0.1568627451, blue: 0.1568627451, alpha: 1)
        headerView.addSubview(label)
        headerView.clearsContextBeforeDrawing =  true
//        label.text = sectionMovie[0].title
//        let data = sectionMovie[section].title
//        let data = Array(movies[section])
//        if data.count > 0 {
//            label.text = data
//        }
        return headerView
    } 
}
extension HomeMovieViewControllers:ViewModelDelegate{

    func reloadTable(movieArr: [MovieDataModel]) {
        movies.append(contentsOf: movieArr)
        homeTableview.reloadData()
    }
   
}
