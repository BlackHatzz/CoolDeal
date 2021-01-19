//
//  TabBarController.swift
//  CoolDeal
//
//  Created by Nguyễn Đức Huy on 1/14/21.
//  Copyright © 2021 Nguyễn Đức Huy. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let homeController = HomeController()
        let homeNav = UINavigationController(rootViewController: homeController)
        homeNav.tabBarItem.image = UIImage(named: "home")
        homeNav.title = "Home"
        homeNav.navigationBar.isTranslucent = false
        homeNav.navigationBar.tintColor = UIColor.white
        
        let homeController2 = HomeController()
        homeController2.view.backgroundColor = UIColor.red
        let homeNav2 = UINavigationController(rootViewController: homeController2)
        homeNav2.title = "More"
        homeNav2.tabBarItem.image = UIImage(named: "more")
        homeNav2.navigationBar.isTranslucent = false
        homeNav2.navigationBar.tintColor = UIColor.white
        
        viewControllers = [homeNav, homeNav2]
        self.tabBar.isTranslucent = false
        UITabBar.appearance().tintColor = UIColor.black
    }
}
