//
//  DashboardViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Austin Bagley on 1/2/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit
import Parse


class DashboardViewController: UIViewController {
    
    // MARK: Constants
    
    // MARK: Properties
    
    var currentUser = PFUser.currentUser()
    var currentUserId = (PFUser.currentUser()?.objectId!)!
    var teamObjectId = ""
    var teamInfo: PFObject?
    var goalType: PFObject?
    var weightGoal: PFObject?
    var goalId: String?
    var isWeightGoal: Bool?
    var teamName: String?
    var teamEndDate: NSDate?
    var userFirstName: String?
    var userGoalText: String?
    
    
    var userDashboard = UserDashboardData.sharedInstance

    
    // MARK: Outlets
    
    @IBOutlet weak var challengeName: UILabel!
    @IBOutlet weak var endDate: UILabel!
    @IBOutlet weak var userFullName: UILabel!
    @IBOutlet weak var userGoal: UILabel!
    
    // MARK: View Controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
      
    }
    
    // MARK: Actions
    
    
    func updateUI() {
        challengeName.text = userDashboard.team?.teamChallengeName!
        userFullName.text = (userDashboard.user!["firstName"] as? String)! + " " + (userDashboard.user!["lastName"] as? String)!
        userGoal.text = "Lose \(String(userDashboard.goal!.totalWeightLoss!)) pounds"
        endDate.text = convertDate((userDashboard.team?.teamEndDate)!)
    }
    
    func convertDate(date: NSDate) -> String {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MMMM D, YYYY"
        let dateString = dateFormatter.stringFromDate(date)
        return dateString
        
    }
    
    
    
    
    
}