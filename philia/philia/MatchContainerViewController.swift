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
    
    var name:String = ""
    var birthday:String = ""
    var location:String = ""
    var userInterest: Int = 0
    var userGenderPreference: Int = 0
    var userIntensionPreference: Int = 0
    
    @IBOutlet weak var profileImage1: UIImageView!
    @IBOutlet weak var profileImage2: UIImageView!
    @IBOutlet weak var profileImage3: UIImageView!
    
    @IBOutlet weak var profileDetail1: UILabel!
    @IBOutlet weak var profileDetail2: UILabel!
    @IBOutlet weak var profileDetail3: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImage1.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.3)
        profileImage2.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.3)
        profileImage3.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.3)
        
        profileImage1.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.3)
        profileImage2.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.3)
        profileImage3.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.3)
        
        self.modalPresentationStyle = .OverCurrentContext
        
        profileImage1.image = UIImage(named: "philia");
        profileImage2.image = UIImage(named: "philia");
        profileImage3.image = UIImage(named: "philia");
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}