//
//  HomeMovie.swift
//  Movie 2
//
//  Created by MinhDev on 7/9/21.
//
import Foundation
import UIKit


class HomeMovie: UIViewController, UITableViewDelegate {
    
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
    let transition = SlideInTransition()
    var topView: UIView?
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
      self.navigationController?.navigationBar.backgroundColor = UIColor(named: "dark-brown-2")
        let label = UILabel(frame: CGRect(x:0, y:0, width:350, height:30))
        label.backgroundColor = .clear
        label.numberOfLines = 1
        label.font = UIFont (name: "Helvetica Neue", size: 24.0)!
        label.font = .boldSystemFont(ofSize: 30.0)
        label.textAlignment = .center
        label.textColor = .red
        label.sizeToFit()
        label.text = "Movie"
        self.navigationItem.titleView = label
       let menuBtn = UIBarButtonItem(image: #imageLiteral(resourceName: "Menu"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(openMenu))
        self.navigationItem.leftBarButtonItem = menuBtn
        self.navigationItem.leftBarButtonItem?.tintColor = .black
        self.navigationItem.leftBarButtonItem?.width = 20.0
        
//        let searchBtn = UIBarButtonItem(image: #imageLiteral(resourceName: "Seach"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(openSearchScreen))
//        self.navigationItem.rightBarButtonItem = searchBtn
    }
    @objc func openMenu(){
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "SlideMenu") as? SlideMenu else {return}
         vc.didTapMenuType = { Menutype in
             self.transitiontoNew(Menutype)
         }
         vc.modalPresentationStyle = .overCurrentContext
         vc.transitioningDelegate = self
         present(vc, animated: true)
    }
    
    @objc func openSearchScreen(){
        
    }
    func transitiontoNew(_ menuType: Menutype){
        let title = String(describing: menuType).capitalized
        self.title = title
        topView?.removeFromSuperview()
        switch menuType {
        case .Person:
            self.navigationController?.popViewController(animated: true)
        case .Profile:
            let vc = storyboard?.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
            self.navigationController?.pushViewController(vc, animated: true)
        case .Settings:
            let vc = storyboard?.instantiateViewController(withIdentifier: "SettingsVC") as! SettingsVC
            self.navigationController?.pushViewController(vc, animated: true)
        case .Logout:
            let vc = storyboard?.instantiateViewController(withIdentifier: "LogoutVC") as! LogoutVC
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
}
// MARK: - Delegate
//extension HomeMovie: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        navigateToDetailsViewController(indexPath: indexPath)
//    }
//    
//    func navigateToDetailsViewController (indexPath: IndexPath) {
//        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "detaiViewController") as! detaiViewController
//        detailController.movies = self.selectedMovie[indexPath.row]
//        self.navigationController!.pushViewController(detailController, animated: true)
//    }
// 
//}

//extension HomeMovie: SelectedMovieDelegate{
//    func didSelectMovie(movie: MovieDataModel) {
//        self.selectedMovie = [movie]
//        self.performSegue(withIdentifier: "showDetail", sender: self)
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showDetail"{
//            let controller = segue.destination as! detaiViewController
//            controller.movieData = selectedMovie
//
//        }
//    }
//}
extension HomeMovie: UIViewControllerTransitioningDelegate{
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.ispresenting = true
        return transition
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.ispresenting = false
        return transition
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
            return 50
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

        return cell
            
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 205
        } else {
            return 300
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 70))
        let label = UILabel()
        label.frame = CGRect.init(x: 5, y: 12, width: headerView.frame.width-10, height: headerView.frame.height-8)
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 40.0)
        label.textColor = #colorLiteral(red: 0.1568627451, green: 0.1568627451, blue: 0.1568627451, alpha: 1)
        headerView.backgroundColor = .white
        headerView.addSubview(label)
        headerView.clearsContextBeforeDrawing =  false
        if section == 1{
            label.text = moviessection[0]
            
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
