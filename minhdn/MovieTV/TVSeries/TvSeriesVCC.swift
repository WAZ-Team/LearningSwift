//
//  TvSeriesVCC.swift
//  MovieTV
//
//  Created by MinhDev on 7/7/21.
//

import UIKit

class TvSeriesVCC: UICollectionViewCell {

    @IBOutlet weak var LabelTvSeriesVCC: UILabel!
    @IBOutlet weak var ImageTvSeriesVCC: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.ImageTvSeriesVCC.layer.cornerRadius = 20
        self.ImageTvSeriesVCC.clipsToBounds = true
        
    }

}
