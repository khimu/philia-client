//
//  ConversationViewController.swift
//  philia
//
//  Created by khim ung on 8/28/16.
//  Copyright © 2016 khim ung. All rights reserved.
//

import Foundation
import UIKit

class ConversationViewController: UITableViewController { //, UITableViewDataSource, UITableViewDelegate {
    
    //@IBOutlet weak var conversationTextField: UITableViewCell!
    
    
    var textArray = ["dfa","adf","adf","adf","adfasd"]
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ConversationCell") as UITableViewCell!
        
        cell.textLabel?.text = textArray[indexPath.row]
        
        
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textArray.count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         let json = [ "interest": profile.userInterest, "genderInterest": profile.userGenderPreference, "datingIntension": profile.userIntensionPreference, "city": profile.location, "state": "?", "zipcode": "?", "country": "US", "firstName": fullNameArr[0], "lastName": lastName, "birthdate": profile.birthday, "age": ageComponents ]
         
         //UIDevice.currentDevice().identifierForVendor!.UUIDString
         
         
         HttpHelper.httpHelper.saveConversation(json);
         
         HttpHelper.httpHelper.getConversation(json);
 */

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
