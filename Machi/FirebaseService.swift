//
//  FirebaseService.swift
//  Machi
//
//  Created by Nicholas Moignard on 5/03/2016.
//  Copyright © 2016 Nicholas Moignard. All rights reserved.
//

import Foundation
import Firebase

let BASE_URL = "https://machi.firebaseio.com"

let FIREBASE_REF = Firebase(url: BASE_URL) //reference to the database


var CURRENT_USER: Firebase
{    //When a user is installed we can compute the CURRENT_USER variable
    // get unique identifier for user from the NSUserDefaults
    let userID = NSUserDefaults.standardUserDefaults().valueForKey("uid") as! String
    
    // ask firebase to get that user from the database
    let currentUser = Firebase(url: "\(FIREBASE_REF)").childByAppendingPath("users").childByAppendingPath(userID) //***BASEURL/users/userID***
    
    // return the user to be stored in the CURRENT_USER variable
    return currentUser!
}
