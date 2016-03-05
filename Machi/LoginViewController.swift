//
//  LoginViewController.swift
//  Machi
//
//  Created by Nicholas Moignard on 5/03/2016.
//  Copyright © 2016 Nicholas Moignard. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logoutButton: UIButton!
    
    // MARK: - Protocol Methods
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if NSUserDefaults.standardUserDefaults().valueForKey("uid") != nil && CURRENT_USER.authData != nil {    // check for unique identifier in user defaults and then check for firebase authData
            self.logoutButton.hidden = false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    
    @IBAction func loginAction(sender: AnyObject) {
        
        // grab user input
        let email = self.emailTextField.text, password = self.passwordTextField.text
        
        //check user input
        if email != "" && password != nil {
            
            //authenticate user with firebase
            FIREBASE_REF.authUser(email, password: password) {
                (error, authData) in
                if error == nil {
                    print("user logged in")
                    
                    // store unique identifier from firebase in the user defaults
                    NSUserDefaults.standardUserDefaults().setValue(authData.uid, forKey: "uid")
                } else {    // user not found in database -> Alert User
                
                    let alert = UIAlertController(title: "Error", message: "\(error).", preferredStyle: .Alert)
                    let action = UIAlertAction(title: "Ok", style: .Default, handler: nil)
                    alert.addAction(action)
                    self.presentViewController(alert, animated: true, completion: nil)
                }
            }
        } else { // user hasn't correctly inputed email and password -> Alert User
            
            let alert = UIAlertController(title: "Error", message: "Enter Email and Password.", preferredStyle: .Alert)
            let action = UIAlertAction(title: "Ok", style: .Default, handler: nil)
            alert.addAction(action)
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }

    @IBAction func logoutAction(sender: AnyObject) {
        
        // logout user with firebase
        CURRENT_USER.unauth()
        
        //remove authentification data from NSUserDefaults
        NSUserDefaults.standardUserDefaults().setValue(nil, forKey: "uid")
        
        //Hide Logout button
        self.logoutButton.hidden = true
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
