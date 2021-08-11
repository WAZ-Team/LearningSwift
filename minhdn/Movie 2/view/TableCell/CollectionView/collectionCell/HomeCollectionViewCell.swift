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
        guard AppDelegate.isDark else { return }
        self.contentView.backgroundColor = UIColor.black
    }
    //  MARK: - Variables
    func configure(model: MovieDataModel) {
        imageHomeCell.downloaded(from: model.Posterpath ?? "" )
    }

}
