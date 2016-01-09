//
//  UserData.swift
//  ParseStarterProject-Swift
//
//  Created by Austin Bagley on 1/2/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import Foundation
import Parse

class UserData {
    
    // MARK: Properties
    
    var userObjectId: String
    var username: String
    var userFirstName: String
    var userLastName: String
    var teamObjectId = ""
    var goalObjectId = ""
    var isWeightGoal = ""
    var startWeightGoal = 0
    var endWeightGoal = 0
    
    // MARK: Init
    
    init() {
        
        self.userObjectId = ((PFUser.currentUser()?.objectId!)!)
        self.username = ((PFUser.currentUser()?.username!)!)
        self.userFirstName = ((PFUser.currentUser()?["FirstName"]!)!) as! String
        self.userLastName = ((PFUser.currentUser()?["LastName"]!)!) as! String
        
    }
    
    
    // MARK: Actions
    
    
    
}


