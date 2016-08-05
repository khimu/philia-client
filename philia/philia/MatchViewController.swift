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
    
    var profileImages: [String: String] = ["philia": "Beyonce, 30\nLas Vegas, NV\n7mi", "lasvegas": "Scoobydoo, 32\nLas Vegas, NV\n5mi", "philia": "Ashley, 28\nLas Vegas, NV\n2mi", "lasvegas":"John Leer, 83\nSan Francisco, CA\n100mi"]
    
    /*
     * This needs to be an array dynamically created from server data
     */
    @IBOutlet var profileImage1: UIImageView!
    @IBOutlet var profileImage2: UIImageView!
    @IBOutlet var profileImage3: UIImageView!
    
    @IBOutlet var profileDetail1: UILabel!
    @IBOutlet var profileDetail2: UILabel!
    @IBOutlet var profileDetail3: UILabel!
    
    /*
     * Track the user's swipe left or right
     */
    private var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIColor.blackColor().colorWithAlphaComponent(0).CGColor
        view.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.3)
        
        self.updateSwipeUI()

    }
    
    func updateSwipeUI() {
        let keys = Array(profileImages.keys)
        
        profileImage1.image = UIImage(named: keys[index]);
        profileDetail1.text = profileImages[keys[index]]
        index += 1
        profileImage2.image = UIImage(named: keys[index]);
        profileDetail2.text = profileImages[keys[index]]
        (index += 1)
        profileImage3.image = UIImage(named: keys[index]);
        profileDetail3.text = profileImages[keys[index]]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pictureSwipe(sender: UISwipeGestureRecognizer) {
        let updateIndex = sender.direction == .Left ? 1 : -1
        
        index += updateIndex
        
        if index >= profileImages.count {
            // Went past the array bounds. start over
            index = 0
        } else if index < 0 {
            // Jump to the back of the array
            index = profileImages.count - 1
        }
        
        updateSwipeUI()
    }
}
