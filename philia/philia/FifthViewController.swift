//
//  fifthViewController.swift
//  philia
//
//  Created by khim ung on 7/29/16.
//  Copyright © 2016 khim ung. All rights reserved.
//

import UIKit

class FifthViewController: UIViewController {
    
    /*
     * Gathers the user's information
     */
    var profile = ProfileModel()

    @IBOutlet var mainMessageLabel: UILabel!
    
    @IBOutlet var subMessageLabel: UILabel!
    
    @IBOutlet var debugLabel: UILabel!

    @IBOutlet var meetMatchesButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.meetMatchesButton.layer.cornerRadius = 10
        
        print("\nFifthViewController\nviewDidLoad\nname:\(profile.name)")
        
        mainMessageLabel.text = "Yah! All done, \(profile.name)\nNext up... here are\nsome potential \(profile.userGenderPreferenceLabel()) \(profile.name)"
        
        subMessageLabel.text = "You'll be able to see what your\npotential \(profile.userGenderPreferenceLabel()) looks like once\nyour values match!  Your profile\npictures will auto-unlock.\nSomeone out there has the key,\n what are ya waiting for?"
        
        UIColor.blackColor().colorWithAlphaComponent(0).CGColor
        view.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.3)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
            print("\nFifthViewController\nabout to seque and setting value for secondMainViewController \(profile.name)")
            
            // today
            let date = NSDate()
            
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            
            let calendar = NSCalendar.currentCalendar()
            
            let ageComponents = calendar.components(.Year,
                                                    fromDate: dateFormatter.dateFromString(profile.birthday)!,
                                                    toDate: date,
                                                    options: []).year
            
            var fullNameArr = profile.name.split(regex: "[ ]+")
            let lastName = fullNameArr.count > 1 ? fullNameArr[1] : ""
            
            
            let json = [ "interest": profile.userInterest, "genderInterest": profile.userGenderPreference, "datingIntension": profile.userIntensionPreference, "city": profile.location, "state": "?", "zipcode": "?", "country": "US", "firstName": fullNameArr[0], "lastName": lastName, "birthdate": profile.birthday, "age": ageComponents ]
            
            //UIDevice.currentDevice().identifierForVendor!.UUIDString
            
            HttpHelper.httpHelper.sendProfile(json);
        
            let secondMainViewController:SecondMainViewController = segue.destinationViewController as! SecondMainViewController
        
            secondMainViewController.profile = self.profile
            
            print("Set to secondMainViewController profile.name:" + secondMainViewController.profile.name)
            
            let matchContainerViewController = secondMainViewController.viewControllers![0] as! MatchContainerViewController

            matchContainerViewController.profile = self.profile

    }
}

extension String {
    
    func split(regex pattern: String) -> [String] {
        
        guard let re = try? NSRegularExpression(pattern: pattern, options: [])
            else { return [] }
        
        let nsString = self as NSString // needed for range compatibility
        let stop = "<SomeStringThatYouDoNotExpectToOccurInSelf>"
        let modifiedString = re.stringByReplacingMatchesInString(
            self,
            options: [],
            range: NSRange(location: 0, length: nsString.length),
            withTemplate: stop)
        return modifiedString.componentsSeparatedByString(stop)
    }
}

