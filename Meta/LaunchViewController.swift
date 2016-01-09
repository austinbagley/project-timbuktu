//
//  LaunchView.swift
//  ParseStarterProject-Swift
//
//  Created by Austin Bagley on 1/4/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {
    
    let colors = Colors()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refresh()
    }
    
    
    func refresh() {
        view.backgroundColor = UIColor.clearColor()
        let backgroundLayer = colors.gl
        backgroundLayer.frame = view.frame
        view.layer.insertSublayer(backgroundLayer, atIndex: 0)
    }
    
    
}
