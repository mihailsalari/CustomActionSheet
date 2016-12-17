//
//  Itemeable.swift
//  CustomActionSheet
//
//  Created by Mihail Șalari on 12/17/16.
//  Copyright © 2016 Mihail Șalari. All rights reserved.
//

import Foundation

protocol Itemeable {
    var sections: [String] { get }
    var items: [[String]] { get }
    var icons: [[String]] { get }
}


extension Itemeable {
    
    var sections: [String] {
        return ["1", "2", "3"]
    }
    
    var items: [[String]] {
        return [["E-mail", "Send to your e-mail", "Send as jpg"],
                ["Open as..", "Print", "iCoud"],
                ["Dropbox", "GoogleDrive", "Evernote", "Yandex Disk", "Box"]]
    }
    
    var icons: [[String]] {
        return [["shareMail", "sendMail", "sendJPG"],
                ["openIn", "print", "printCopy"],
                ["dropBox", "googleDrive", "evernote", "yandi", "box"]]
    }
}
