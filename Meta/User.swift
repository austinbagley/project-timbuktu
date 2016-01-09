//
//  Users.swift
//  ParseStarterProject-Swift
//
//  Created by Austin Bagley on 1/1/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import Foundation
import Parse

class User {
    
    // MARK: Properties
    
    var users = PFUser()
    
    // MARK: Actions
    
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
    
    
    
    
    
    
    
}