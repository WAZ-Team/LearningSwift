//
//  FavoriteCollectionViewCell.swift
//  MovieTV
//
//  Created by MinhDev on 7/6/21.
//

import UIKit

class FavoriteCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var FavoriteImage: UIImageView!
    @IBOutlet weak var FavoriteLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.clipsToBounds = true
        self.layer.cornerRadius = 20
        self.FavoriteImage.layer.cornerRadius = 20
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.masksToBounds = true
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 5
//        self.backgroundColor = .black
//        self.FavoriteLabel.textColor = .white
    }

}
