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
    
    func refresh(user: String, callBack: () -> Void) {
        let user = user
        
        let userQuery = PFUser.query()
        userQuery!.getObjectInBackgroundWithId(user) {
            (user: PFObject?, error: NSError?) -> Void in
            if error != nil {
                print(error)
            } else if let user = user {
                self.user = PFUser.currentUser()!
                self.team = user["team"] as? Team
                print(self.team)
                
                let goalQuery = Goal.query()!
                goalQuery.whereKey("user", equalTo: self.user!)
                goalQuery.whereKey("team", equalTo: self.team!)
                
                goalQuery.findObjectsInBackgroundWithBlock { (objects: [PFObject]?, error: NSError?) -> Void in
                    if error == nil {
                        if let objects = objects as? [Goal], firstGoal = objects.first {
                            self.goal = firstGoal
                            print("refresh user is \(self.user!)")
                            print("refresh team is \(self.team!)")
                            print("refresh goal is \(self.goal!)")
                            callBack()
                        }
                    }
                }
                
            }
        }
    }
    
    
    
    
    
    
}
