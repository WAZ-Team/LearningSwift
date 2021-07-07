//
//  TvCatalogyCollectionViewCell.swift
//  MovieTV
//
//  Created by MinhDev on 7/6/21.
//

import UIKit

class TvCatalogyCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var TVCatalogyLable: UILabel!
    @IBOutlet weak var TvCatalogyImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.clipsToBounds = true
        self.layer.cornerRadius = 20
        self.TvCatalogyImage.layer.cornerRadius = 20
//        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.masksToBounds = true
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 5
//        self.backgroundColor = .black
//        self.TVCatalogyLable.textColor = .white
        
    }

}
