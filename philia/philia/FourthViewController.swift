//
//  fourthViewController.swift
//  philia
//
//  Created by khim ung on 7/29/16.
//  Copyright © 2016 khim ung. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {
    // 1 = men, 2 = women, 3 = both
    let mapLabel1ToBitMapForGenderPreference: [Int: String] = [1: "Mr.", 2: "Mrs.", 4: "Mr or Mrs"]
    
    let mapLabel2ToBitMapForGenderPreference: [Int: String] = [1: "he'll", 2: "she'll", 4: "he or she will"]

    let mapLabel3ToBitMapForGenderPreference: [Int: String] = [1: "man", 2: "woman", 4: "partner"]
    
    
    @IBOutlet var dynamicHeaderLabel: UILabel!
    

    @IBOutlet var curiousButton: UIButton!
    
    @IBOutlet var hangoutButton: UIButton!
    @IBOutlet var debugLabel: UILabel!
    @IBOutlet var marriageButton: UIButton!

    // turn this into a model object
    var name:String = ""
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
        
        // ---- OR ----
        
        // If you want to present the new ViewController then use this
        self.presentViewController(fifthViewController, animated:true, completion:nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.marriageButton.layer.cornerRadius = 10
        self.hangoutButton.layer.cornerRadius = 10
        self.curiousButton.layer.cornerRadius = 10
        
        dynamicHeaderLabel.text = "Ok awesome\nand once you find your\n\(mapLabel3ToBitMapForGenderPreference[userGenderPreference]!) you'd like to:"
        
        marriageButton.setTitle("if this works, \(mapLabel2ToBitMapForGenderPreference[userGenderPreference]!) be \(mapLabel1ToBitMapForGenderPreference[userGenderPreference]!) \(name)", forState: .Normal)
        
        debugLabel.text = "\(userGenderPreference) and \(userIntensionPreference) and \(userInterest) for \(name)"        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}