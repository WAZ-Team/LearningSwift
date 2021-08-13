//
//  HomeCollectionViewCell.swift
//  Movie 2
//
//  Created by MinhDev on 7/9/21.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    //  MARK: - Iboulet
    @IBOutlet weak var imageHomeCell: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        imageHomeCell.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageHomeCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        imageHomeCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        imageHomeCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
 
    }
    //  MARK: - Variables
    func configure(model: MovieDataModel) {
        imageHomeCell.downloaded(from: model.Posterpath ?? "" )
    }

}
