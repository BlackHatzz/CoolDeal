//
//  ProductController.swift
//  CoolDeal
//
//  Created by Nguyễn Đức Huy on 1/19/21.
//  Copyright © 2021 Nguyễn Đức Huy. All rights reserved.
//

import UIKit


class ProductController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    let searchButton = UIButton()
    let shoppingBagButton = ShoppingBagButton()
    
    let productsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = true
        collectionView.alwaysBounceVertical = true
        collectionView.alwaysBounceHorizontal = false
        collectionView.backgroundColor = UIColor.clear
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        navigationItem.title = "COOL DEAL"
        productsCollectionView.delegate = self
        productsCollectionView.dataSource = self
        productsCollectionView.register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.cellId)
        
        setupViews()
        setupNavBar()
    }
    
    private func setupNavBar() {
        // set back button
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        
        shoppingBagButton.frame = CGRect(x: 0, y: 5, width: 30, height: 25)
        shoppingBagButton.tag = 2
        shoppingBagButton.addTarget(self, action: #selector(handleRightNavBarItem(_:)), for: UIControl.Event.touchUpInside)
        
        //        searchButton.backgroundColor = UIColor.green
        let searchImageView = UIImageView()
        searchImageView.image = UIImage(named: "search.png")
        searchImageView.isUserInteractionEnabled = false
        searchButton.addSubview(searchImageView)
        
        searchButton.frame = CGRect(x: 0, y: 0, width: 25, height: 20)
        searchImageView.frame = CGRect(x: 2, y: 8, width: 22, height: 22)
        
        searchButton.tag = 1
        
        searchButton.addTarget(self, action: #selector(handleRightNavBarItem(_:)), for: UIControl.Event.touchUpInside)
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: shoppingBagButton), UIBarButtonItem(customView: searchButton)]
        
    }
    
    @objc func handleRightNavBarItem(_ sender: UIButton) {
        print("sender", sender.tag)
        
        switch sender.tag {
        case 1:
            // searchButton
//            let viewController = SearchingController()
//            let navigationController = UINavigationController(rootViewController: viewController)
//            self.navigationController?.present(navigationController, animated: true, completion: nil)
            print("case 1")
        case 2:
            let viewController = BagController()
            let navigationController = UINavigationController(rootViewController: viewController)
            self.navigationController?.present(navigationController, animated: true, completion: nil)
        default:
            assertionFailure("Action is not supported")
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = false
        navigationItem.backBarButtonItem = UIBarButtonItem(title: nil, style: .plain, target: nil, action: nil)
    }
    
    private func setupViews() {
        view.addSubview(productsCollectionView)
        
        productsCollectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        productsCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        productsCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        productsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
// --------------------------------------------------------------------------
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.cellId, for: indexPath) as! ProductCell
        
        cell.productImageView.image = UIImage(named: (indexPath.row % 2 == 0) ? "6-3" : "9-0")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 25
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 2 - 10, height: 350)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = Product()
        
        let viewController = ProductDetailController(ofProduct: product)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
// --------------------------------------------------------------------------
}



