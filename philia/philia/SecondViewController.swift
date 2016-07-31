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
        countSelects += 1
        
        let answer: Int = Int(sender.tag)
        
        userInterest = answer | userInterest
        
        sender.backgroundColor = UIColor.redColor()
        
        if(countSelects == 3) {

            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            
            let thirdViewController = storyBoard.instantiateViewControllerWithIdentifier("thirdViewController") as! ThirdViewController
            
            thirdViewController.userInterest = userInterest
            thirdViewController.name = name
            
            // ---- OR ----
            
            // If you want to present the new ViewController then use this
            //self.presentViewController(thirdViewController, //animated:true, completion:nil)
            self.navigationController?.pushViewController(thirdViewController, animated: true)
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
        
        UIColor.whiteColor().colorWithAlphaComponent(0).CGColor
        
        //view?.backgroundColor = UIColor(white: 1, alpha: 0.5)
        view.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        navigationItem.title = "Interest"
    }
}
