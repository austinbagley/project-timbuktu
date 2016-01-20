////
////  UserData.swift
////  ParseStarterProject-Swift
////
////  Created by Austin Bagley on 1/2/16.
////  Copyright © 2016 Parse. All rights reserved.
////
//
////import Foundation
////import Parse
//
//class CustomUser: PFUser {
//    
//    override class func initialize() {
//        struct Static {
//            static var onceToken : dispatch_once_t = 0;
//        }
//        dispatch_once(&Static.onceToken) {
//            self.registerSubclass()
//        }
//    }
//    
//    
//    // MARK: Properties
//    
//    var userFirstName: String?
//    var userLastName: String?
//    var userCurrentTeam: String?
//    
//    let className = "Team"
//    
//    // MARK: Init
//    
//    override init() {
//        super.init()
//        
//        self.userFirstName = ((PFUser.currentUser()?["FirstName"]!)!) as? String
//        self.userLastName = ((PFUser.currentUser()?["LastName"]!)!) as? String
//        self.email = self.username
//        self.userCurrentTeam = PFUser.currentUser()!["teamObjectId"] as? String
//        
//        
//        
//    }
//    
//}
//
//
