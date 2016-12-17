//
//  AlertSheedDataSource.swift
//  CustomActionSheet
//
//  Created by Mihail Șalari on 12/17/16.
//  Copyright © 2016 Mihail Șalari. All rights reserved.
//

import UIKit

class AlertSheedDataSource: NSObject {
    
    // MARK: - Properties
    
    
    // MARK: - Initializers
    
    override init() {
        super.init()
    }
}


// MARK: - UICollectionViewDataSource

extension AlertSheedDataSource: UICollectionViewDataSource, Itemeable {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items[section].count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlertSheetCell.reuseIdentifier, for: indexPath) as! AlertSheetCell
        
        return cell
    }
}
