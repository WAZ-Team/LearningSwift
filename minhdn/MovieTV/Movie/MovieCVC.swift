//
//  MovieCVC.swift
//  MovieTV
//
//  Created by MinhDev on 7/7/21.
//

import UIKit

class MovieCVC: UICollectionViewCell {

    @IBOutlet weak var LabelMovieCVC: UILabel!
    @IBOutlet weak var ImageMovieCVC: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.ImageMovieCVC.layer.cornerRadius = 20
        self.ImageMovieCVC.clipsToBounds = true
        
    }

}
