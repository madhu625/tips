//
//  SettingsViewController.swift
//  tips
//
//  Created by Deepti Chinta on 9/5/15.
//  Copyright (c) 2015 Deepti Chinta. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipSegment: UISegmentedControl!
    var defaultTipPercentages = [0.18, 0.2, 0.22]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // To load a key from NSUserDefaults, do something like this:
        
        var defaults = NSUserDefaults.standardUserDefaults()
        var intValue = defaults.integerForKey("defaultTip")
        var dafaultTipValue = defaults.integerForKey("defaultTip")
        
        defaultTipSegment.selectedSegmentIndex = dafaultTipValue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func backButtonPress(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func onDefaultTipChanged(sender: AnyObject) {
        
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(defaultTipSegment.selectedSegmentIndex, forKey: "defaultTip")
        defaults.synchronize()
       // super.tipControl.selectedSegmentIndex = super.dafaultTipValue

        
    }
    


}
