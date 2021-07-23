//
//  homTabBarcontroller.swift
//  Movie 2
//
//  Created by MinhDev on 7/20/21.
//

import UIKit

class homTabBarcontroller: UITabBarController,UITabBarControllerDelegate {
    let tabBarOrderKey = "tabBarOrderKey"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
        configItewControllers()
        setUpTabBarItemTags()
        
        guard AppDelegate.isDark else { return }
        tabBar.tintColor = UIColor.green
        tabBar.barTintColor = UIColor.black
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        guard AppDelegate.isDark else { return }
        configMoreViewController()
    }
    
    func configItewControllers() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        var conrollers = [NavigationViewController]()
        for index in 0..<TabBarItemTag.allCases.count {
            let conroller = storyBoard.instantiateViewController(withIdentifier: "NavigationViewController") as! NavigationViewController
            let item = TabBarItemTag.allCases[index]
            conroller.viewControllers.first?.tabBarItem = UITabBarItem.init(title: item.title, image: UIImage(named: item.image), selectedImage: UIImage(named: item.selectedImage))
            conrollers.append(conroller)
        }

        self.viewControllers = conrollers
    }
   
    func configMoreViewController() {
        moreNavigationController.navigationBar.barStyle = .black
        moreNavigationController.navigationBar.tintColor = UIColor.white
        moreNavigationController.topViewController?.view.backgroundColor = UIColor.black
        (moreNavigationController.topViewController?.view as? UITableView)?.separatorStyle = .none
        (moreNavigationController.topViewController?.view as? UITableView)?.tintColor = UIColor.lightGray
        if let cells = (moreNavigationController.topViewController?.view as? UITableView)?.visibleCells {
            for cell in cells {
                cell.backgroundColor = UIColor.clear
                cell.textLabel?.textColor = UIColor.lightGray
            }
        }
    }
    
    func setUpTabBarItemTags() {
        guard let viewControllers = viewControllers else { return }
        for (index, view) in viewControllers.enumerated() {
            view.tabBarItem.tag = index
        }
    }
    

    func tabBarController(_ tabBarController: UITabBarController, willBeginCustomizing viewControllers: [UIViewController]) {
        guard AppDelegate.isDark else { return }
        (tabBarController.view.subviews[1].subviews[1] as? UINavigationBar)?.barStyle = .black
        (tabBarController.view.subviews[1].subviews[1] as? UINavigationBar)?.tintColor = UIColor.white
        tabBarController.view.subviews[1].backgroundColor = UIColor.black
        tabBarController.view.subviews[1].tintColor = UIColor.green
    }
    func createTabbarView() {
        let tabItemOne = UITabBarItem()
        let tabControllerOne = HomeMovieViewControllers()
        tabControllerOne.tabBarItem = tabItemOne
        
        let tabItemTwo = UITabBarItem()
        let tabControllerTwo = FavViewController()
        tabControllerTwo.tabBarItem = tabItemTwo
        
        let tabItemThree = UITabBarItem()
        let tabControllerThree = SeachViewController()
        tabControllerThree.tabBarItem = tabItemThree
        
        self.setViewControllers([tabControllerOne, tabControllerTwo, tabControllerThree], animated: true)
    }
}
