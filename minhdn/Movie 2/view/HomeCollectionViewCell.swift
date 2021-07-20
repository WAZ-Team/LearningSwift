//
//  HomeCollectionViewCell.swift
//  Movie 2
//
//  Created by MinhDev on 7/9/21.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
//    MARK: - Iboulet
    @IBOutlet weak var imageHomeCell: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
//        self.layer.giveShadowToTableViewCell(layer: self.layer, Bounds: self.bounds, cornerRadius: 10.0)
        // Initialization code
    }
//  MARK: - Variables
    func configure(model: MovieDataModel) {
        imageHomeCell.downloaded(from: model.Posterpath ?? "" )
    }

}
