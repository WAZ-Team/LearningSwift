//
//  HomeCollectionViewCell.swift
//  MovieTV
//
//  Created by MinhDev on 7/6/21.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {

   
    @IBOutlet weak var ImageHomeCVC: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.ImageHomeCVC.clipsToBounds = true
        self.ImageHomeCVC.layer.cornerRadius = 30
        self.ImageHomeCVC.translatesAutoresizingMaskIntoConstraints = false
    }

}
