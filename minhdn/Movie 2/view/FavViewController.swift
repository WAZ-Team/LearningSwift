//
//  FavViewController.swift
//  Movie 2
//
//  Created by MinhDev on 7/21/21.
//

import UIKit

class FavViewController: UIViewController {

    @IBOutlet weak var favCollectionview: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Favorite"
    }
    

  
}
