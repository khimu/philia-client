//
//  ProfileModel.swift
//  philia
//
//  Created by khim ung on 8/7/16.
//  Copyright © 2016 khim ung. All rights reserved.
//

import Foundation



class ProfileModel: NSObject {
    // 1 = men, 2 = women, 3 = both
    let mapLabel1ToBitMapForGenderPreference: [Int: String] = [1: "Mr.", 2: "Mrs.", 4: "Mr or Mrs"]
    
    let mapLabel2ToBitMapForGenderPreference: [Int: String] = [1: "he'll", 2: "she'll", 4: "he or she will"]
    
    let mapLabel3ToBitMapForGenderPreference: [Int: String] = [1: "man", 2: "woman", 4: "partner"]
    
    var name:String = ""
    var birthday:String = ""
    var location:String = ""
    var userInterest: Int = 0
    var userGenderPreference: Int = 0
    var userIntensionPreference: Int = 0

    func userGenderPreferenceLabel() -> String {
        return mapLabel1ToBitMapForGenderPreference[userGenderPreference]!;
    }
    
    func userGenderPreferenceLabel2() -> String {
        return mapLabel2ToBitMapForGenderPreference[userGenderPreference]!;
    }
    
    func userGenderPreferenceLabel3() -> String {
        return mapLabel3ToBitMapForGenderPreference[userGenderPreference]!;
    }
    
    
}