//
//  LocationController.swift
//  philia
//
//  Created by khim ung on 8/1/16.
//  Copyright © 2016 khim ung. All rights reserved.
//

import Foundation
import UIKit

class LocationController: UIViewController, UITextFieldDelegate {
    
    /*
     * Allows access to parent method
     */
    var delegate: DelegateUIViewController?
    
    
    @IBOutlet var textField: UITextField!
    var name:String = ""
    var birthday:String = ""
    var location:String = ""
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        onEnter(textField)
        return false
    }
    
    @IBAction func onEnter(sender: UITextField) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let secondViewController = storyBoard.instantiateViewControllerWithIdentifier("secondViewController") as! SecondViewController
        
        secondViewController.name = name
        secondViewController.birthday = birthday
        secondViewController.location = textField.text!
        
        secondViewController.delegate = self.delegate
        
        self.delegate!.onUserAction(secondViewController)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIColor.blackColor().colorWithAlphaComponent(0).CGColor
        
        view.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.3)
        
        self.textField.delegate = self;
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}