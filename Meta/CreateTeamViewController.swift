//
//  CreateTeamViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Austin Bagley on 1/2/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit
import Parse


class CreateTeamViewController: UIViewController {
    // MARK: Constants
    
    let SEGUE_TO_GOAL_TYPE = "showGoalType"
    
    
    // MARK: Properties
    
    var signup = SignupProcess()
//    var user = User().users
//    var currentUser = User().user
    
    // MARK: Outlets
    
    @IBOutlet weak var teamName: UITextField!
    @IBOutlet weak var teamPassword: UITextField!
    @IBOutlet weak var endDate: UIDatePicker!
    
    // MARK: View Controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: Actions
    
    @IBAction func createTeam(sender: UIButton) {
        let teamName = self.teamName.text!
        let teamPassword = self.teamPassword.text!
        let endDate = self.endDate.date
        
        
        signup.createTeam(teamName, teamPassword: teamPassword, endDate: endDate, callBack: {
            self.performSegueWithIdentifier("showGoalType", sender: self)
        })
        
    }
    
    
    
    
}
