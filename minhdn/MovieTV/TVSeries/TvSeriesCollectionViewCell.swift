//
//  TvSeriesCollectionViewCell.swift
//  MovieTV
//
//  Created by MinhDev on 7/6/21.
//

import UIKit

class TvSeriesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var LableTvSeries: UILabel!
    @IBOutlet weak var ImageTvSeries: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.clipsToBounds = true
        self.layer.cornerRadius = 20
        self.ImageTvSeries.layer.cornerRadius = 20
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.masksToBounds = true
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 5
//        self.backgroundColor = .black
//        self.LableTvSeries.textColor = .white
    }

}
