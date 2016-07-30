//
//  File.swift
//  philia
//
//  Created by khim ung on 7/29/16.
//  Copyright © 2016 khim ung. All rights reserved.
//

import Foundation
import UIKit

class HelperUtil {
    static let helperUtil = HelperUtil()
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        if userDefaults.objectForKey("ApplicationIdentifier") == nil {
            let UUID = NSUUID().UUIDString
            userDefaults.setObject(UUID, forKey: "ApplicationIdentifier")
            userDefaults.synchronize()
        }
        return true
    }

}