//
//  TVSeriesVC.swift
//  MovieTV
//
//  Created by MinhDev on 7/6/21.
//

import UIKit

class TVSeriesVC: UIViewController,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    var Tvseries: [(names:String,image:String)] =
        []
    @IBOutlet weak var TvSeriesVC: UICollectionView!
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Tvseries.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TvSeriesVCC", for: indexPath) as! TvSeriesVCC
        cell.ImageTvSeriesVCC.image = UIImage(named:self.Tvseries[indexPath.row].image)
        cell.LabelTvSeriesVCC.text = self.Tvseries[indexPath.row].names
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
                if UIDevice.current.userInterfaceIdiom == .pad{
                    return CGSize(width: view.frame.size.width/3 , height: view.frame.size.height)
                }
        return CGSize(width: (self.view.frame.size.width)/4, height: (self.view.frame.size.height)/4 )
     }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 10
        }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        TvSeriesVC.register(UINib(nibName: "TvSeriesVCC", bundle: .main), forCellWithReuseIdentifier: "TvSeriesVCC")
        TvSeriesVC.delegate = self
        TvSeriesVC.dataSource = self
        Tvseries.append((names: "Suits", image: "suits"))
        Tvseries.append((names: "La casa de papel", image: "La_Casa"))
        Tvseries.append((names: "Community", image: "community"))
        Tvseries.append((names: "X - Men", image: "x_men"))
        // Do any additional setup after loading the view.
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
