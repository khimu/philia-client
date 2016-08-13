//
//  BirthdayPickerController.swift
//  philia
//
//  Created by khim ung on 7/31/16.
//  Copyright © 2016 khim ung. All rights reserved.
//

import Foundation
import UIKit

class BirthdayPickerController: UIViewController {
    
    /*
     * Gathers the user's information
     */
    var profile = ProfileModel()
    
    @IBOutlet var birthdayPicker: UIDatePicker!
    @IBOutlet var birthdayDoneButton: UIButton!
    
    /*
     * Allows access to parent method
     */
    var delegate: DelegateUIViewController?
    
    
    @IBAction func buttonPressed(sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let locationController = storyBoard.instantiateViewControllerWithIdentifier("locationController") as! LocationController
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        self.profile.birthday = dateFormatter.stringFromDate(birthdayPicker.date)
        
        locationController.profile = self.profile
        locationController.delegate = self.delegate
        
        self.delegate!.onUserAction(locationController)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\nBirthdayViewController\nviewDidLoad\nname:\(profile.name)")
        
        UIColor.blackColor().colorWithAlphaComponent(0).CGColor
        
        view.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.3)
        
        birthdayPicker.setValue(UIColor.whiteColor(), forKeyPath: "textColor")
        
        self.birthdayDoneButton.layer.cornerRadius = 10
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}