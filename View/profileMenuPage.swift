//
//  profileMenuPage.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 21/02/23.
//

import Foundation

public func profileMenuPage(mailId:String){
    let profileManagerObj = ProfileManager()
    print("Welcome to profile page!")
    for profileOptions in ProfileMenuoptions.allCases.enumerated(){
        print("\(profileOptions.element.rawValue). \(profileOptions.element)")
    }
    let profileMenuOptionsArray:[ProfileMenuoptions] = ProfileMenuoptions.allCases
    let profileMenuOptionPreference:Int = UtilFunctions.getIntegerInput()
    let profileMenuPreference:ProfileMenuoptions = profileMenuOptionsArray[profileMenuOptionPreference-1]
    switch profileMenuPreference{
//    case .createProfile:
//        profileManagerObj.createProfile(mailId:mailId)
    case .viewProfile:
        if let userProfile = profileManagerObj.viewProfile(mailId: mailId){
            print(userProfile)
        }
        else{
            print("No user found!")
        }
    case .editProfile:
        profileManagerObj.editProfile(mailId: mailId)
    }
}
