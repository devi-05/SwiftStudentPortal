//
//  profileMenuPage.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 21/02/23.
//

import Foundation
struct ProfileMenuController{
    
     func profileMenuPageController(mailId:String){
        let profileManagerObj = ProfileManager()
        let editprofileManagerObj = ProfileEditMenupage()
    ProfileMenuLoop:while(true){
        print("Welcome to profile page!")
        for profileOptions in ProfileMenuoption.allCases.enumerated(){
            print("\(profileOptions.element.rawValue). \(profileOptions.element)")
        }
        let profileMenuOptionsArray:[ProfileMenuoption] = ProfileMenuoption.allCases
        let profileMenuOptionPreference = Validator.inputVerification(num: profileMenuOptionsArray.count)
        let profileMenuPreference = profileMenuOptionsArray[profileMenuOptionPreference-1]
        switch profileMenuPreference{
        case .viewProfile:
            if(Util.isStudent(mailId: mailId)){
                if let userProfile = profileManagerObj.viewProfile(mailId: mailId){
                    print(userProfile)
                }
                else{
                    print("No user found!")
                }
            }
            else{

                for options in AdminViewOption.allCases.enumerated(){
                    print("\(options.element.rawValue). \(options.element)")
                }
                let adminViewOptionsArray:[AdminViewOption] = AdminViewOption.allCases
                let adminViewOptionPreference = Validator.inputVerification(num: adminViewOptionsArray.count)
                let adminViewPreference = adminViewOptionsArray[adminViewOptionPreference-1]
                switch adminViewPreference{
                case .viewOwnProfile:
                    if let userProfile = profileManagerObj.viewProfile(mailId: mailId){
                        print(userProfile)}
                   
                case .viewstudentProfile:
                    print("Enter Student MailId:")
                    let studentMailId:String = Validator.mailVerifier()
                    guard Util.isStudent(mailId: studentMailId) else{
                        print("Enter student mailId alone!")
                        return
                    }
                    if let userProfile = profileManagerObj.viewProfile(mailId: studentMailId){
                        print(userProfile)
                    }
                    else{
                        print("---------------------------------------------------")
                        print("No such student found!")
                        print("---------------------------------------------------")
                    }
                }
            }
        case .editProfile:
            if(Util.isStudent(mailId: mailId)){
                editprofileManagerObj.editOwnProfile(mailId: mailId)}
            else{
                for options in AdminEditOption.allCases.enumerated(){
                    print("\(options.element.rawValue). \(options.element)")
                }
                let adminEditOptionsArray:[AdminEditOption] = AdminEditOption.allCases
                let adminEditOptionPreference = Validator.inputVerification(num: adminEditOptionsArray.count)
                let adminEditPreference = adminEditOptionsArray[adminEditOptionPreference-1]
                switch adminEditPreference{
                case .editOwnProfile:
                    editprofileManagerObj.editOwnProfile(mailId: mailId)
                case .editStudentProfile:
                    editprofileManagerObj.editStudentProfile()
                }
            }
        case .exit:
            print("Exiting from profile Page")
            break ProfileMenuLoop
        }
        
    }
    }
}
