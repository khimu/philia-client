//
//  ViewController.swift
//  philia
//
//  Created by khim ung on 7/28/16.
//  Copyright © 2016 khim ung. All rights reserved.
//

import UIKit

/**
 * The user's Interest bit value is stored in the button tags
 * attribute
 */

class ViewController: UIViewController {
    
    @IBOutlet var backgroundImageView: UIView!
    
    @IBOutlet var anotherTextLabel: UITextView!
    
    @IBOutlet var textField: UITextField!
    
    @IBAction func pressedButton(sender: UIButton) {
        let msgEntered = textField.text
        
        
        anotherTextLabel.text = "Hi \(msgEntered!)!"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            let secondViewController = segue.destinationViewController as! SecondViewController
            secondViewController.name = textField.text!
        navigationItem.title = "Main"
    }

}

