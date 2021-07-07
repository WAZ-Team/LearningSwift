//
//  TvCatalogyTableViewCell.swift
//  MovieTV
//
//  Created by MinhDev on 7/6/21.
//

import UIKit

class TvCatalogyTableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{

    var TvCatalogy: [(names:String,image:String)] =
        []
    
    @IBOutlet weak var collectionView: UICollectionView!{
        didSet{
            self.collectionView.delegate = self
            self.collectionView.dataSource = self
            self.collectionView.register(UINib(nibName: "TvCatalogyCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TvCatalogyCollectionViewCell")
            self.collectionView.reloadData()
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TvCatalogy.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "TvCatalogyCollectionViewCell", for: indexPath) as! TvCatalogyCollectionViewCell
        cell.TvCatalogyImage.image = UIImage(named:self.TvCatalogy[indexPath.row].image)
        cell.TVCatalogyLable.text = self.TvCatalogy[indexPath.row].names
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
        TvCatalogy.append((names: "Horror", image: "horror"))
        TvCatalogy.append((names: "Action", image: "action"))
        TvCatalogy.append((names: "Comedy", image: "comedy"))
        TvCatalogy.append((names: "Drama", image: "drama"))
        TvCatalogy.append((names: "Science fiction", image: "science_fiction"))
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
