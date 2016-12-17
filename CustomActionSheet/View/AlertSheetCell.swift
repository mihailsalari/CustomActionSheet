//
//  AlertSheetCell.swift
//  CustomActionSheet
//
//  Created by Mihail Șalari on 12/17/16.
//  Copyright © 2016 Mihail Șalari. All rights reserved.
//

import UIKit

class AlertSheetCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Light", size: 12)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .black
        
        return label
    }()
    
    static let reuseIdentifier = "AlertSheetCell"
}


// MARK: - Layout

extension AlertSheetCell {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubview(nameLabel)
        addSubview(imageView)
        
        addConstraintsWithFormat("H:|-2-[v0]-2-|", views: nameLabel)
        addConstraintsWithFormat("H:|-2-[v0]-2-|", views: imageView)
        
        addConstraintsWithFormat("V:|-2-[v0]-4-[v1(32)]-2-|", views: imageView, nameLabel)
    }
}
