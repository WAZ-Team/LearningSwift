//
//  HomeMovie.swift
//  Movie 2
//
//  Created by MinhDev on 7/9/21.
//

import UIKit
import FSPagerView

class HomeMovie: UIViewController {
    
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
//  MARK: - Variables
    var movies: [MovieDataModel] = []
    
    var movi = [[String:[MovieDataModel]]]()
//    var selectedMovie: [MovieDataModel] = []
    var selectedMovie = [MovieDataModel]()
    var moviessection : [String] = [ "NowPlaying" , "HightRate" , "PopularMovie" , "UpcommingMovie"]
    override func viewDidLoad() {
        super.viewDidLoad()
        movies = APIService.load("Movie.json")
        selectedMovie = APIService.load("Movie.json")
        setupNavigationBar()
    
    }

//  MARK: - Config
  
    func setupNavigationBar(){
        let menuBtn = UIBarButtonItem(image: #imageLiteral(resourceName: "menu"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(openHamburgerMenu))
        self.navigationItem.leftBarButtonItem = menuBtn
        
        let searchBtn = UIBarButtonItem(image: #imageLiteral(resourceName: "search"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(openSearchScreen))
        self.navigationItem.rightBarButtonItem = searchBtn
    }
    @objc func openHamburgerMenu(){
    
    }
    
    @objc func openSearchScreen(){
        
    }
    
}
// MARK: - Delegate
extension HomeMovie: UITableViewDelegate {
    
}
extension HomeMovie: SelectedMovieDelegate{
    func didSelectMovie(movie: MovieDataModel) {
        self.selectedMovie = [movie]
        self.performSegue(withIdentifier: "showDetail", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail"{
            let controller = segue.destination as! detaiViewController
            controller.movieData = selectedMovie
            
        }
    }
}


// MARK: - DataSource
extension HomeMovie: UITableViewDataSource {
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
            return 20
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            guard let cell = self.homeTableview.dequeueReusableCell(withIdentifier:"UpTableViewCell" , for: indexPath) as? UpTableViewCell else  { return UITableViewCell()}
            cell.imageView?.downloaded(from: movies[indexPath.row].backdroppath ?? "")
            return cell
        }
        else{
            guard let cell = self.homeTableview.dequeueReusableCell(withIdentifier:"HomeTableViewCell" , for: indexPath) as? HomeTableViewCell else  { return UITableViewCell()}
           cell.configure(movies: movies)

        return cell
            
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 205
        } else {
            return 200
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 30))
        let label = UILabel()
        label.frame = CGRect.init(x: 5, y: 12, width: headerView.frame.width, height: headerView.frame.height-8)
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
        label.textColor = #colorLiteral(red: 0.1568627451, green: 0.1568627451, blue: 0.1568627451, alpha: 1)
        headerView.backgroundColor = .white
        headerView.addSubview(label)
       
        if section == 1{
            label.text = moviessection[1]
            
        }
        if section == 2{
            label.text = moviessection[1]
        }
        if section == 3{
            label.text = moviessection[2]
        }
        if section == 4{
            label.text = moviessection[3]
        }
        return headerView
        }
    
    }

