//
//  ActionSheetLauncher.swift
//  CustomActionSheet
//
//  Created by Mihail Șalari on 12/17/16.
//  Copyright © 2016 Mihail Șalari. All rights reserved.
//

import UIKit

class ActionSheetLauncher: NSObject {
    
    // MARK: - Properties
    
    fileprivate lazy var window: UIWindow = {
        guard let window = UIApplication.shared.keyWindow else { return UIWindow() }
        
        return window
    }()
    
    fileprivate lazy var blackView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        view.alpha = 0.0
        view.frame = self.window.frame
        
        return view
    }()
    
    
    fileprivate lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        
        return view
    }()
    
    
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsetsMake(10, 0, 0, 0)
        //        layout.sectionInset = UIEdgeInsetsMake(<#T##top: CGFloat##CGFloat#>, <#T##left: CGFloat##CGFloat#>, <#T##bottom: CGFloat##CGFloat#>, <#T##right: CGFloat##CGFloat#>)
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = UIColor.rgb(red: 245.0, green: 245.0, blue: 247.0, alpha: 1.0)
        collection.layer.cornerRadius = 4.0
        
        return collection
    }()
    
    fileprivate let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Cancel", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 22)
        button.titleLabel?.textColor = UIColor.darkSkyBlue
        button.backgroundColor = UIColor.rgb(red: 245.0, green: 245.0, blue: 247.0, alpha: 1.0)
        button.layer.cornerRadius = 4.0
        
        return button
    }()
    
    fileprivate let dataSource = AlertSheedDataSource()
    fileprivate let delegate = AlertSheetDelegate()
    
    
    
    // MARK: - Initializers
    
    override init() {
        self.collectionView.register(AlertSheetCell.self, forCellWithReuseIdentifier: AlertSheetCell.reuseIdentifier)
        
        super.init()
        
        self.collectionView.dataSource = self.dataSource
        self.collectionView.delegate = self.delegate
        self.delegate.cellTapeableDegelate = self
    }
}


// MARK: - Show&Hide View

extension ActionSheetLauncher {
    
    func showActionSheet() {
        /// 1
        window.addSubview(blackView)
        window.addSubview(containerView)
        
        /// 2
//        blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
        cancelButton.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
        
        /// 3
        let contHeight: CGFloat = window.frame.height / 2
        let contY = window.frame.height - contHeight
        
        /// 4
        self.containerView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: contHeight)
        
        /// 5
        self.containerView.addSubview(cancelButton)
        self.containerView.addSubview(collectionView)
        
        /// 6
        self.containerView.addConstraintsWithFormat("H:|-7-[v0]-7-|", views: cancelButton)
        
        self.containerView.addConstraintsWithFormat("H:|-7-[v0]-7-|", views: collectionView)
        
        self.containerView.addConstraintsWithFormat("V:|-7-[v0]-5-[v1(60)]-7-|", views: collectionView, cancelButton)

        /// 7 Animation
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: { [unowned self] in
            self.blackView.alpha = 1.0
            self.containerView.frame = CGRect(x: 0, y: contY, width: self.containerView.frame.width, height: self.containerView.frame.height)
            
            }, completion: nil)
    }
    
    func handleDismiss() {
        UIView.animate(withDuration: 0.5) { [unowned self] in
            self.blackView.alpha = 0.0
            self.containerView.frame = CGRect(x: 0, y: self.window.frame.height, width: self.containerView.frame.width, height: self.containerView.frame.height)
        }
    }
}



// MAKR: - CellTapeable

extension ActionSheetLauncher: CellTapeable {
    
    func didSelectItemAt(_ indexPath: IndexPath) {
        self.handleDismiss()
        print("We have an action)")
    }
}
