//
//  SignUpData.swift
//  Meta
//
//  Created by Austin Bagley on 1/17/16.
//  Copyright © 2016 Bagley. All rights reserved.
//

import Foundation
import Parse


class SignUpData {
    
    static let sharedInstance = SignUpData()
    
    private var user: PFUser?
    private var team: Team?
    private var goal: Goal?
    private var subGoals: [SubGoal]?
    
    
    private init () {
        
    }
    
    
}
