//
//  ProductCollectionView.swift
//  CoolDeal
//
//  Created by Nguyễn Đức Huy on 1/20/21.
//  Copyright © 2021 Nguyễn Đức Huy. All rights reserved.
//

import UIKit

final class ProductCollectionView: UICollectionView {
    var statusCell = [String?]()
    struct StatusCellKey {
        static let initialization = "initialization"
        static let loading = "loading"
        static let loaded = "loaded"
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        assert(self.numberOfSections == 1, "number of section must be 1")
        self.statusCell = Array(repeating: ProductCollectionView.StatusCellKey.initialization, count: numberOfItems(inSection: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
