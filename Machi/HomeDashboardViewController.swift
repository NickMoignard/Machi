//
//  HomeDashboardViewController.swift
//  Machi
//
//  Created by Nicholas Moignard on 7/03/2016.
//  Copyright © 2016 Nicholas Moignard. All rights reserved.
//

import UIKit

class HomeDashboardViewController: UIViewController {
    
    var titleText = "Home"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = titleText
        
        if NSUserDefaults.standardUserDefaults().valueForKey("uid") == nil {
            // user not logged in
            // take to login screen
            performSegueWithIdentifier("loginSegue", sender: self)
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func logoutAction(sender: AnyObject) {
        //log out of firebase
        CURRENT_USER.unauth()
        //remove authdata from NSUserDefaults
        NSUserDefaults.standardUserDefaults().setValue(nil, forKey: "uid")
        print("user logged out")
        //return to login screen
        performSegueWithIdentifier("loginSegue", sender: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
