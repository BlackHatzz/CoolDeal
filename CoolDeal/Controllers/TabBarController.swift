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
        
        let brandsController = BrandsController()
        //        homeController2.view.backgroundColor = UIColor.red
        let brandNav = UINavigationController(rootViewController: brandsController)
        brandNav.title = "Brands"
        brandNav.tabBarItem.image = UIImage(named: "tag-2")
        brandNav.navigationBar.isTranslucent = false
        brandNav.navigationBar.tintColor = UIColor.white
        
        let cateController = CategoriesController()
        //        homeController2.view.backgroundColor = UIColor.red
        let cateNav = UINavigationController(rootViewController: cateController)
        cateNav.title = "Categories"
        cateNav.tabBarItem.image = UIImage(named: "cate")
        cateNav.navigationBar.isTranslucent = false
        cateNav.navigationBar.tintColor = UIColor.white
        
        
        viewControllers = [homeNav, brandNav, cateNav]
        self.tabBar.isTranslucent = false
        UITabBar.appearance().tintColor = UIColor.black
//        self.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 6, bottom: -6, right: -6)
    }
}
