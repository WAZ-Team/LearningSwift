//
//  TvCatalogyCVC.swift
//  MovieTV
//
//  Created by MinhDev on 7/7/21.
//

import UIKit

class TvCatalogyCVC: UICollectionViewCell {

    @IBOutlet weak var LabelTvCatalogy: UILabel!
    @IBOutlet weak var ImageTvCatalogy: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.ImageTvCatalogy.layer.cornerRadius = 20
        self.ImageTvCatalogy.clipsToBounds = true
    }

}
