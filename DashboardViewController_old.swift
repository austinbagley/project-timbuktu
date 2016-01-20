////
////  DashboardViewController.swift
////  ParseStarterProject-Swift
////
////  Created by Austin Bagley on 1/2/16.
////  Copyright © 2016 Parse. All rights reserved.
////
//
//import UIKit
//import Parse
//
//
//class DashboardViewController: UIViewController {
//    
//    // MARK: Constants
//    
//    // MARK: Properties
//    
//    var currentUser = PFUser.currentUser()
//    var currentUserId = (PFUser.currentUser()?.objectId!)!
//    var teamObjectId = ""
//    var teamInfo: PFObject?
//    var goalType: PFObject?
//    var weightGoal: PFObject?
//    var goalId: String?
//    var isWeightGoal: Bool?
//    var teamName: String?
//    var teamEndDate: NSDate?
//    var userFirstName: String?
//    var userGoalText: String?
//    
//    
//    // MARK: Outlets
//    
//    @IBOutlet weak var challengeName: UILabel!
//    @IBOutlet weak var endDate: UILabel!
//    @IBOutlet weak var userFullName: UILabel!
//    @IBOutlet weak var userGoal: UILabel!
//    
//    // MARK: View Controller lifecycle
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        getTeamInfo()
//        getGoalTypeFromUser()
//        
//    }
//    
//    // MARK: Actions
//    
//    func getTeamInfo() {
//        let query = PFQuery(className: "Team")
//        query.getObjectInBackgroundWithId(self.getTeamIdFromUser()) {
//            (team: PFObject?, error: NSError?) -> Void in
//            if error == nil && team != nil {
//                print(team)
//                self.teamInfo = team
//                self.teamName = team!["teamName"] as? String
//                self.teamEndDate = team!["endDate"] as? NSDate!
//                self.updateUI()
//            } else {
//                print(error)
//            }
//        }
//    }
//    
//    func getTeamIdFromUser() -> String {
//        print("User Object ID is: \(self.currentUserId)")
//        
//        let query = PFUser.query()
//        query?.whereKey("objectId", equalTo: self.currentUserId)
//        let results = try? query?.findObjects()
//        let teamObjectId = results!![0]["teamObjectId"] as! String
//        print(teamObjectId)
//        self.teamObjectId = teamObjectId
//        return teamObjectId
//    }
//    
//    
//    func getGoalTypeFromUser() -> Bool {
//        let query = PFQuery(className: "GoalType")
//        var isWeightGoal = true
//        
//        query.whereKey("userId", equalTo: self.currentUserId)
//        let queryResult = try? query.getFirstObject() as PFObject!
//        
//        isWeightGoal = queryResult!["isWeightGoal"] as! Bool!
//        self.isWeightGoal = isWeightGoal
//        
//        self.goalId = queryResult!.objectId as String!
//        
//        print(isWeightGoal)
//        return isWeightGoal
//    }
//    
//    func getWeightGoalInfo() -> Bool {
//        let query = PFQuery(className: "WeightGoal")
//        
//        query.whereKey("userId", equalTo: self.currentUserId)
//        let queryResult = try? query.getFirstObject() as PFObject!
//        
//        isWeightGoal = queryResult!["isWeightGoal"] as! Bool!
//        //        self.isWeightGoal = isWeightGoal
//        
//        self.goalId = queryResult!.objectId as String!
//        
//        print(isWeightGoal)
//        return isWeightGoal!
//    }
//    
//    
//    
//    
//    
//    
//    func updateUI() {
//        self.challengeName.text = self.teamName
//        self.endDate.text = convertDate(self.teamEndDate!)
//        self.userFullName.text = PFUser.currentUser()!["firstName"] as? String!
//    }
//    
//    
//    func convertDate(date: NSDate) -> String {
//        
//        let dateFormatter = NSDateFormatter()
//        dateFormatter.dateFormat = "MMMM D, YYYY"
//        let dateString = dateFormatter.stringFromDate(date)
//        return dateString
//        
//    }
//    
//    
//    
//    
//    
//}