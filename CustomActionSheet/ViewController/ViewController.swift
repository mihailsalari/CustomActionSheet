//
//  ViewController.swift
//  CustomActionSheet
//
//  Created by Mihail Șalari on 12/17/16.
//  Copyright © 2016 Mihail Șalari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
    
    fileprivate let launcher = ActionSheetLauncher()
    
    
    
    // MARK: - LyfeCicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


extension ViewController {
    
    @IBAction func shareTappet(_ sender: UIBarButtonItem) {
        launcher.showActionSheet()
    }
}

