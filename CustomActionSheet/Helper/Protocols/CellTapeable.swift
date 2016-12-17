//
//  CellTapeable.swift
//  CustomActionSheet
//
//  Created by Mihail Șalari on 12/17/16.
//  Copyright © 2016 Mihail Șalari. All rights reserved.
//

import Foundation

protocol CellTapeable: class {
    func didSelectItemAt(_ indexPath: IndexPath)
}
