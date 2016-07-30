//
//  ThirdViewController.swift
//  philia
//
//  Created by khim ung on 7/29/16.
//  Copyright © 2016 khim ung. All rights reserved.
//

import UIKit

/**
 *
 */
class ThirdViewController: UIViewController {
    
    @IBOutlet var womenButton: UIButton!
    @IBOutlet var menButton: UIButton!
    @IBOutlet var bothButton: UIButton!
    
    @IBOutlet var debugLabel: UILabel!
    
    var name:String = ""
    
    var userInterest: Int = 0
    
    var userGenderPreference: Int = 0
    
    @IBAction func pressedButton(sender: UIButton) {
        let answer: Int = Int(sender.tag)
        
        userGenderPreference = answer | userGenderPreference

        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let fourthViewController = storyBoard.instantiateViewControllerWithIdentifier("fourthViewController") as! FourthViewController
        
        fourthViewController.userInterest = userInterest
        fourthViewController.name = name
        fourthViewController.userGenderPreference = userGenderPreference
        
        // ---- OR ----
        
        // If you want to present the new ViewController then use this
        self.navigationController?.pushViewController(fourthViewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.womenButton.layer.cornerRadius = 10
        self.menButton.layer.cornerRadius = 10
        self.bothButton.layer.cornerRadius = 10
        
        
        debugLabel.text = "\(userGenderPreference) and \(userInterest) for \(name)"

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        navigationItem.title = "Preference"
    }
}
