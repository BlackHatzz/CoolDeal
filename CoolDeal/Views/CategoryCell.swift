//
//  CategoryCell.swift
//  CoolDeal
//
//  Created by Nguyễn Đức Huy on 1/15/21.
//  Copyright © 2021 Nguyễn Đức Huy. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    override func prepareForReuse() {
        super.prepareForReuse()
        categoryBlockView.imageView.image = nil
        categoryBlockView.titleLabel.text = nil
    }
    
    static let cellId = "CategoryCellId"
    let categoryBlockView = CategoryBlockView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        categoryBlockView.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.clear
        addSubview(categoryBlockView)
        
        categoryBlockView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        categoryBlockView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        categoryBlockView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        categoryBlockView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
