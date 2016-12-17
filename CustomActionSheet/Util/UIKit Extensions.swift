//
//  UIKit Extensions.swift
//  CustomActionSheet
//
//  Created by Mihail Șalari on 12/17/16.
//  Copyright © 2016 Mihail Șalari. All rights reserved.
//

import UIKit

extension UIColor {
    
    class func rgb(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    }
    
    class var darkSkyBlue: UIColor {
        return UIColor.rgb(red: 38.0, green: 128.0, blue: 228.0, alpha: 1.0)
    }
}


extension UIView {
    func addConstraintsWithFormat(_ format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}
