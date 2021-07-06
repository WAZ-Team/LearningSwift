//
//  TvSeriesTableViewCell.swift
//  MovieTV
//
//  Created by MinhDev on 7/6/21.
//

import UIKit

class TvSeriesTableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    var Tvseries: [(names:String,image:String)] =
        []
    
    @IBOutlet weak var collectionView: UICollectionView!{
        didSet{
            self.collectionView.delegate = self
            self.collectionView.dataSource = self
            self.collectionView.register(UINib(nibName: "TvSeriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TvSeriesCollectionViewCell")
            self.collectionView.reloadData()
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Tvseries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "TvSeriesCollectionViewCell", for: indexPath) as! TvSeriesCollectionViewCell
        cell.ImageTvSeries.image = UIImage(named:self.Tvseries[indexPath.row].image)
        cell.LableTvSeries.text = self.Tvseries[indexPath.row].names
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 3, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        Tvseries.append((names: "Suits", image: "suits"))
        Tvseries.append((names: "La casa de papel", image: "La_Casa"))
        Tvseries.append((names: "Community", image: "community"))
        Tvseries.append((names: "X - Men", image: "x_men"))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
