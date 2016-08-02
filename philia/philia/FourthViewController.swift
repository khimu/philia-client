//
//  fourthViewController.swift
//  philia
//
//  Created by khim ung on 7/29/16.
//  Copyright © 2016 khim ung. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {
    var delegate: DelegateUIViewController?
    
    // 1 = men, 2 = women, 3 = both
    let mapLabel1ToBitMapForGenderPreference: [Int: String] = [1: "Mr.", 2: "Mrs.", 4: "Mr or Mrs"]
    
    let mapLabel2ToBitMapForGenderPreference: [Int: String] = [1: "he'll", 2: "she'll", 4: "he or she will"]

    let mapLabel3ToBitMapForGenderPreference: [Int: String] = [1: "man", 2: "woman", 4: "partner"]
    
    
    @IBOutlet var dynamicHeaderLabel: UILabel!
    

    @IBOutlet var curiousButton: UIButton!
    @IBOutlet var hangoutButton: UIButton!
    @IBOutlet var marriageButton: UIButton!
    
    @IBOutlet var debugLabel: UILabel!

    // turn this into a model object
    var name:String = ""
    var birthday:String = ""
    var location:String = ""
    var userInterest: Int = 0
    var userGenderPreference: Int = 0
    var userIntensionPreference: Int = 0
    
    @IBAction func pressedButton(sender: UIButton) {
        let answer: Int = Int(sender.tag)
        
        userIntensionPreference = answer | userIntensionPreference
        
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let fifthViewController = storyBoard.instantiateViewControllerWithIdentifier("fifthViewController") as! FifthViewController
        
        fifthViewController.userInterest = userInterest
        fifthViewController.name = name
        fifthViewController.userGenderPreference = userGenderPreference
        fifthViewController.userIntensionPreference = userIntensionPreference
        fifthViewController.birthday = birthday
        fifthViewController.location = location
        
        self.delegate!.onUserAction(fifthViewController)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.marriageButton.layer.cornerRadius = 10
        self.hangoutButton.layer.cornerRadius = 10
        self.curiousButton.layer.cornerRadius = 10
        
        dynamicHeaderLabel.text = "Ok awesome\nand once you find your\n\(mapLabel3ToBitMapForGenderPreference[userGenderPreference]!) you'd like to:"
        
        marriageButton.setTitle("if this works, \(mapLabel2ToBitMapForGenderPreference[userGenderPreference]!) be \(mapLabel1ToBitMapForGenderPreference[userGenderPreference]!) \(name)", forState: .Normal)
        
        debugLabel.text = "\(userGenderPreference) and \(userIntensionPreference) and \(userInterest) for \(name)"
        
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