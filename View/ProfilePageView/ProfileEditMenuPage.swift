//
//  ProfileEditMenuPage.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 21/02/23.
//

import Foundation
struct ProfileEditMenupage{
    private let db = DatabaseManager.sharedInstance
    func editOwnProfile(mailId:String){
        
        for editOptions in EditOwnProfile.allCases.enumerated(){
            print("\(editOptions.element.rawValue). \(editOptions.element)")
        }
        let editOptionArray:[EditOwnProfile] = EditOwnProfile.allCases
        let editOptionPreference = Validator.inputVerification(num: editOptionArray.count)
        let editOption = editOptionArray[editOptionPreference-1]
        switch editOption{
        case .address:
            print("Enter your new address:")
            let newAddress:String = Util.getStringInput()
            db.editProfileInDb(attribute: .address, newInput:  newAddress, mailId: mailId)
        case .phoneNumber:
            print("Enter your new phoneNumber:")
            let newPhonenumber:String = Validator.phoneNumberVerifier()
            db.editProfileInDb(attribute: .phoneNumber,newInput:  newPhonenumber, mailId: mailId)
        }
        
    }
    
    func editStudentProfile(){
        print("Enter student MailId:")
        let studentMailId = Validator.mailVerifier()
        guard Util.isStudent(mailId: studentMailId) else{
            print("Enter student mailId alone!")
            return
        }
        guard db.doesStudentExist(mailId: studentMailId) else{
            print("---------------------------------------------------")
            print("Student doesnt exist!")
            print("---------------------------------------------------")
            return
        }
            let profManagerObj = ProfileManager()
                for options in EditStudentProfile.allCases.enumerated(){
                    print("\(options.element.rawValue). \(options.element)")
                }
        let editOptionArray:[EditStudentProfile] = EditStudentProfile.allCases
        let editOptionPreference = Validator.inputVerification(num: editOptionArray.count)
        let editOption = editOptionArray[editOptionPreference-1]
        switch editOption{
        case .address:
            print("Enter new address:")
            let newAddress = Util.getStringInput()
            profManagerObj.editProfile(attribute: .address,newInput: newAddress, mailId: studentMailId)
        case .phoneNumber:
            print("Enter new phoneNumber:")
            let newPhonenumber = Validator.phoneNumberVerifier()
            profManagerObj.editProfile(attribute: .phoneNumber,newInput: newPhonenumber, mailId: studentMailId)
        case .residentialStatus:
            print("Enter new residential status from options below:")
            for options in ResidentialStatus.allCases.enumerated(){
                print("\(options.element.rawValue). \(options.element)")
            }
            let residentialStatusArray:[ResidentialStatus] = ResidentialStatus.allCases
            let residentialPreference = Validator.inputVerification(num: residentialStatusArray.count)
            let newResidentialStatus = residentialStatusArray[residentialPreference-1]
            profManagerObj.editResidentialStatus(attribute: .residentialStatus, newInput: newResidentialStatus, mailId: studentMailId)
        }
        
    }
    
}
