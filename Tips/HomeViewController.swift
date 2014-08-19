//
//  ViewController.swift
//  Tips
//
//  Created by David Bai on 8/17/14.
//  Copyright (c) 2014 David Bai. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
                            
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipTitleLabel: UILabel!
    @IBOutlet weak var totalTitleLabel: UILabel!
    @IBOutlet weak var billTitleLabel: UILabel!
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var perPersonTotalLabel: UILabel!
    @IBOutlet weak var perPersonLabel: UILabel!
    @IBOutlet weak var partyControl: UISegmentedControl!
    @IBOutlet weak var partyControlLabel: UILabel!
    @IBOutlet weak var tipControlLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        var defaults = NSUserDefaults.standardUserDefaults()
        var tip = defaults.integerForKey("defaultTipPercentage")
        var theme = defaults.integerForKey("theme")
        var party = defaults.integerForKey("defaultPartySize")
        
        // set defaults when view appears
        partyControl.selectedSegmentIndex = party
        tipControl.selectedSegmentIndex = tip
        setTheme(theme)
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var party = partyControl.selectedSegmentIndex + 1
        
        var billAmount = (billField.text as NSString).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        var perPerson = total / Double(party)
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        perPersonTotalLabel.text = "$\(perPerson)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        perPersonTotalLabel.text = String(format: "$%.2f", perPerson)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    func setTheme(theme: Int) {
        if (theme == 0) { // light theme
            tipLabel.textColor = UIColor.blackColor()
            totalLabel.textColor = UIColor.blackColor()
            tipTitleLabel.textColor = UIColor.blackColor()
            totalTitleLabel.textColor = UIColor.blackColor()
            billTitleLabel.textColor = UIColor.blackColor()
            tipControlLabel.textColor = UIColor.blackColor()
            partyControlLabel.textColor = UIColor.blackColor()
            perPersonLabel.textColor = UIColor.blackColor()
            perPersonTotalLabel.textColor = UIColor.blackColor()
            view.backgroundColor = UIColor.whiteColor()
            lineView.backgroundColor = UIColor.blackColor()
        } else { // dark theme
            tipLabel.textColor = UIColor.whiteColor()
            totalLabel.textColor = UIColor.whiteColor()
            tipTitleLabel.textColor = UIColor.whiteColor()
            totalTitleLabel.textColor = UIColor.whiteColor()
            billTitleLabel.textColor = UIColor.whiteColor()
            tipControlLabel.textColor = UIColor.whiteColor()
            partyControlLabel.textColor = UIColor.whiteColor()
            perPersonLabel.textColor = UIColor.whiteColor()
            perPersonTotalLabel.textColor = UIColor.whiteColor()
            view.backgroundColor = UIColor.blackColor()
            lineView.backgroundColor = UIColor.whiteColor()
        }
    }
    
}


