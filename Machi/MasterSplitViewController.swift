//
//  MasterSplitViewController.swift
//  Machi
//
//  Created by Nicholas Moignard on 6/03/2016.
//  Copyright © 2016 Nicholas Moignard. All rights reserved.
//

import UIKit

class MasterSplitViewController: UITableViewController, UISplitViewControllerDelegate {
    var menuItems: NSMutableArray = ["Home","Account Settings", "Your Trainers", "Payment Information", "Help", "Contact"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.reloadData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.splitViewController?.delegate = self
        self.splitViewController?.preferredDisplayMode = UISplitViewControllerDisplayMode.AllVisible
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menuItems.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        // set cell title
        cell.textLabel?.text = self.menuItems.objectAtIndex(indexPath.row) as? String
        return cell
    }


    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
            // perform segue with after clicking menu item
        if indexPath.row == 0 {
            //home
            self.performSegueWithIdentifier("showHome", sender: self)
        } else {
            // all the other menu items
            self.performSegueWithIdentifier("showDetail", sender: self)
        }
    }

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // get index path
        let index = self.tableView.indexPathForSelectedRow! as NSIndexPath
        // grab the new viewcontroller in order to pass information to variables in the destination viewController
        let navagationController = segue.destinationViewController as! UINavigationController
        
        
        if segue.identifier == "showDetail" {
            let viewController = navagationController.viewControllers[0] as! DetailSplitViewController
            viewController.titleText = self.menuItems.objectAtIndex(index.row) as! String
        } else if segue.identifier == "showHome" {
            let viewController = navagationController.viewControllers[0] as! HomeDashboardViewController
            viewController.titleText = self.menuItems.objectAtIndex(index.row) as! String
            
        }
        self.tableView.deselectRowAtIndexPath(index, animated: true)
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}
