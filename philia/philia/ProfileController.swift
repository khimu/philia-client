//
//  ProfileController.swift
//  philia
//
//  Created by khim ung on 8/6/16.
//  Copyright © 2016 khim ung. All rights reserved.
//

import Foundation
import UIKit

class ProfileController: UIViewController,UINavigationControllerDelegate {
    
    var delegate: DelegateUIViewController?
    
    var selectedMatchName: String = ""
    var selectedMatchImage: String = ""
    
    @IBOutlet var matchProfileImage: UIImageView!
    
    @IBOutlet var matchDetail: UIButton!

    @IBOutlet weak var messageButton: UIButton!
    /*
     * Gathers the user's information
     */
    var profile = ProfileModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\nProfileController\nviewDidLoad\nname:\(profile.name)")
        
       self.messageButton.layer.cornerRadius = 10
       self.matchDetail.layer.cornerRadius = 10
        
       self.matchDetail.setTitle("Say hello to \(self.selectedMatchName)", forState: .Normal)
        
       self.matchProfileImage.image = UIImage(named: selectedMatchImage)
        
        //self.delegate?.showInNavigation(<#T##nextController: UIViewController##UIViewController#>)
    }
    
    func navigationController(navigationController: UINavigationController, willShowViewController viewController: UIViewController,
                              animated: Bool) {
        
        if("profileController" == (self.navigationController?.visibleViewController!.restorationIdentifier)!) {
            self.navigationController!.setNavigationBarHidden(false, animated:true)
        }
        else {
            self.navigationController!.setNavigationBarHidden(true, animated:true)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}