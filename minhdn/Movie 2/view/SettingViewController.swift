//
//  MeViewController.swift
//  Movie 2
//
//  Created by MinhDev on 7/29/21.
//

import UIKit

class SettingViewController: UIViewController {
    //  MARK:   - Outlets
    @IBOutlet private weak var SettingTableView: UITableView!
    // MARK:    -   Veriables
    var sectionText = ["Profile", "Setting"]
    var setting = ["Notifications", "Dark Mode","Share","Polyci" ]
    var profile = ["profile edit"]
    var models = [Sections]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        view.addSubview(SettingTableView)
        SettingTableView.register(StandardTableViewCell.self, forCellReuseIdentifier: StandardTableViewCell.indentifier)
        SettingTableView.register(SwitchTableViewCell.self, forCellReuseIdentifier: SwitchTableViewCell.indentifier)
        SettingTableView.delegate = self
        SettingTableView.dataSource = self
        setupNavigationBar()
    }
}

    //  MARK:  - Datasource
extension SettingViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        switch model.self {
        case.standardCell(let model):
            guard let cell = self.SettingTableView.dequeueReusableCell(withIdentifier: Constants.standardTableViewCell , for: indexPath) as? StandardTableViewCell else  { return UITableViewCell()}
            cell.configure(with: model)
            return cell
        case.switchCell(let model):
            guard let cell = self.SettingTableView.dequeueReusableCell(withIdentifier: Constants.switchTableViewCell , for: indexPath) as? SwitchTableViewCell else  { return UITableViewCell()}
            cell.configure(with: model)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let type = models[indexPath.section].options[indexPath.row]
        switch type.self {
        case.standardCell(let model):
            model.handler()
        case.switchCell(let model):
            model.handler()
        }
    }
    
}
//  MARK:   - Delegate
extension SettingViewController: UITableViewDelegate{
    
}
