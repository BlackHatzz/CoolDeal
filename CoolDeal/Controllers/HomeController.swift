//
//  HomeController.swift
//  CoolDeal
//
//  Created by Nguyễn Đức Huy on 1/14/21.
//  Copyright © 2021 Nguyễn Đức Huy. All rights reserved.
//

import UIKit
import Firebase

class HomeController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let categoryView = CategoryBlockView()
    let topLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textAlignment = NSTextAlignment.center
        typealias Key = NSMutableAttributedString.Key
        let attributedText = NSMutableAttributedString(string: "CHOOSE YOUR CATEGORY", attributes: [Key.kern: 1.5, Key.font : UIFont.systemFont(ofSize: 18, weight: .medium)])
        
        label.attributedText = attributedText
        return label
    }()
    
    let categoriesCollectionView: CategoriesCollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = CategoriesCollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.clear
        collectionView.isScrollEnabled = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    let mainScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = UIColor.clear
        scrollView.showsHorizontalScrollIndicator = true
        scrollView.showsVerticalScrollIndicator = true
        scrollView.alwaysBounceVertical = true
        scrollView.alwaysBounceHorizontal = false
        return scrollView
    }()
    
    private(set) var eventsCollectionView: UICollectionView
    private static let cellId = "cellId"
    
    var homeContents = [HomeContent]()
    let loadingView = ProcessView(title: "Loading", type: ProcessView.NotiType.loading)
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        self.navigationItem.title = "COOL DEAL"
        
        // add mainScrollView
        view.addSubview(mainScrollView)
        
        mainScrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mainScrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        mainScrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        mainScrollView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        mainScrollView.contentSize = CGSize(width: view.frame.width, height: 4000)
        
//        mainScrollView.addSubview(topLabel)
//        mainScrollView.addSubview(categoriesCollectionView)
//
//        topLabel.topAnchor.constraint(equalTo: mainScrollView.topAnchor, constant: 24).isActive = true
//        topLabel.centerXAnchor.constraint(equalTo: mainScrollView.centerXAnchor).isActive = true
////        topLabel.left.constraint(equalTo: mainScrollView.topAnchor).isActive = true
////        topLabel.topAnchor.constraint(equalTo: mainScrollView.topAnchor).isActive = true
////        topLabel.topAnchor.constraint(equalTo: mainScrollView.topAnchor).isActive = true
//
//        categoriesCollectionView.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 24).isActive = true
//        categoriesCollectionView.leftAnchor.constraint(equalTo: mainScrollView.leftAnchor, constant: 12).isActive = true
//        categoriesCollectionView.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor, constant: -12*2).isActive = true
//        categoriesCollectionView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        // show loading view when no data
//        view.addSubview(loadingView)
//        loadingView.removeFromSuperview()
        // start load data from database(firebase)
//        loadDataFromFirebase()
        
        // set up collection view
        eventsCollectionView.backgroundColor = UIColor.white
        eventsCollectionView.register(HomeCell.self, forCellWithReuseIdentifier: HomeController.cellId)
        eventsCollectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        eventsCollectionView.showsVerticalScrollIndicator = false
        eventsCollectionView.showsHorizontalScrollIndicator = false
        eventsCollectionView.isScrollEnabled = false
        
        mainScrollView.addSubview(eventsCollectionView)
        eventsCollectionView.backgroundColor = .white
        
        // Setup Autolayout constraints
        eventsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        eventsCollectionView.topAnchor.constraint(equalTo: mainScrollView.topAnchor, constant: 0).isActive = true
        eventsCollectionView.leftAnchor.constraint(equalTo: mainScrollView.leftAnchor, constant: 0).isActive = true
        eventsCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 0).isActive = true
        eventsCollectionView.heightAnchor.constraint(equalToConstant: 1000).isActive = true
        
        // Setup `dataSource` and `delegate`
        eventsCollectionView.dataSource = self
        eventsCollectionView.delegate = self
        
        (eventsCollectionView.collectionViewLayout as! UICollectionViewFlowLayout).estimatedItemSize = UICollectionViewFlowLayout.automaticSize
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        DispatchQueue.main.async {
            self.view.setNeedsDisplay()
            
            self.categoriesCollectionView.constraints.forEach({ (constraint) in
                if constraint.firstItem === self.categoriesCollectionView {
                    if constraint.firstAttribute == .height {
                        constraint.constant = self.categoriesCollectionView.contentSize.height
                    }
                }
            })
            
            self.eventsCollectionView.constraints.forEach({ (constraint) in
                if constraint.firstItem === self.eventsCollectionView {
                    if constraint.firstAttribute == .height {
                        constraint.constant = self.eventsCollectionView.contentSize.height
                    }
                }
            })
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sampleData.count
    }
    
    let sampleData = [
        "home-0", "home-1", "home-2", "home-bag", "home-beach"
    ]
    
    init() {
        // Create new `UICollectionView` and set `UICollectionViewFlowLayout` as its layout
        eventsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        eventsCollectionView.backgroundColor = .clear
        
        
        
        super.init(nibName: nil, bundle: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeController.cellId, for: indexPath) as! HomeCell
        
        if indexPath.row == 0 {
            cell.style = .topContent
            cell.topLabel.text = "Order Now"//attributedText = NSMutableAttributedString(string: "ORDER NOW", attributes: [NSAttributedString.Key.kern : 1.5, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.semibold)])
        } else {
            cell.style = .default
        }
        
        cell.imageView.image = UIImage(named: sampleData[indexPath.row])
        cell.imageStatus = .loaded
//
//        if let image = homeContents[indexPath.row].image {
//            cell.imageView.image = image
//            cell.imageStatus = .loaded
//        }
//
//        cell.titleLabel.text = homeContents[indexPath.row].title?.uppercased()
//        cell.introLabel.text = homeContents[indexPath.row].intro?.uppercased()
//        cell.subtitleLabel.text = homeContents[indexPath.row].subtitle?.uppercased()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let referenceHeight: CGFloat = 500 // Approximate height of your cell
        return CGSize(width: self.view.frame.width, height: referenceHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //        let viewController = ProductViewController(collectionViewLayout: UICollectionViewFlowLayout())
//        let viewController = ProductViewController(category: nil)
        //        let navController = UINavigationController(rootViewController: viewController)
//        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
