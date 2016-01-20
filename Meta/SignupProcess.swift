////
////  SignupProcess.swift
////  ParseStarterProject-Swift
////
////  Created by Austin Bagley on 1/2/16.
////  Copyright © 2016 Parse. All rights reserved.
////
//
//import Foundation
//import Parse
//import Bolts
//
//
//class SignupProcess {
//    
//    // MARK: Properties
//    
//    var team = PFObject(className: "Team")
//    var currentUser = PFUser.currentUser()
//    var goalObjectId = ""
//    var users = PFUser()
//
//    
//    
//    // MARK: Actions
//    
//    
//    // Create Team & Update User with Team Object ID
//    
//    func getObjectIdForName(name: String, className: String) -> String? {
//        let name = name
//        let className = className
//        var objectId = ""
//        
//        let query = PFQuery(className: className)
//        query.whereKey("teamName", equalTo: name)
//        let teamArray = try! query.findObjects()
//        
//        objectId = teamArray[0].objectId!
//        
//        print("Team Object ID is: \(objectId)")
//        return objectId
//    }
//    
//    
//    func setGoalType(isWeightGoal: Bool, callBack: () -> Void) {
//        let isWeightGoal = isWeightGoal
//        let currentUser = (self.currentUser?.objectId!)!
//        
//        let goalType = PFObject(className:"GoalType")
//        goalType["isWeightGoal"] = isWeightGoal
//        goalType["userId"] = currentUser
//        
//        goalType.saveInBackgroundWithBlock {
//            (success: Bool, error: NSError?) -> Void in
//            if (success) {
//                // The object has been saved.
//                self.goalObjectId = goalType.objectId!
//                print("Goal type is saved with Object ID of \(self.goalObjectId)")
//                callBack()
//            } else {
//                // There was a problem, check error.description
//            }
//        }
//        
//    }
//    
//    
//    func setWeightGoal(startWeight: Double, endWeight: Double, callBack: () -> Void) {
//        
//        let startWeight = startWeight
//        let endWeight = endWeight
//        let totalWeightLoss = startWeight - endWeight
//        
//        let weightGoal = PFObject(className: "WeightGoal")
//        weightGoal["startWeight"] = startWeight
//        weightGoal["endWeight"] = endWeight
//        weightGoal["totalWeightLoss"] = totalWeightLoss
//        weightGoal["goalObjectId"] = self.goalObjectId
//        
//        weightGoal.saveInBackgroundWithBlock {
//            (success: Bool, error: NSError?) -> Void in
//            if (success) {
//                // The object has been saved.
//                print("Weight goal of \(totalWeightLoss) pounds has been recorded")
//                callBack()
//            } else {
//                print(error)
//            }
//        }
//    }
//    
//    
//    
//    
//    
//}
