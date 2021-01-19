//
//  HomeContent.swift
//  CoolDeal
//
//  Created by Nguyễn Đức Huy on 1/15/21.
//  Copyright © 2021 Nguyễn Đức Huy. All rights reserved.
//

import Foundation
import UIKit.UIImage

class HomeContent {
    var image: UIImage?
    var imageUrl: String?
    var title: String?
    var intro: String?
    var subtitle: String?
    
    init(_ dictionary: [String: Any]) {
        self.imageUrl = dictionary[HomeContent.InfoKey.imageUrl] as? String
        self.title = dictionary[HomeContent.InfoKey.title] as? String
        self.intro = dictionary[HomeContent.InfoKey.intro] as? String
        self.subtitle = dictionary[HomeContent.InfoKey.subtile] as? String
    }
    
    struct InfoKey {
        static let image = "image"
        static let imageUrl = "imageUrl"
        static let title = "title"
        static let intro = "intro"
        static let subtile = "subtitle"
    }
    
}

