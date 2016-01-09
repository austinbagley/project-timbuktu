//
//  LaunchView.swift
//  ParseStarterProject-Swift
//
//  Created by Austin Bagley on 1/4/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit

class Colors {
    let colorTop = UIColor(rgba: "##8968CD").CGColor
    let colorBottom = UIColor(rgba: "#5D478B").CGColor
    
    let gl: CAGradientLayer
    
    init() {
        gl = CAGradientLayer()
        gl.colors = [ colorTop, colorBottom]
        gl.locations = [ 0.0, 1.0]
    }
}