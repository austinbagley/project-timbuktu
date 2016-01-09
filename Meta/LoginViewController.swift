//
//  LoginViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Austin Bagley on 1/1/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    
    // MARK: Properties
    
    var currentUser = PFUser.currentUser()
    
    // MARK: Outlets
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var pw: UITextField!
    
    // MARK: View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if currentUser != nil {
            // NEEDSWORK: Segue to Dashboard
        } else {
            // DO Nothing
        }
    }
    
    // MARK: Actions
    
    @IBAction func login(sender: UIButton) {
        let username = self.username.text!
        let pw = self.pw.text!
        
        PFUser.logInWithUsernameInBackground(username, password: pw) {
            (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                // It worked
                print("Logged in as \(PFUser?.self)")
                self.performSegueWithIdentifier("showDashboardFromLogin", sender: self)
            } else {
                // Login failed
                print("Login failed")
            }
        }
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
}
