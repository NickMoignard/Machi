//
//  DetailSplitViewController.swift
//  Machi
//
//  Created by Nicholas Moignard on 6/03/2016.
//  Copyright © 2016 Nicholas Moignard. All rights reserved.
//

import UIKit

class DetailSplitViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var titleText = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.titleText
        self.titleLabel.text = self.titleText
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
