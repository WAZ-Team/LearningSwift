//
//  HomeMovie.swift
//  MovieTV
//
//  Created by MinhDev on 7/6/21.
//

import UIKit
class HomeMovie: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    var View: [(names:String,Lable:String)] =
        []
    let transition = SlideInTransition()
    var topView: UIView?
//-------------------------------------------------
    
    @IBOutlet weak var tableview: UITableView!{
        didSet{
                self.tableview.delegate = self
               self.tableview.dataSource = self
                self.tableview.reloadData()
            }
        }

    func setNavigationBar() {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.view.backgroundColor = .clear
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "search"), style: .plain,target: self, action: #selector(SeachMovie))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "home"), style: .plain, target: self, action: #selector(ChangeSlideMenu))
        let label = UILabel(frame: CGRect(x:0, y:0, width:350, height:30))
        label.backgroundColor = .clear
        label.numberOfLines = 1
        label.font = UIFont (name: "Avenir Next", size: 18.0)!
        label.textAlignment = .center
        label.textColor = .black
        label.sizeToFit()
        label.text = "Home"
        self.navigationItem.titleView = label
    }
    @objc func SeachMovie() {

    }
    @objc func ChangeSlideMenu(){
       guard let vc = storyboard?.instantiateViewController(withIdentifier: "SlideMenu") as? SlideMenu else {return}
        vc.didTapMenuType = { Menutype in
            self.transitiontoNew(Menutype)
        }
        vc.modalPresentationStyle = .overCurrentContext
        vc.transitioningDelegate = self
        present(vc, animated: true)
    }
    func transitiontoNew(_ menuType: Menutype){
        let title = String(describing: menuType).capitalized
        self.title = title
        topView?.removeFromSuperview()
        switch menuType {
        case .Person:
            self.navigationController?.popViewController(animated: true)
        case .Home:
            self.navigationController?.popViewController(animated: true)
        case .Movie:
            let vc = storyboard?.instantiateViewController(withIdentifier: "MovieVC") as! MovieVC
            self.navigationController?.pushViewController(vc, animated: true)
        case .TVSeries:
            let vc = storyboard?.instantiateViewController(withIdentifier: "TVSeriesVC") as! TVSeriesVC
            self.navigationController?.pushViewController(vc, animated: true)
        case .Favorite:
            let vc = storyboard?.instantiateViewController(withIdentifier: "FavoriteVC") as! FavoriteVC
            self.navigationController?.pushViewController(vc, animated: true)
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
//------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBar()
        self.view.backgroundColor = .gray
    }
// ---------------------------------------------------------------------
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            self.tableview.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
            let cell = self.tableview.dequeueReusableCell(withIdentifier:"HomeTableViewCell" , for: indexPath) as! HomeTableViewCell
            return cell
        case 1:
            self.tableview.register(UINib(nibName: "TitleTableViewCell", bundle: nil), forCellReuseIdentifier: "TitleTableViewCell")
            let cell = self.tableview.dequeueReusableCell(withIdentifier:"TitleTableViewCell" , for: indexPath) as! TitleTableViewCell
            cell.TitleLable.text = "TV Series"
            let vc = storyboard?.instantiateViewController(withIdentifier: "TVSeriesVC") as! TVSeriesVC
            self.navigationController?.pushViewController(vc, animated: true)
            return cell
           
        case 2:
            self.tableview.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
            let cell = self.tableview.dequeueReusableCell(withIdentifier:"HomeTableViewCell" , for: indexPath) as! HomeTableViewCell
            return cell

        default:
            self.tableview.register(UINib(nibName: "TitleTableViewCell", bundle: nil), forCellReuseIdentifier: "TitleTableViewCell")
            let cell = self.tableview.dequeueReusableCell(withIdentifier:"TitleTableViewCell" , for: indexPath) as! TitleTableViewCell
            cell.TitleLable.text = "TV Series"
            return cell
        }

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return  350
        case 1:
            return  30
        case 2:
              return  200
        case 3:
            return  30
        case 4:
          return  220
        case 5:
          return  45
       
        default:
            return 220
        }
    }


   }
////-----------------------------------------------------

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

