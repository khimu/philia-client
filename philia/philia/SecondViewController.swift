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
    var birthday:String = ""
    var location:String = ""
    
    var delegate: DelegateUIViewController?
    
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
    
    @IBAction func buttonPressed(sender: UIButton) {
        let answer: Int = Int(sender.tag)
        
        if((answer & userInterest) == 0) {
            countSelects += 1
        }
        
        userInterest = answer | userInterest
        
        sender.backgroundColor = UIColor.redColor()
        
        if(countSelects == 3) {

            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            
            let thirdViewController = storyBoard.instantiateViewControllerWithIdentifier("thirdViewController") as! ThirdViewController
            
            thirdViewController.userInterest = userInterest
            thirdViewController.name = name
            thirdViewController.birthday = birthday
            thirdViewController.location = location
            
            thirdViewController.delegate = self.delegate
            
            self.delegate!.onUserAction(thirdViewController)
            
        }
    }
    
    @IBOutlet var messageLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.natureButton.layer.cornerRadius = 10
        self.cultureButton.layer.cornerRadius = 10
        self.ambition.layer.cornerRadius = 10
        self.careerButton.layer.cornerRadius = 10
        self.travelButton.layer.cornerRadius = 10
        self.educationButton.layer.cornerRadius = 10
        self.fashionButton.layer.cornerRadius = 10
        self.ethicsButton.layer.cornerRadius = 10
        self.religionButton.layer.cornerRadius = 10
        self.powerButton.layer.cornerRadius = 10
        self.wealthButton.layer.cornerRadius = 10
        self.driveButton.layer.cornerRadius = 10
        self.beautyButton.layer.cornerRadius = 10
        self.familyButton.layer.cornerRadius = 10
        self.fitnessButton.layer.cornerRadius = 10
        self.foodButton.layer.cornerRadius = 10
        self.booksButton.layer.cornerRadius = 10
        self.artistryButton.layer.cornerRadius = 10

        self.messageLabel.text = "Hi \(name)\n" + self.messageLabel.text!
        
        UIColor.blackColor().colorWithAlphaComponent(0).CGColor
        view.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.3)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        navigationItem.title = "Interest"
    }
}
