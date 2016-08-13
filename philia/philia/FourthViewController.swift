//
//  fourthViewController.swift
//  philia
//
//  Created by khim ung on 7/29/16.
//  Copyright © 2016 khim ung. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {
    
    /*
     * Gathers the user's information
     */
    var profile = ProfileModel()
    
    var delegate: DelegateUIViewController?

    @IBOutlet var dynamicHeaderLabel: UILabel!
    

    @IBOutlet var curiousButton: UIButton!
    @IBOutlet var hangoutButton: UIButton!
    @IBOutlet var marriageButton: UIButton!
    
    @IBOutlet var debugLabel: UILabel!

    
    @IBAction func pressedButton(sender: UIButton) {
        sender.backgroundColor = UIColor.redColor()
        
        print("\nFourthViewController\npressedButton\nname:\(profile.name)")
        
        let answer: Int = Int(sender.tag)
        
        self.profile.userIntensionPreference = answer | self.profile.userIntensionPreference
        
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let fifthViewController = storyBoard.instantiateViewControllerWithIdentifier("fifthViewController") as! FifthViewController
        
        fifthViewController.profile = self.profile
        
        self.delegate!.onUserAction(fifthViewController)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("\nFourthViewController\nviewDidLoad\nname:\(profile.name)")
        
        self.marriageButton.layer.cornerRadius = 10
        self.hangoutButton.layer.cornerRadius = 10
        self.curiousButton.layer.cornerRadius = 10
        
        dynamicHeaderLabel.text = "Ok awesome\nand once you find your\n\(profile.userGenderPreferenceLabel3()) you'd like to:"
        
        marriageButton.setTitle("if this works, \(profile.userGenderPreferenceLabel2()) be \(profile.userGenderPreferenceLabel()) \(profile.name)", forState: .Normal)
        
        // remove button and this code.  button is hidden and screen size height must be increased to see
        debugLabel.text = "\(profile.userGenderPreference) and \(profile.userIntensionPreference) and \(profile.userInterest) for \(profile.name)"
        
        UIColor.blackColor().colorWithAlphaComponent(0).CGColor
        view.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.3)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        navigationItem.title = "Intention"
    }
    
}