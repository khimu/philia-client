//
//  ViewController.swift
//  philia
//
//  Created by khim ung on 7/28/16.
//  Copyright © 2016 khim ung. All rights reserved.
//

import UIKit
import Foundation

/**
 * The user's Interest bit value is stored in the button tags
 * attribute
 */

class ViewController: UIViewController, UITextFieldDelegate {
    
    /*
     * Gathers the user's information
     */
    var profile = ProfileModel()
    
    @IBOutlet var backgroundImageView: UIView!
    
    @IBOutlet var anotherTextLabel: UITextView!
    
    @IBOutlet var textField: UITextField!
    
    /*
     * Allows access to parent method
     */
    var delegate: DelegateUIViewController?

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        onEnter(textField)
        return false
    }
    
    @IBAction func onEnter(sender: UITextField) {
        let msgEntered = textField.text
        
        anotherTextLabel.text = "Hi \(msgEntered!)!"
        
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let birthdayPickerController = storyBoard.instantiateViewControllerWithIdentifier("birthdayPickerController") as! BirthdayPickerController
        
        self.profile.name = textField.text!
        
        birthdayPickerController.profile = self.profile
        birthdayPickerController.delegate = self.delegate

        self.delegate!.onUserAction(birthdayPickerController)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIColor.blackColor().colorWithAlphaComponent(0).CGColor
        view.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.3)
        
        let border = CALayer()
        let width = CGFloat(2.0)
        border.borderColor = UIColor.whiteColor().CGColor
        border.frame = CGRect(x: 0, y: textField.frame.size.height - width, width:  textField.frame.size.width, height: textField.frame.size.height)
        
        border.borderWidth = width
        textField.layer.addSublayer(border)
        textField.layer.masksToBounds = true
        
        self.textField.delegate = self;

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
 

}

