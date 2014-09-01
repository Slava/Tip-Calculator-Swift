//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Slava Kim on 8/31/14.
//  Copyright (c) 2014 Slava Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet var billField: UITextField!
    @IBOutlet var tipLabel: UILabel!
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var tipControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        // Set the tip from defaults
        var defaults = NSUserDefaults.standardUserDefaults()
        var tipOpt = defaults.integerForKey("defaultTipOption")

        if tipOpt == NSNotFound {
            tipOpt = 1 // let's set it to the middle by default
        }

        tipControl.selectedSegmentIndex = tipOpt

        // Set the bill from last session, if it was entered less than 5m ago
        var lastEnteredDate = defaults.objectForKey("lastEnteredDate") as NSDate?

        if lastEnteredDate !== nil && lastEnteredDate?.timeIntervalSinceNow > -60 * 5 {
            billField.text = defaults.stringForKey("lastEnteredAmount")
        }

        onEditingChanged(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.18, 0.2, 0.25]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]

        var billAmount = (billField.text as NSString).doubleValue
        var tipAmount = billAmount * tipPercentage
        var totalAmount = billAmount + tipAmount

        tipLabel.text = String(format: "$%.2f", tipAmount)
        totalLabel.text = String(format: "$%.2f", totalAmount)

        // Save the last entered amount
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(billField.text, forKey: "lastEnteredAmount")
        defaults.setObject(NSDate(), forKey: "lastEnteredDate")
        // Don't flush the defaults here, it sounds like a bad idea
        // to force it on every key stroke, let's leave it to the
        // Framework to decide when is a good time
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

