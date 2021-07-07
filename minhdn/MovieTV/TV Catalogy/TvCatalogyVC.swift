//
//  TvCatalogyVC.swift
//  MovieTV
//
//  Created by MinhDev on 7/7/21.
//

import UIKit

class TvCatalogyVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    var TvCatalogy: [(names:String,image:String)] =
        []
    @IBOutlet weak var TvCatalogyCV: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TvCatalogy.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TvCatalogyCVC", for: indexPath) as! TvCatalogyCVC
        cell.ImageTvCatalogy.image = UIImage(named:self.TvCatalogy[indexPath.row].image)
        cell.LabelTvCatalogy.text = self.TvCatalogy[indexPath.row].names
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
        TvCatalogyCV.register(UINib(nibName: "TvCatalogyCVC", bundle: .main), forCellWithReuseIdentifier: "TvCatalogyCVC")
        TvCatalogyCV.delegate = self
        TvCatalogyCV.dataSource = self
        TvCatalogy.append((names: "Horror", image: "horror"))
        TvCatalogy.append((names: "Action", image: "action"))
        TvCatalogy.append((names: "Comedy", image: "comedy"))
        TvCatalogy.append((names: "Drama", image: "drama"))
        TvCatalogy.append((names: "Science fiction", image: "science_fiction"))
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
