//
//  SecondViewController.swift
//  philia
//
//  Created by khim ung on 7/29/16.
//  Copyright © 2016 khim ung. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var name:String = ""
    
    var userInterest: Int = 0
    
    var countSelects = 0
    
    @IBOutlet var natureButton: UIButton!
    @IBOutlet var cultureButton: UIButton!
    @IBOutlet var ambition: UIButton!
    @IBOutlet var careerButton: UIButton!
    @IBOutlet var travelButton: UIButton!
    @IBOutlet var educationButton: UIButton!
    @IBOutlet var fashionButton: UIButton!
    @IBOutlet var ethicsButton: UIButton!
    @IBOutlet var religionButton: UIButton!
    @IBOutlet var powerButton: UIButton!
    @IBOutlet var wealthButton: UIButton!
    @IBOutlet var driveButton: UIButton!
    @IBOutlet var beautyButton: UIButton!
    @IBOutlet var familyButton: UIButton!
    @IBOutlet var fitnessButton: UIButton!
    @IBOutlet var foodButton: UIButton!
    @IBOutlet var booksButton: UIButton!
    @IBOutlet var artistryButton: UIButton!

    @IBOutlet var answerLabel: UILabel!
    
    @IBAction func buttonPressed(sender: UIButton) {
        countSelects += 1
        
        let answer: Int = Int(sender.tag)
        
        userInterest = answer | userInterest
        
        sender.backgroundColor = UIColor.redColor()
        
        if(countSelects == 3) {
            answerLabel.text = "Answer \(userInterest)"
        }
    }
    
    @IBOutlet var messageLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.messageLabel.text = "Hi \(name)\n" + self.messageLabel.text!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
