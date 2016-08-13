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
    
    
    /*
     * Gathers the user's information
     */
    var profile = ProfileModel()
    
    var delegate: DelegateUIViewController?
    
    @IBOutlet var womenButton: UIButton!
    @IBOutlet var menButton: UIButton!
    @IBOutlet var bothButton: UIButton!
    
    @IBOutlet var debugLabel: UILabel!
    
    @IBAction func pressedButton(sender: UIButton) {
        let answer: Int = Int(sender.tag)
        
        self.profile.userGenderPreference = answer | self.profile.userGenderPreference

        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let fourthViewController = storyBoard.instantiateViewControllerWithIdentifier("fourthViewController") as! FourthViewController
        
        fourthViewController.profile = self.profile
        
        fourthViewController.delegate = self.delegate
        
        self.delegate!.onUserAction(fourthViewController)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\nThirdViewController\nviewDidLoad\nname:\(profile.name)")
        
        self.womenButton.layer.cornerRadius = 10
        self.menButton.layer.cornerRadius = 10
        self.bothButton.layer.cornerRadius = 10
        
        debugLabel.text = "\(profile.userGenderPreference) and \(profile.userInterest) for \(profile.name)"
        
        UIColor.blackColor().colorWithAlphaComponent(0).CGColor
        view.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.3)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        navigationItem.title = "Preference"
    }
}
