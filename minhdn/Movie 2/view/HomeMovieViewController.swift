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
    @IBOutlet weak var homeTableview: UITableView!{
        didSet{
            self.homeTableview.delegate = self
            self.homeTableview.dataSource = self
            homeTableview.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
            homeTableview.register(UINib(nibName: "UpTableViewCell", bundle: nil), forCellReuseIdentifier: "UpTableViewCell")
            homeTableview.reloadData()
        }
    }
    
    var topView: UIView?
//  MARK: - Variables
    var movies: [MovieDataModel] = []
    var movi = [[String:[MovieDataModel]]]()
//    var selectedMovie: [MovieDataModel] = []
    var selectedMovie : MovieDataModel?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movies = APIService.load("Movie.json")
        navigationController?.navigationItem.titleView?.tintColor = .black
        guard AppDelegate.isDark else { return }
        view.backgroundColor = UIColor.black
        navigationController?.navigationBar.barStyle = .black
        homeTableview.backgroundColor = .black
        view.backgroundColor = .black
        navigationItem.title = TabBarItemTag.allCases[tabBarItem.tag].title
    }
}

//  MARK: - Config
  
 
// MARK: - Delegate

extension HomeMovieViewControllers: SelectedMovieDelegate{
    func didSelectMovie(movie: MovieDataModel) {
        self.selectedMovie = movie
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "detaiViewController") as! detaiViewController
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - DataSource
extension HomeMovieViewControllers: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 0
        } else{
            return 40
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            guard let cell = self.homeTableview.dequeueReusableCell(withIdentifier:"UpTableViewCell" , for: indexPath) as? UpTableViewCell else  { return UITableViewCell()}
            cell.configurer(movies: movies)
            
            return cell
        }
        else{
            guard let cell = self.homeTableview.dequeueReusableCell(withIdentifier:"HomeTableViewCell" , for: indexPath) as? HomeTableViewCell else  { return UITableViewCell()}
           cell.configure(movies: movies)
         cell.movieDelegate = self
        return cell
            
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
        let label = UILabel()
        label.frame = CGRect.init(x: 10, y: 0, width: headerView.frame.width-10, height: headerView.frame.height)
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 35.0)
        label.textColor = #colorLiteral(red: 0.1568627451, green: 0.1568627451, blue: 0.1568627451, alpha: 1)
        headerView.backgroundColor = .white
        headerView.addSubview(label)
        headerView.clearsContextBeforeDrawing =  true
        switch section{
        case 0: break
            
        case 1:
            label.text = "Nowplaying"
        case 2:
            label.text = "HighestRated"
        case 3:
            label.text = "Upcoming"
        case 4:
            label.text = "Popular"
        
        default:
            break
        }
        return headerView
        }
    
    }
enum ListType: String{
    case Popular
    case HighestRated
    case Upcoming
    case NowPlaying
}
