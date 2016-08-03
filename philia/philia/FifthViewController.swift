//
//  fifthViewController.swift
//  philia
//
//  Created by khim ung on 7/29/16.
//  Copyright © 2016 khim ung. All rights reserved.
//

import UIKit

class FifthViewController: UIViewController {
    

    // 1 = men, 2 = women, 3 = both
    let mapLabel1ToBitMapForGenderPreference: [Int: String] = [1: "Mr.", 2: "Mrs.", 4: "Mr or Mrs"]
    
    let mapLabel2ToBitMapForGenderPreference: [Int: String] = [1: "he'll", 2: "she'll", 4: "he or she will"]
    
    let mapLabel3ToBitMapForGenderPreference: [Int: String] = [1: "man", 2: "woman", 4: "partner"]

    @IBOutlet var mainMessageLabel: UILabel!
    
    @IBOutlet var subMessageLabel: UILabel!
    
    var name:String = ""
    var birthday:String = ""
    var location:String = ""
    var userInterest: Int = 0
    var userGenderPreference: Int = 0
    var userIntensionPreference: Int = 0
    

    @IBOutlet var debugLabel: UILabel!

    @IBOutlet var meetMatchesButton: UIButton!
    
    @IBAction func pressedButton(sender: UIButton) {
        sender.backgroundColor = UIColor.redColor()
        
        debugLabel.text = "do nothing for now \(userGenderPreference) and \(userIntensionPreference) and \(userInterest) for \(name)"
        
        // today
        let date = NSDate()
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"

        let calendar = NSCalendar.currentCalendar()
        
        let ageComponents = calendar.components(.Year,
                                                fromDate: dateFormatter.dateFromString(birthday)!,
                                                toDate: date,
                                                options: []).year
        
        var fullNameArr = name.split(regex: "[ ]+")
        let lastName = fullNameArr.count > 1 ? fullNameArr[1] : ""
        
        
        let json = [ "interest": userInterest, "genderInterest": userGenderPreference, "datingIntension": userIntensionPreference, "city": location, "state": "?", "zipcode": "?", "country": "US", "firstName": fullNameArr[0], "lastName": lastName, "birthdate": birthday, "age": ageComponents ]
        
        //UIDevice.currentDevice().identifierForVendor!.UUIDString
        

        HttpHelper.httpHelper.sendProfile(json);
        
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let secondMainViewController = storyBoard.instantiateViewControllerWithIdentifier("secondMainViewController") as! SecondMainViewController
        
        secondMainViewController.userInterest = userInterest
        secondMainViewController.name = name
        secondMainViewController.birthday = birthday
        secondMainViewController.location = location
        secondMainViewController.userGenderPreference = userGenderPreference;
        secondMainViewController.userIntensionPreference = userIntensionPreference

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.meetMatchesButton.layer.cornerRadius = 10
        
        mainMessageLabel.text = "Yah! All done, \(name)\nNext up... here are\nsome potential \(mapLabel1ToBitMapForGenderPreference[userGenderPreference]!) \(name)"
        
        subMessageLabel.text = "You'll be able to see what your\npotential \(mapLabel1ToBitMapForGenderPreference[userGenderPreference]!) looks like once\nyour values match!  Your profile\npictures will auto-unlock.\nSomeone out there has the key,\n what are ya waiting for?"
        
        UIColor.blackColor().colorWithAlphaComponent(0).CGColor
        view.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.3)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        navigationItem.title = "Ready To Match"
        if segue.identifier == "secondMainViewController" {
            segue.destinationViewController as! SecondMainViewController
        }
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