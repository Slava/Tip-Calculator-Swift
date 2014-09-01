//
//  SettingsViewController.swift
//  Tip Calculator
//
//  Created by Slava Kim on 8/31/14.
//  Copyright (c) 2014 Slava Kim. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet var defaultTipControl: UISegmentedControl!
    @IBAction func onBackPress(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        var defaults = NSUserDefaults.standardUserDefaults()
        var tipOpt = defaults.integerForKey("defaultTipOption")

        if tipOpt == NSNotFound {
            tipOpt = 1 // let's set it to the middle by default
        }

        defaultTipControl.selectedSegmentIndex = tipOpt
    }

    @IBAction func onTipChanged(sender: AnyObject) {
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(defaultTipControl.selectedSegmentIndex, forKey: "defaultTipOption")
        defaults.synchronize()
    }
}
