//
//  SecondMainViewController.swift
//  philia
//
//  Created by khim ung on 8/2/16.
//  Copyright © 2016 khim ung. All rights reserved.
//

import Foundation
import UIKit

class SecondMainViewController: UITabBarController {
    
    
    /*
     * Gathers the user's information
     */
    var profile = ProfileModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print ("\nSecondMainViewController\nname \(profile.name) birthday: \(profile.birthday)\n\n")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}