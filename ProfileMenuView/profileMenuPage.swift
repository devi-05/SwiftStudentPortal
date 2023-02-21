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
    case .viewProfile:
        if(UtilFunctions.isStudent(mailId: mailId)){
            if let userProfile = profileManagerObj.viewProfile(mailId: mailId){
                print(userProfile)
            }
            else{
                print("No user found!")
            }
        }
        else{
            for options in AdminViewOptions.allCases.enumerated(){
                print("\(options.element.rawValue). \(options.element)")
            }
            let adminViewOptionsArray:[AdminViewOptions] = AdminViewOptions.allCases
            let adminViewOptionPreference:Int = UtilFunctions.getIntegerInput()
            let adminViewPreference:AdminViewOptions = adminViewOptionsArray[adminViewOptionPreference-1]
            switch adminViewPreference{
            case .viewOwnProfile:
                if let userProfile = profileManagerObj.viewProfile(mailId: mailId){
                    print(userProfile)
                }
                else{
                    print("No user found!")
                }
            case .viewstudentProfile:
                print("Enter Student MailId:")
                let studentMailId:String = UtilFunctions.getStringInput()
                if let userProfile = profileManagerObj.viewProfile(mailId: studentMailId){
                    print(userProfile)
                }
                else{
                    print("No user found!")
                }
            }
        }
    case .editProfile:
        if(UtilFunctions.isStudent(mailId: mailId)){
            editOwnProfile(mailId: mailId)}
        else{
            for options in AdminEditOptions.allCases.enumerated(){
                print("\(options.element.rawValue). \(options.element)")
            }
            let adminEditOptionsArray:[AdminEditOptions] = AdminEditOptions.allCases
            let adminEditOptionPreference:Int = UtilFunctions.getIntegerInput()
            let adminEditPreference:AdminEditOptions = adminEditOptionsArray[adminEditOptionPreference-1]
            switch adminEditPreference{
            case .editOwnProfile:
                editOwnProfile(mailId: mailId)
            case .editStudentProfile:
                editStudentProfile(mailId: mailId)
            }
        }
    }
}
