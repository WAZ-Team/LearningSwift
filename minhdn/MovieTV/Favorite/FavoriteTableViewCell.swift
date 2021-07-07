//
//  FavoriteTableViewCell.swift
//  MovieTV
//
//  Created by MinhDev on 7/6/21.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource {

    var Favorite: [(names:String,image:String)] =
        []
    
    @IBOutlet weak var collectionView: UICollectionView!{
        didSet{
            self.collectionView.delegate = self
            self.collectionView.dataSource = self
            self.collectionView.register(UINib(nibName: "FavoriteCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FavoriteCollectionViewCell")
            self.collectionView.reloadData()
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Favorite.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteCollectionViewCell", for: indexPath) as! FavoriteCollectionViewCell
        cell.FavoriteImage.image = UIImage(named:self.Favorite[indexPath.row].image)
        cell.FavoriteLabel.text = self.Favorite[indexPath.row].names
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 3, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        Favorite.append((names: "Wolf wall street", image: "wolf_wall_street"))
        Favorite.append((names: "Mad men", image: "mad_men"))
        Favorite.append((names: "Silicon valley", image: "silicon_valley"))
        Favorite.append((names: "Vikings", image: "vikings"))
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
