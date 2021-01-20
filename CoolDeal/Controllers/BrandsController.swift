//
//  BrandsController.swift
//  CoolDeal
//
//  Created by Nguyễn Đức Huy on 1/19/21.
//  Copyright © 2021 Nguyễn Đức Huy. All rights reserved.
//

import UIKit

class BrandsController: UITableViewController {
    let loadingView = ProcessView(title: "Loading", type: ProcessView.NotiType.loading)
    
    var headers = [String]()
    var datas = [String: [String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // setupViews
        view.addSubview(loadingView)
        
        headers = ["A", "B", "C", "D"]
        datas = [
            "A" : ["Adidas", "Ami", "AZw"],
            "B" : ["Bdidas", "Bmi", "BZw"],
            "C" : ["Cdidas", "Cmi", "CZw"],
            "D" : ["Cdidas", "Cmi", "CZw"]
        ]
        
        view.backgroundColor = UIColor.white
        navigationItem.title = "BRANDS"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        tableView.alwaysBounceVertical = true
        tableView.showsVerticalScrollIndicator = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DesignerCell.self, forCellReuseIdentifier: DesignerCell.cellId)
        tableView.register(DesignerHeaderFooter.self, forHeaderFooterViewReuseIdentifier: DesignerHeaderFooter.id)
        
        // download data
//        setupContent()
    }
    
    
    
    // ------------------------------------------------------------------------------
    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 10
        return headers.count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = headers[section]
        return self.datas[key]?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DesignerCell.cellId, for: indexPath) as! DesignerCell
        cell.backgroundColor = UIColor.clear
        
        // get key of header
        let key = headers[indexPath.section]
        // set desinger name label text
        if let designerArray = datas[key] {
            cell.nameLabel.text = designerArray[indexPath.row]
        }
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: DesignerHeaderFooter.id) as! DesignerHeaderFooter
        
        // set header
        header.label.text = headers[section]
        
        return header
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: DesignerHeaderFooter.id) as! DesignerHeaderFooter
        
        return footer
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sectionKey: String = headers[indexPath.section]
        let designersInSection = datas[sectionKey]
        let designerInRow = designersInSection![indexPath.row]
        
//        let viewController = ProductViewController(designer: designerInRow)
//        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}

final class DesignerCell: UITableViewCell {
    static let cellId = "designerCellId"
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = false
        label.backgroundColor = UIColor.clear
        label.font = UIFont.helvetica(ofsize: 18)
        label.text = ""
        return label
    }()
    
    let loveBookmarkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = false
        imageView.backgroundColor = UIColor.clear
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
        imageView.image = UIImage(named: "love-bookmark")?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        imageView.tintColor = UIColor(white: 0.7, alpha: 1)
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    
    
    private func setupViews() {
        addSubview(nameLabel)
        addSubview(loveBookmarkImageView)
        
        nameLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 28).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: loveBookmarkImageView.leftAnchor, constant: -8).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        loveBookmarkImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        loveBookmarkImageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12).isActive = true
        loveBookmarkImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        loveBookmarkImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

final class DesignerHeaderFooter: UITableViewHeaderFooterView {
    static let id = "designerHeaderFooterId"
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.9, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = false
        return view
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = false
        label.backgroundColor = UIColor.clear
        label.font = UIFont.helvetica(ofsize: 17)
        label.text = ""
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    private func setupViews() {
        addSubview(containerView)
        
        containerView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        containerView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        containerView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        containerView.addSubview(label)
        
        label.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 16).isActive = true
        label.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

