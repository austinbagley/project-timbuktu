//
//  SignupProcess.swift
//  ParseStarterProject-Swift
//
//  Created by Austin Bagley on 1/2/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import Foundation
import Parse
import Bolts


class SignupProcess {
    
    // MARK: Properties
    
    var team = PFObject(className: "Team")
    var currentUser = PFUser.currentUser()
    var goalObjectId = ""
    var users = PFUser()

    
    
    // MARK: Actions
    
    
    // Create Team & Update User with Team Object ID
    
    func signUp(username: String?, password: String?, email: String?, firstName: String?, lastName: String?, callBack: () -> Void) -> String? {
        var responseString = "Nothing so far"
        let user = PFUser()
        
        user.username = username
        user.password = password
        user.email = email
        // other fields can be set just like with PFObject
        user["firstName"] = firstName
        user["lastName"] = lastName
        
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool, error: NSError?) -> Void in
            if let error = error {
                let errorString = error.userInfo["error"] as! String?
                responseString = errorString!
            } else {
                // Hooray! Let them use the app now.
                responseString = "Success"
                print(responseString)
                callBack()
            }
        }
        
        return responseString
        
    }
    
    func createTeam(teamName: String, teamPassword: String, endDate: NSDate?, callBack: () -> Void) {
        
        team["teamName"] = teamName
        team["teamPassword"] = teamPassword
        team["endDate"] = endDate
        
        team.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                print("team creation succeeded")
                
                let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
                dispatch_async(dispatch_get_global_queue(priority, 0)) {
                    self.updateUserWithTeamId(self.getObjectIdForName(teamName, className: "Team"))
                }
                dispatch_async(dispatch_get_main_queue()) {
                    // update some UI
                    callBack()
                }
            } else {
                print("team creation failed")
            }
        }
        
    }
    
    func updateUserWithTeamId(teamObjectId: String?) {
        let teamObjectId = teamObjectId
        let currentUser = (self.currentUser?.objectId!)!
        print("User Object ID is: \(currentUser)")
        
        let query = PFUser.query()
        query!.getObjectInBackgroundWithId(currentUser) {
            (user: PFObject?, error: NSError?) -> Void in
            if error != nil {
                print(error)
            } else if let user = user {
                user["teamObjectId"] = teamObjectId
                user.saveInBackground()
            }
        }
    }
    
    
    func getObjectIdForName(name: String, className: String) -> String? {
        let name = name
        let className = className
        var objectId = ""
        
        let query = PFQuery(className: className)
        query.whereKey("teamName", equalTo: name)
        let teamArray = try! query.findObjects()
        
        objectId = teamArray[0].objectId!
        
        print("Team Object ID is: \(objectId)")
        return objectId
    }
    
    
    func setGoalType(isWeightGoal: Bool, callBack: () -> Void) {
        let isWeightGoal = isWeightGoal
        let currentUser = (self.currentUser?.objectId!)!
        
        let goalType = PFObject(className:"GoalType")
        goalType["isWeightGoal"] = isWeightGoal
        goalType["userId"] = currentUser
        
        goalType.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                // The object has been saved.
                self.goalObjectId = goalType.objectId!
                print("Goal type is saved with Object ID of \(self.goalObjectId)")
                callBack()
            } else {
                // There was a problem, check error.description
            }
        }
        
    }
    
    
    func setWeightGoal(startWeight: Double, endWeight: Double, callBack: () -> Void) {
        
        let startWeight = startWeight
        let endWeight = endWeight
        let totalWeightLoss = startWeight - endWeight
        
        let weightGoal = PFObject(className: "WeightGoal")
        weightGoal["startWeight"] = startWeight
        weightGoal["endWeight"] = endWeight
        weightGoal["totalWeightLoss"] = totalWeightLoss
        weightGoal["goalObjectId"] = self.goalObjectId
        
        weightGoal.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                // The object has been saved.
                print("Weight goal of \(totalWeightLoss) pounds has been recorded")
                callBack()
            } else {
                print(error)
            }
        }
    }
    
    
    
    
    
}
