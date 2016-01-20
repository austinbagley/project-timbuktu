//
//  UserDashboardData.swift
//  Meta
//
//  Created by Austin Bagley on 1/19/16.
//  Copyright © 2016 Bagley. All rights reserved.
//

import Parse

class UserDashboardData {
    
    static var sharedInstance = UserDashboardData()
    
    private init() {
        
        
    }
    
    
    var user: PFUser?
    var team: Team?
    var goal: Goal?
    var subGoal: [SubGoal]?
    
    
    // Actions
    
    
    
    
    
    
    
}
