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
    
    var name:String = ""
    
    @IBOutlet var birthdayPicker: UIDatePicker!
    @IBOutlet var birthdayDoneButton: UIButton!
    
    
    @IBAction func buttonPressed(sender: UIButton) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIColor.blackColor().colorWithAlphaComponent(0).CGColor
        
        view.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.3)
        
        birthdayPicker.setValue(UIColor.whiteColor(), forKeyPath: "textColor")
        
        self.birthdayDoneButton.layer.cornerRadius = 10
        birthdayDoneButton.backgroundColor = UIColor.whiteColor()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}