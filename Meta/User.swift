//
//  UserData.swift
//  ParseStarterProject-Swift
//
//  Created by Austin Bagley on 1/2/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import Foundation
import Parse

class User: PFUser {
    
    // MARK: Properties
    
    var userFirstName: String?
    var userLastName: String?
    var userCurrentTeam: String?
    
    
    // MARK: Init
    
    override init() {
        super.init()
        
        self.username = ((PFUser.currentUser()?.username!)!)
        self.userFirstName = ((PFUser.currentUser()?["FirstName"]!)!) as? String
        self.userLastName = ((PFUser.currentUser()?["LastName"]!)!) as? String
        self.email = self.username
        self.userCurrentTeam = ((PFUser.currentUser()?["CurrentTeam"]!)!) as? String
        
        
    }
    
}


