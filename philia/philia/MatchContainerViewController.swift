//
//  MatchContainerViewController.swift
//  philia
//
//  Created by khim ung on 8/3/16.
//  Copyright © 2016 khim ung. All rights reserved.
//

import Foundation
import UIKit

class MatchContainerViewController: UIViewController {
    
    var delegate: DelegateUIViewController?
    
    
    /*
     * Gathers the user's information
     */
    var profile = ProfileModel()
    
    var selectedImageIndex: Int = 0

    @IBOutlet weak var upperMessageLabel: UILabel!
    
    /*
     * Track the user's swipe left or right
     */
    private var index = 0
    
    private var profileImages: [String: [String]] = ["philia1": ["Beyonce", "30", "Las Vegas, NV", "7mi"], "lasvegas1": ["Scoobydoo", "32","Las Vegas, NV","5mi"], "philia2": ["Ashley", "28","Las Vegas, NV","2mi"], "lasvegas2": ["John", "83", "San Francisco, CA", "100mi"]]
    
    
    @IBOutlet weak var profileImage1: UIButton!
    @IBOutlet weak var profileImage2: UIButton!
    @IBOutlet weak var profileImage3: UIButton!
    

    @IBOutlet weak var profileDetail1: UILabel!
    @IBOutlet weak var profileDetail2: UILabel!
    @IBOutlet weak var profileDetail3: UILabel!
    

