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

class ViewController: UIViewController, UITextFieldDelegate{
    
    /*
     * Reference to the container in MainViewController
     * This is where all views are rendered
     */
    private var overlayUIView: UIView!
    
    @IBOutlet var backgroundImageView: UIView!
    
    @IBOutlet var anotherTextLabel: UITextView!
    
    @IBOutlet var textField: UITextField!
    
    func setOverlayUIView(overlayView: UIView) {
        overlayUIView = overlayView
    }
    
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
        
        birthdayPickerController.name = textField.text!
        
        overlayUIView.willRemoveSubview(self.view)
        overlayUIView.addSubview(birthdayPickerController.view)
        
        /*
        self.willMoveToParentViewController(nil)
        self.parentViewController?.addChildViewController(birthdayPickerController)
        
        birthdayPickerController.view.frame = self.view.frame
        
        transitionFromViewController(self, toViewController: birthdayPickerController, duration: 0.25, options: .TransitionCrossDissolve, animations: {() -> Void in}, completion: {(finished) -> Void in
                self.removeFromParentViewController()
            birthdayPickerController.didMoveToParentViewController(self.parentViewController)
        })
 */
        
        //self.navigationController?.pushViewController(thirdViewController, animated: true)
        
        //self.parentViewController!.performSegueWithIdentifier("birthdayPickerController", sender: self)

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
    
    /*
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "birthdayPickerController" {
            let birthdayPickerController = segue.destinationViewController as! BirthdayPickerController
            
            birthdayPickerController.name = textField.text!
        }
    }
 */

}

