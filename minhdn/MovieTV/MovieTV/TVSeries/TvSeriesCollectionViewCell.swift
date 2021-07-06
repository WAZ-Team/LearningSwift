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
        self.ImageTvSeries.clipsToBounds = true
        self.ImageTvSeries.layer.cornerRadius = 30
        self.ImageTvSeries.translatesAutoresizingMaskIntoConstraints = false
    
    }

}
