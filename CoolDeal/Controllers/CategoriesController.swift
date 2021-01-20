//
//  CategoriesController.swift
//  CoolDeal
//
//  Created by Nguyễn Đức Huy on 1/19/21.
//  Copyright © 2021 Nguyễn Đức Huy. All rights reserved.
//

import UIKit

class CategoriesController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    let categoriesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 8
        layout.scrollDirection = UICollectionView.ScrollDirection.vertical
        let collectionView = UICollectionView(frame: CGRect.zero
            , collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.alwaysBounceVertical = true
        collectionView.backgroundColor = UIColor.clear
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        navigationItem.title = "CATEGORIES"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.register(CategoryCell2.self, forCellWithReuseIdentifier: CategoryCell2.cellId)
        
        setupViews()
        
        // load data
        
    }
    
    private func setupViews() {
        view.addSubview(categoriesCollectionView)
        
        categoriesCollectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        categoriesCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        categoriesCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        categoriesCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    // ------------------------------------------------------------------------------
    
    var categories: [(title: String, image: UIImage?)] = [
        ("Food", UIImage(named: "food-poster")),
        ("Bag", UIImage(named: "bag-poster")),
        ("Book", UIImage(named: "book-poster")),
        ("Clothes", UIImage(named: "clothes-poster")),
        ("Relaxation", UIImage(named: "relaxation-poster")),
        ("Shoe", UIImage(named: "shoe-poster")),
        ("Technology", UIImage(named: "tech-poster")),
        ("Travel", UIImage(named: "travel-poster"))
    ]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell2.cellId, for: indexPath) as! CategoryCell2
        
        cell.imageView.image = categories[indexPath.row].image
        cell.titleLabel.text = categories[indexPath.row].title
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: self.view.frame.width * 9 / 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let viewController = ProductViewController(category: categories[indexPath.row].title)
//        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

// ------------------------------------------------------------------------------
// ------------------------------------------------------------------------------
// ------------------------------------------------------------------------------

class CategoryCell2: UICollectionViewCell {
    static let cellId = "CategoryCell2Id"
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        DispatchQueue.main.async {
            self.setNeedsDisplay()
            self.titleLabel.setNeedsDisplay()
            let estimatedSize = self.titleLabel.sizeThatFits(CGSize(width: self.frame.width, height: 35))
            self.titleLabel.frame.size.width = estimatedSize.width + 34
        }
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        DispatchQueue.main.async {
            self.setNeedsDisplay()
            self.titleLabel.setNeedsDisplay()
            let estimatedSize = self.titleLabel.sizeThatFits(CGSize(width: self.frame.width, height: 35))
            self.titleLabel.frame.size.width = estimatedSize.width + 34
        }
    }
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor.gray
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "SHOES"
        label.backgroundColor = UIColor.black
        label.textColor = UIColor.white
        return label
    }()
    
    let activityIndicatorView: UIActivityIndicatorView = {
        let activityIndicatorView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge)
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorView.isUserInteractionEnabled = false
        activityIndicatorView.layer.zPosition = 2
        activityIndicatorView.color = UIColor.black
        activityIndicatorView.hidesWhenStopped = true
        return activityIndicatorView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // setup views
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(activityIndicatorView)
        
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        // titleLabel set width in didMoveToSuperView() function
        
        activityIndicatorView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        activityIndicatorView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        activityIndicatorView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        activityIndicatorView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        //        titleLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

