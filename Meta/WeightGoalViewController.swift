//
//  WeightGoalViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Austin Bagley on 1/2/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit
import Parse


class WeightGoalViewController: UIViewController {
    
    // MARK: Constants
    
    let SEGUE_TO_DASHBOARD = "showDashboard"

    // MARK: Properties
    
    var signUp = SignUp()
    var team: Team?
    
    // MARK: Outlets
    
    @IBOutlet weak var startWeight: UITextField!
    @IBOutlet weak var goalWeight: UITextField!
    
    // MARK: View Controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: Actions
    
    @IBAction func done(sender: UIButton) {
        let startWeight = Double(self.startWeight.text!)!
        let goalWeight = Double(self.goalWeight.text!)!
        
        signUp.createWeightGoalFromSignup(startWeight, endWeight: goalWeight, team: team!, callBack: ({
            
//            self.performSegueWithIdentifier(self.SEGUE_TO_DASHBOARD, sender: self)
        }))
       
    
    }
    
}