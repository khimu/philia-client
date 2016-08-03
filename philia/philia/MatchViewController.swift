//
//  MatchViewController.swift
//  philia
//
//  Created by khim ung on 8/2/16.
//  Copyright © 2016 khim ung. All rights reserved.
//

import Foundation
import UIKit

class MatchViewController: UICollectionViewController {
    
    var name:String = ""
    var birthday:String = ""
    var location:String = ""
    var userInterest: Int = 0
    var userGenderPreference: Int = 0
    var userIntensionPreference: Int = 0
    
    /*
     * This needs to be an array dynamically created from server data
     */
    @IBOutlet var profileImage1: UIImageView!
    @IBOutlet var profileImage2: UIImageView!
    @IBOutlet var profileImage3: UIImageView!
    
    @IBOutlet var profileDetail1: UILabel!
    @IBOutlet var profileDetail2: UILabel!
    @IBOutlet var profileDetail3: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIColor.blackColor().colorWithAlphaComponent(0).CGColor
        view.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.3)
        
        profileImage1.image = UIImage(named: "philia");
        profileImage2.image = UIImage(named: "philia");
        profileImage3.image = UIImage(named: "philia");
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
