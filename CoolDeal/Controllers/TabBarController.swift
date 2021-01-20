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
        
        let homeController2 = ProductController()
//        homeController2.view.backgroundColor = UIColor.red
        let homeNav2 = UINavigationController(rootViewController: homeController2)
        homeNav2.title = "More"
        homeNav2.tabBarItem.image = UIImage(named: "more")
        homeNav2.navigationBar.isTranslucent = false
        homeNav2.navigationBar.tintColor = UIColor.white
        
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
        
        let productDetailController = ProductDetailController()
        //        homeController2.view.backgroundColor = UIColor.red
        let productDetailNav = UINavigationController(rootViewController: productDetailController)
        productDetailNav.title = "zz"
        productDetailNav.tabBarItem.image = UIImage(named: "cate")
        productDetailNav.navigationBar.isTranslucent = false
        productDetailNav.navigationBar.tintColor = UIColor.white
        
        viewControllers = [homeNav, homeNav2, brandNav, cateNav, productDetailNav]
        self.tabBar.isTranslucent = false
        UITabBar.appearance().tintColor = UIColor.black
//        self.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 6, bottom: -6, right: -6)
    }
}
