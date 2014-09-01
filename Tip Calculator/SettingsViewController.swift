//
//  SettingsViewController.swift
//  Tip Calculator
//
//  Created by Slava Kim on 8/31/14.
//  Copyright (c) 2014 Slava Kim. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet var DefaultTipControl: UISegmentedControl!
    @IBAction func onBackPress(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        var defaults = NSUserDefaults.standardUserDefaults()
        var tipOpt = defaults.integerForKey("defaultTipOption")

        if tipOpt == NSNotFound {
            tipOpt = 1 // let's set it to the middle by default
        }

        DefaultTipControl.selectedSegmentIndex = tipOpt
    }

    @IBAction func onTipChanged(sender: AnyObject) {
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(DefaultTipControl.selectedSegmentIndex, forKey: "defaultTipOption")
        defaults.synchronize()
    }
}
