//
//  TabController.swift
//  kinoApp
//
//  Created by Даниил Кискин on 31.10.2025.
//

import UIKit

class TabController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabs()
        tabBar.backgroundColor = UIColor(named: "Background")
        tabBar.tintColor = UIColor(named: "Imperial red")
        tabBar.barTintColor = UIColor(named: "Background 3")
    }
   
    // MARK: - Tab Setup
    private func setupTabs(){
    
        let main = self.createTabItem(image: UIImage(named: "Billboard"), vc: MainPageVC())
        let eat = self.createTabItem(image: UIImage(named: "Food"), vc: EatVC())
        let profile = self.createTabItem(image: UIImage(named: "Profile"), vc: ProfileVC())
        
        self.setViewControllers([main, eat, profile], animated: true)
    }
    
    private func createTabItem(image: UIImage?, vc: UIViewController) -> UINavigationController{
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.image = image
        return nav
    }
}
