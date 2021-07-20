//
//  UpTableViewCell.swift
//  Movie 2
//
//  Created by MinhDev on 7/15/21.
//

import UIKit
import FSPagerView

class UpTableViewCell: UITableViewCell {
    //  MARK: - IBoutlet
   
    
    @IBOutlet weak var FSView: FSPagerView!{
        didSet{
            self.FSView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "UpTableViewCell")
            self.FSView.transformer = FSPagerViewTransformer(type: .linear)
        }
    }
    //    MARK: - Veriables
//    anh check giup em
    private var cellData = [MovieDataModel](){
        didSet{
            FSView.reloadData()
        }
    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //    FSView.reloadData()
        //   cellData = APIService.load("Movie.json")
    }
}
//  MARK: - DataSource
extension UpTableViewCell: FSPagerViewDataSource{
    
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return 8
        
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "UpTableViewCell", at: index)
        //        cell.imageView?.downloaded(from: cellData[index].backdroppath ?? "")
        cell.textLabel?.text = (cellData[index].title)!
        cell.textLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: 15.0)
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        return cell
        
    }
}

