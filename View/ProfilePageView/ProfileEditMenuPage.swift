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
        
        for editOptions in EditOwnProfileEnum.allCases.enumerated(){
            print("\(editOptions.element.rawValue). \(editOptions.element)")
        }
        let editOptionArray:[EditOwnProfileEnum] = EditOwnProfileEnum.allCases
        let editOptionPreference = Validator.inputVerification(num: editOptionArray.count)
        let editOption:EditOwnProfileEnum = editOptionArray[editOptionPreference-1]
        switch editOption{
        case .address:
            print("Enter your new address:")
            let newAddress:String = Util.getStringInput()
            db.editProfileInDb(attribute: .address, newAttribute: newAddress, mailId: mailId)
        case .phoneNumber:
            print("Enter your new phoneNumber:")
            let newPhonenumber:String = Validator.phoneNumberVerifier()
            db.editProfileInDb(attribute: .phoneNumber,newAttribute: newPhonenumber, mailId: mailId)
        }
        
    }
    
    func editStudentProfile(){
        print("Enter student MailId:")
        let studentMailId:String = Validator.mailVerifier()
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
                for options in EditStudentProfileEnum.allCases.enumerated(){
                    print("\(options.element.rawValue). \(options.element)")
                }
        let editOptionArray:[EditStudentProfileEnum] = EditStudentProfileEnum.allCases
        let editOptionPreference = Validator.inputVerification(num: editOptionArray.count)
        let editOption:EditStudentProfileEnum = editOptionArray[editOptionPreference-1]
        switch editOption{
        case .address:
            print("Enter new address:")
            let newAddress:String = Util.getStringInput()
            profManagerObj.editProfile(attribute: .address,newAttribute: newAddress, mailId: studentMailId)
        case .phoneNumber:
            print("Enter new phoneNumber:")
            let newPhonenumber:String = Validator.phoneNumberVerifier()
            profManagerObj.editProfile(attribute: .phoneNumber,newAttribute: newPhonenumber, mailId: studentMailId)
        case .residentialStatus:
            print("Enter new residential status from options below:")
            for options in ResidentialStatusEnum.allCases.enumerated(){
                print("\(options.element.rawValue). \(options.element)")
            }
            let residentialStatusArray:[ResidentialStatusEnum] = ResidentialStatusEnum.allCases
            let residentialPreference:Int = Validator.inputVerification(num: residentialStatusArray.count)
            let newResidentialStatus:ResidentialStatusEnum = residentialStatusArray[residentialPreference-1]
            profManagerObj.editResidentialStatus(attribute: .residentialStatus, newAttribute: newResidentialStatus, mailId: studentMailId)
        }
        
    }
    
}
