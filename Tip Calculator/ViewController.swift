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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        var billAmount = (billField.text as NSString).doubleValue;
        var tipAmount = billAmount * 0.2;
        var totalAmount = billAmount + tipAmount;

        tipLabel.text = String(format: "$%.2f", tipAmount)
        totalLabel.text = String(format: "$%.2f", totalAmount)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

