//
//  CreateAccountViewController.swift
//  Machi
//
//  Created by Nicholas Moignard on 5/03/2016.
//  Copyright © 2016 Nicholas Moignard. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {
    //MARK: - Outlets
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Actions
    
    @IBAction func createAccountAction(sender: AnyObject) {
        let email =  self.emailTextField.text, password = self.passwordTextField.text
        
        if email != "" && password != "" {  // attempt to create user
            FIREBASE_REF.createUser(email, password: password) {    // create user with firebase
                (error, _) in   //  the returned authData is redundant as we will get a new authData object returned when logging newly created user in
                if error == nil {
                    FIREBASE_REF.authUser(email, password: password) { // log user in with firebase
                        (error, authData) in
                        if authData ==  nil {   // check for response object
                            print("account created")
                            
                            // save unique identifier into NSUserDefaults
                            NSUserDefaults.standardUserDefaults().setValue(authData, forKey: "uid")
                            
                            //  dismiss the modal view
                            self.dismissViewControllerAnimated(true, completion: nil)
                        }   else {
                            print("\(error)")
                        }
                    }
                }   else {
                    print("\(error)")
                }
            }
        }   else { // user hasn't correctly inputed email and password -> Alert User
            
            let alert = UIAlertController(title: "Error", message: "Enter Email and Password", preferredStyle: .Alert)
            let action = UIAlertAction(title: "Ok", style: .Default, handler: nil)
            alert.addAction(action)
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }

    @IBAction func cancelAction(sender: AnyObject) {
        // dismiss the modal view
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
