//
//  ViewController.swift
//  tips
//
//  Created by Deepti Chinta on 9/2/15.
//  Copyright (c) 2015 Deepti Chinta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    var tipPercentages = [0.18, 0.2, 0.22]
    var defaults = NSUserDefaults.standardUserDefaults()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        //defaults.synchronize()
        //var dafaultTipValue = defaults.integerForKey("defaultTip")
        //tipControl.selectedSegmentIndex = dafaultTipValue
     
        
    }
    
    override func viewWillAppear(animated: Bool) {
        // Set the default tip percentage from the user settings
        var intValue = defaults.integerForKey("defaultTip")
        var dafaultTipValue = defaults.integerForKey("defaultTip")
        tipControl.selectedSegmentIndex = dafaultTipValue
        
        updateValues()

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onEditingChanged(sender: AnyObject) {

        updateValues()
 
    }
    
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    func updateValues() {
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = NSString(string: billField.text).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)

    }
}

