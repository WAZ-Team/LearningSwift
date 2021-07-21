//
//  SlideMenu.swift
//  Movie 2
//
//  Created by MinhDev on 7/21/21.
//

import UIKit
enum Menutype: Int{
    case Person
    case Profile
    case Settings
    case Logout
}
class SlideMenu: UITableViewController {

    @IBOutlet weak var ImageAccout: UIImageView!
    var didTapMenuType: ((Menutype) -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        ImageAccout.clipsToBounds = true
        ImageAccout.layer.cornerRadius = 30
        ImageAccout.translatesAutoresizingMaskIntoConstraints = false
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menutype = Menutype(rawValue: indexPath.row) else {return}
        dismiss(animated: true){[weak self] in
            print("\(menutype)")
            self?.didTapMenuType?(menutype)
        }
    }

}
