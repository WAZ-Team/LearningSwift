//
//  SearchCollectionViewCell.swift
//  Movie 2
//
//  Created by MinhDev on 8/2/21.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageSearch: UIImageView!
    @IBOutlet weak var titleSearch: UILabel!
    @IBOutlet weak var releaseSearch: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageSearch.layer.cornerRadius = 20.0
        imageSearch.clipsToBounds = true
        imageSearch.layer.borderWidth = 2.0
    }
    func configure(model: MovieDataModel) {
        imageSearch.downloaded(from: model.Posterpath ?? "" )
    }
}