    func imageTapped(img: AnyObject)
    {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let profileController = storyBoard.instantiateViewControllerWithIdentifier("profileController") as! ProfileController
        
        profileController.profile = self.profile
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initialize match array here
        /*
         
 let json = [ "interest": profile.userInterest, "genderInterest": profile.userGenderPreference, "datingIntension": profile.userIntensionPreference, "city": profile.location, "state": "?", "zipcode": "?", "country": "US", "firstName": fullNameArr[0], "lastName": lastName, "birthdate": profile.birthday, "age": ageComponents ]
 
 //UIDevice.currentDevice().identifierForVendor!.UUIDString
 
 HttpHelper.httpHelper.getMatches(json);
        
         // need to populate this appropriately
         profileImages
 */
 
 
        print("\nMatchContainerViewController\nviewDidLoad\nname:\(self.profile.name) and \(self.profile.userGenderPreference)")
        
        upperMessageLabel.text = "...your Potential \(self.profile.userGenderPreferenceLabel()) \(self.profile.name)";
        
        profileImage1.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.3)
        profileImage2.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.3)
        profileImage3.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.3)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:Selector("imageTapped:"))
        
        profileImage1.userInteractionEnabled = true
        profileImage1.addGestureRecognizer(tapGestureRecognizer)
        
        profileImage2.userInteractionEnabled = true
        profileImage2.addGestureRecognizer(tapGestureRecognizer)
        
        profileImage3.userInteractionEnabled = true
        profileImage3.addGestureRecognizer(tapGestureRecognizer)
        
        self.modalPresentationStyle = .OverCurrentContext
        
        let keys = Array(profileImages.keys)
        
        profileImage1.setBackgroundImage(UIImage(named: keys[index]), forState: UIControlState.Normal)
        profileDetail1.text = "\(profileImages[keys[index]]![0]), \(profileImages[keys[index]]![1])\n\(profileImages[keys[index]]![2])\n\(profileImages[keys[index]]![3])"
        index += 1
        profileImage2.setBackgroundImage(UIImage(named: keys[index]), forState: UIControlState.Normal)
        profileDetail2.text = "\(profileImages[keys[index]]![0]), \(profileImages[keys[index]]![1])\n\(profileImages[keys[index]]![2])\n\(profileImages[keys[index]]![3])"
        (index += 1)
        profileImage3.setBackgroundImage(UIImage(named: keys[index]), forState: UIControlState.Normal)
        profileDetail3.text = "\(profileImages[keys[index]]![0]), \(profileImages[keys[index]]![1])\n\(profileImages[keys[index]]![2])\n\(profileImages[keys[index]]![3])"
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(MatchContainerViewController.handleSwipes(_:)))
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(MatchContainerViewController.handleSwipes(_:)))
        
        leftSwipe.direction = .Left
        rightSwipe.direction = .Right
        
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
    }
    
    func swipeLeftUIUpdate() {
        let keys = Array(profileImages.keys)

        profileImage1.setBackgroundImage(profileImage2.currentBackgroundImage, forState: UIControlState.Normal)
        profileDetail1.text = profileDetail2.text
        
        profileImage2.setBackgroundImage(profileImage3.currentBackgroundImage, forState: UIControlState.Normal)
        profileDetail2.text = profileDetail3.text
        
        profileImage3.setBackgroundImage(UIImage(named: keys[index]), forState: UIControlState.Normal)
        profileDetail3.text = "\(profileImages[keys[index]]![0]), \(profileImages[keys[index]]![1])\n\(profileImages[keys[index]]![2])\n\(profileImages[keys[index]]![3])"
    }
    
    func swipeRightUIUpdate() {

        let keys = Array(profileImages.keys)

        forceSwipe(UISwipeGestureRecognizerDirection.Right)
        forceSwipe(UISwipeGestureRecognizerDirection.Right)
        
        profileImage3.setBackgroundImage(profileImage2.currentBackgroundImage, forState: UIControlState.Normal)
        profileDetail3.text = profileDetail2.text

        profileImage2.setBackgroundImage(profileImage1.currentBackgroundImage, forState: UIControlState.Normal)
        profileDetail2.text = profileDetail1.text
  
        profileImage1.setBackgroundImage(UIImage(named: keys[index]), forState: UIControlState.Normal)
        profileDetail1.text = "\(profileImages[keys[index]]![0]), \(profileImages[keys[index]]![1])\n\(profileImages[keys[index]]![2])\n\(profileImages[keys[index]]![3])"
        
        forceSwipe(UISwipeGestureRecognizerDirection.Left)
        forceSwipe(UISwipeGestureRecognizerDirection.Left)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    func handleSwipes(sender:UISwipeGestureRecognizer) {
        forceSwipe(sender.direction)
        
        if(sender.direction == .Left) {
            swipeLeftUIUpdate()
        }
        else {
            swipeRightUIUpdate()
        }
    }
    
    func forceSwipe(direction: UISwipeGestureRecognizerDirection) {
        let updateIndex = direction == .Left ? 1 : -1
        
        print("index before swipt \(index)\n")
        index += updateIndex
        print("index after swipt \(index)\n")
        
        // As user is swiping left, check that the index does not become greater
        // than the size of the profile image otherwise, it cannot go any further
        if index >= profileImages.count { // swipe left
            // Went past the array bounds. start over
            index = 0
        } else if index < 0 { // swipe right
            // Jump to the back of the array
            index = profileImages.count - 1
        }
        
        print("new index \(index)\n")

    }

    @IBAction func pressedButton1(sender: UIButton) {
        goToProfile(index - 2, sender: sender)
    }
    
    @IBAction func pressedButton2(sender: UIButton) {
        goToProfile(index - 1, sender: sender)
    }
    
    @IBAction func pressedButton3(sender: UIButton) {
        goToProfile(index, sender: sender)
    }
    
    
    func goToProfile(selectedIndex: Int, sender: UIButton) {
        let keys = Array(profileImages.keys)
        
        print("pressed button 1 \(profileImages[keys[selectedIndex]]![0]) with selected index \(selectedIndex) and index \(index)")
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let profileController = storyBoard.instantiateViewControllerWithIdentifier("profileController") as! ProfileController
        
        profileController.profile = self.profile
        profileController.selectedMatchName = profileImages[keys[selectedIndex]]![0]
        profileController.selectedMatchImage = keys[selectedIndex]
        
        profileController.delegate = self.delegate
        
        //self.presentViewController(profileController, animated: true, completion: nil)
        
        self.delegate?.showInNavigation(profileController)
    }

    
    /*
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let keys = Array(profileImages.keys)
        
        print("\nMatchContainerViewController\nabout to seque and setting value for profileController \(profile.name) and image path: \(keys[selectedImageIndex]) and match name: \(profileImages[keys[selectedImageIndex]]![0])")
        
        let profileController:ProfileController = segue.destinationViewController as! ProfileController

        profileController.profile = self.profile
        profileController.selectedMatchName = profileImages[keys[selectedImageIndex]]![0]
        profileController.selectedMatchName = keys[selectedImageIndex]

    }
 */
}