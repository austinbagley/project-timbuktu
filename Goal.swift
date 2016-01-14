//
//  Goal.swift
//  Meta
//
//  Created by Austin Bagley on 1/14/16.
//  Copyright © 2016 Bagley. All rights reserved.
//

import Foundation
import Parse


class Goal: PFObject, PFSubclassing {
    
    // Create Parse Subclass
    
    override class func initialize() {
        struct Static {
            static var onceToken : dispatch_once_t = 0;
        }
        dispatch_once(&Static.onceToken) {
            self.registerSubclass()
        }
    }
    
    static func parseClassName() -> String {
        return "Goal"
    }
    
    
    @NSManaged var user: User?
    @NSManaged var team: Team?
    
    var isWeightGoal: Bool?
    var startWeight: Double?
    var endWeight: Double?
    var totalWeightLoss: Double?
    var achieveTitle: String?
    var isAchieved: Bool?
    
    
    // Create
    
    init(startWeight: Double, endWeight: Double) {
        super.init()
        user = User.currentUser()
        isWeightGoal = true
        self.startWeight = startWeight
        self.endWeight = endWeight
        totalWeightLoss = startWeight - endWeight
        achieveTitle = nil
        isAchieved = nil
        
        let teamId = user?.userCurrentTeam
        self.team = getTeamObjectFromTeamObjectId(teamId)
    }
    
    init(achieveTitle: String) {
        super.init()
        user = User.currentUser()
        isWeightGoal = false
        startWeight = nil
        endWeight = nil
        totalWeightLoss = nil
        self.achieveTitle = achieveTitle
        isAchieved = false
        
        let teamId = user?.userCurrentTeam
        self.team = getTeamObjectFromTeamObjectId(teamId)
    
    }
    
    // Read
    
    init(id: String) {
        super.init()
        let goal = getGoalObjectFromGoalId(id)
        
        user = goal.user
        team = goal.team
        isWeightGoal = goal.isWeightGoal
        self.startWeight = goal.startWeight
        self.endWeight = goal.endWeight
        totalWeightLoss = goal.totalWeightLoss
        achieveTitle = goal.achieveTitle
        isAchieved = goal.isAchieved
    
    }
    
    // Actions
    
    func getGoalObjectFromGoalId(id: String?) -> Goal {
        let query = Goal.query()
        var goal: Goal?
        
        query!.whereKey("objectId", equalTo: id!)
        query!.findObjectsInBackgroundWithBlock { (objects: [PFObject]?, error: NSError?) -> Void in
            if error == nil {
                if let objects = objects as? [Goal], firstGoal = objects.first {
                    goal = firstGoal
                }
            }
        }
        return goal!
        
    }
    
    
    func getGoalObjectsForUserObject(user: PFUser) -> [Goal] {
        let query = Goal.query()
        var goals = [Goal]()
        
        query!.whereKey("User", equalTo: user)
        query!.findObjectsInBackgroundWithBlock { (objects: [PFObject]?, error: NSError?) -> Void in
            if error == nil {
                if let objects = objects as? [Goal] {
                    goals = objects
                }
            }
        }
        
        return goals
        
    }
    
    
    
    func getTeamObjectFromTeamObjectId(id: String?) -> Team {
        let query = Team.query()
        var team: Team?
        
        query!.whereKey("objectId", equalTo: id!)
        query!.findObjectsInBackgroundWithBlock { (objects: [PFObject]?, error: NSError?) -> Void in
            if error == nil {
                if let objects = objects as? [Team], firstTeam = objects.first {
                    team = firstTeam
                }
            }
        }
        return team!
    }
}
