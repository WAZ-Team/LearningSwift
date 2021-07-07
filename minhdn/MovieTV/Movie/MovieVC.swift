//
//  MovieVC.swift
//  MovieTV
//
//  Created by MinhDev on 7/6/21.
//

import UIKit

class MovieVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    var ListMovie: [(names:String,image:String)] =
        []
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ListMovie.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCVC", for: indexPath) as! MovieCVC
        cell.ImageMovieCVC.image = UIImage(named:self.ListMovie[indexPath.row].image)
        cell.LabelMovieCVC.text = self.ListMovie[indexPath.row].names
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
                if UIDevice.current.userInterfaceIdiom == .pad{
                    return CGSize(width: view.frame.size.width/3 , height: view.frame.size.height)
                }
        return CGSize(width: self.view.frame.size.width/4 , height: self.view.frame.size.height/4 )
     }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 10
        }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
        
    @IBOutlet weak var MovieCollectionview: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        MovieCollectionview.register(UINib(nibName: "MovieCVC", bundle: .main), forCellWithReuseIdentifier: "MovieCVC")
        MovieCollectionview.delegate = self
        MovieCollectionview.dataSource = self
        ListMovie.append((names: "Suits", image: "suits"))
        ListMovie.append((names: "La casa de papel", image: "La_Casa"))
        ListMovie.append((names: "Community", image: "community"))
        ListMovie.append((names: "X - Men", image: "x_men"))
        ListMovie.append((names: "Wolf wall street", image: "wolf_wall_street"))
        ListMovie.append((names: "Mad men", image: "mad_men"))
        ListMovie.append((names: "Silicon valley", image: "silicon_valley"))
        ListMovie.append((names: "Vikings", image: "vikings"))
        ListMovie.append((names: "Hunger games", image: "hunger_games"))
        // Do any additional setup after loading the view.
    
}
}
