//
//  HomeDashboardViewController.swift
//  Machi
//  Created by Nicholas Moignard on 7/03/2016.
//  Copyright © 2016 Nicholas Moignard. All rights reserved.


//  The HomeDashboardViewController controls the users Dashboard (The applications main view)

//  MARK:  - To Do Section
/*
    Currently the logged in/out logic resides in this view controllers view did apear function. This logic should be moved to the application delegate
*/



import UIKit

class HomeDashboardViewController: UIViewController {
    
    //MARK: - Outlets and Variable Declaration
    
    var titleText = "Home"
    
    
    
    
    //MARK: - View Controller Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //  ~ Load data into view
        self.title = titleText //Set the Header Title
        
        //  ~ Check if user is logged in
        if NSUserDefaults.standardUserDefaults().valueForKey("uid") == nil {
            // ~ user not logged in
            performSegueWithIdentifier("loginSegue", sender: self) //Take user to login screen
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //  ~ Dispose of any resources that can be recreated.
    }
    
    
    
    
    //MARK: - Actions
    

    @IBAction func logoutAction(sender: AnyObject) {
        //  ~ Logout Action -
        //      log out of firebase, remove our authentification data from the local data store and return user to login screen
        
        CURRENT_USER.unauth()                                               //log out of firebase
        NSUserDefaults.standardUserDefaults().setValue(nil, forKey: "uid")  //remove authdata from NSUserDefaults
        print("user logged out")
        performSegueWithIdentifier("loginSegue", sender: nil)               //return to login screen
    }
    
    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }


}
