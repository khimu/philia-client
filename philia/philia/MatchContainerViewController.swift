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
    
    /*
     * Track the user's swipe left or right
     */
    private var index = 0
    
    var profileImages: [String: String] = ["philia1": "Beyonce, 30\nLas Vegas, NV\n7mi", "lasvegas1": "Scoobydoo, 32\nLas Vegas, NV\n5mi", "philia2": "Ashley, 28\nLas Vegas, NV\n2mi", "lasvegas2":"John Leer, 83\nSan Francisco, CA\n100mi"]
    
    
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
        
        swipeLeftUIUpdate()
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(MatchContainerViewController.handleSwipes(_:)))
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(MatchContainerViewController.handleSwipes(_:)))
        
        leftSwipe.direction = .Left
        rightSwipe.direction = .Right
        
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
    }
    
    func swipeLeftUIUpdate() {
        if(index > 0) {
            index -= 2
        }
        
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
    
    func swipeRightUIUpdate() {
        if(index < profileImages.count) {
            index += 1
        }
        
        let keys = Array(profileImages.keys)
        
        print("first index \(index)\n")
        profileImage1.image = UIImage(named: keys[index]);
        profileDetail1.text = profileImages[keys[index]]
        index -= 1
        
        print("second index \(index)\n")
        profileImage2.image = UIImage(named: keys[index]);
        profileDetail2.text = profileImages[keys[index]]
        
        print("third index \(index)\n")
        (index -= 1)
        profileImage3.image = UIImage(named: keys[index]);
        profileDetail3.text = profileImages[keys[index]]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func handleSwipes(sender:UISwipeGestureRecognizer) {
            let updateIndex = sender.direction == .Left ? 1 : -1
        
        print("index before swipt \(index)\n")
        index += updateIndex
        print("index after swipt \(index)\n")
 
        if index >= profileImages.count {
            // Went past the array bounds. start over
            index = 0
        } else if index < 0 {
            // Jump to the back of the array
            index = profileImages.count - 1
        }
        
        print("new index \(index)\n")
        
        if(sender.direction == .Left) {
            swipeLeftUIUpdate()
        }
        else {
            swipeRightUIUpdate()
        }
    }
    
}