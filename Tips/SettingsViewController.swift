//
//  SettingsViewController.swift
//  Tips
//
//  Created by David Bai on 8/17/14.
//  Copyright (c) 2014 David Bai. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {


    @IBOutlet weak var defaultTipPercentControl: UISegmentedControl!
    @IBOutlet weak var defaultPartySizeControl: UISegmentedControl!
    @IBOutlet weak var themeControl: UISegmentedControl!
    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var defaultTipPercentLabel: UILabel!
    @IBOutlet weak var defaultPartySizeLabel: UILabel!
    @IBOutlet weak var themeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var defaults = NSUserDefaults.standardUserDefaults()
        var tip = defaults.integerForKey("defaultTipPercentage")
        var theme = defaults.integerForKey("theme")
        var partySize = defaults.integerForKey("defaultPartySize")
        
        defaultTipPercentControl.selectedSegmentIndex = tip
        defaultPartySizeControl.selectedSegmentIndex = partySize
        themeControl.selectedSegmentIndex = theme
        
        setTheme(theme)
    }    

    @IBAction func goBackToHome(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func changedDefaultTipPercentage(sender: AnyObject) {
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(defaultTipPercentControl.selectedSegmentIndex, forKey: "defaultTipPercentage")
        defaults.synchronize()
    }
    
    @IBAction func changedDefaultPartySize(sender: AnyObject) {
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(defaultPartySizeControl.selectedSegmentIndex, forKey: "defaultPartySize")
        defaults.synchronize()
    }
    
    @IBAction func changedTheme(sender: AnyObject) {
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(themeControl.selectedSegmentIndex, forKey: "theme")
        defaults.synchronize()
        setTheme(themeControl.selectedSegmentIndex)
    }
    
    
    func setTheme(theme: Int) {
        if (theme == 0) { // light theme
            settingsLabel.textColor = UIColor.blackColor()
            defaultTipPercentLabel.textColor = UIColor.blackColor()
            themeLabel.textColor = UIColor.blackColor()
            defaultPartySizeLabel.textColor = UIColor.blackColor()
            view.backgroundColor = UIColor.whiteColor()
            UIApplication.sharedApplication().statusBarStyle = .Default
        } else { // dark theme
            settingsLabel.textColor = UIColor.whiteColor()
            defaultTipPercentLabel.textColor = UIColor.whiteColor()
            themeLabel.textColor = UIColor.whiteColor()
            defaultPartySizeLabel.textColor = UIColor.whiteColor()
            view.backgroundColor = UIColor.blackColor()
            UIApplication.sharedApplication().statusBarStyle = .LightContent
        }
    }
    
    
}
