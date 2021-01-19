//
//  CategoriesCollectionView.swift
//  CoolDeal
//
//  Created by Nguyễn Đức Huy on 1/15/21.
//  Copyright © 2021 Nguyễn Đức Huy. All rights reserved.
//

import UIKit
//UICollectionViewFlowLayout
class CategoriesCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var data: [(imageName: String, title: String)] = [
        ("food", "Food"), ("bag", "Bag"),
        ("book", "Book"), ("clothes", "Clothes"),
        ("shoe", "Shoe"), ("hotel&resort", "Relaxation"),
        ("technology", "Technology"), ("traveling", "Traveling")
    ]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.cellId, for: indexPath) as! CategoryCell
        
        cell.categoryBlockView.imageView.image = UIImage(named: data[indexPath.row].imageName)
        cell.categoryBlockView.titleLabel.text = data[indexPath.row].title
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 80)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.cellId)
        self.delegate = self
        self.dataSource = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


