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
    
    var name:String = ""
    var birthday:String = ""
    var location:String = ""
    var userInterest: Int = 0
    var userGenderPreference: Int = 0
    var userIntensionPreference: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}