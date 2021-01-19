//
//  CategoryBlockView.swift
//  CoolDeal
//
//  Created by Nguyễn Đức Huy on 1/15/21.
//  Copyright © 2021 Nguyễn Đức Huy. All rights reserved.
//

import UIKit

class CategoryBlockView: UIView {
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .clear
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = false
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.text = "title"
        label.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.light)
        label.numberOfLines = 3
        label.isUserInteractionEnabled = false
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.white
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 4
        self.layer.borderWidth = 1.5
        self.layer.borderColor = UIColor(white: 0.8, alpha: 1).cgColor
        
        // set up views
        addSubview(imageView)
        addSubview(titleLabel)
        
        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 6).isActive = true
        imageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 14).isActive = true
        imageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -14).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 2).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -2).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -2).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
