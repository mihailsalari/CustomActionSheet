//
//  AlertSheetDelegate.swift
//  CustomActionSheet
//
//  Created by Mihail Șalari on 12/17/16.
//  Copyright © 2016 Mihail Șalari. All rights reserved.
//

import UIKit

class AlertSheetDelegate: NSObject {
    
    // MARK: - Properties
    
    weak var cellTapeableDegelate: CellTapeable?
    
    
    // MARK: - Initializers
    
    override init() {
        super.init()
    }
}


// MARK: - UICollectionViewDelegate

extension AlertSheetDelegate: UICollectionViewDelegate, Itemeable {
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let cell = cell as? AlertSheetCell {
            cell.nameLabel.text = self.items[indexPath.section][indexPath.row]
            cell.imageView.image = UIImage(named: self.icons[indexPath.section][indexPath.row])
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Section = \(indexPath.section)\nRow = \(indexPath.row)")
        self.cellTapeableDegelate?.didSelectItemAt(indexPath)
    }
}


// MARK: - UICollectionViewDelegateFlowLayout

extension AlertSheetDelegate: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 72, height: 72)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}
