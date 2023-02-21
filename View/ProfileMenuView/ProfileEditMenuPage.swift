//
//  ProfileEditMenuPage.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 21/02/23.
//

import Foundation

func editOwnProfile(mailId:String){
    let db = DatabaseManager.dbManagerObj
    for editOptions in EditOwnProfileEnum.allCases.enumerated(){
        print("\(editOptions.element.rawValue). \(editOptions.element)")
    }
    let editOptionArray:[EditOwnProfileEnum] = EditOwnProfileEnum.allCases
    let editOptionPreference = Util.getIntegerInput()
    let editOption:EditOwnProfileEnum = editOptionArray[editOptionPreference-1]
    switch editOption{
    case .address:
        print("Enter your new address:")
        let newAddress:String = Util.getStringInput()
        db.editProfileInDb(attribute: .address, newAttribute: newAddress, mailId: mailId)
    case .phoneNumber:
        print("Enter your new phoneNumber:")
        let newPhonenumber:Int = Util.getIntegerInput()
        db.editProfileInDb(attribute: .phoneNumber,newAttribute: newPhonenumber, mailId: mailId)
    }
    
}

func editStudentProfile(){
    print("Enter student MailId:")
    let studentMailId:String = Util.getStringInput()
    let profManagerObj = ProfileManager()
    for options in EditStudentProfileEnum.allCases.enumerated(){
        print("\(options.element.rawValue). \(options.element)")
    }
    let editOptionArray:[EditStudentProfileEnum] = EditStudentProfileEnum.allCases
    let editOptionPreference = Util.getIntegerInput()
    let editOption:EditStudentProfileEnum = editOptionArray[editOptionPreference-1]
    switch editOption{
    case .address:
        print("Enter new address:")
        let newAddress:String = Util.getStringInput()
        profManagerObj.editProfile(attribute: .address,newAttribute: newAddress, mailId: studentMailId)
    case .phoneNumber:
        print("Enter new phoneNumber:")
        let newPhonenumber:Int = Util.getIntegerInput()
        profManagerObj.editProfile(attribute: .phoneNumber,newAttribute: newPhonenumber, mailId: studentMailId)
    case .residentialStatus:
        print("Enter new residential status from options below:")
        for options in ResidentialStatusEnum.allCases.enumerated(){
            print("\(options.element.rawValue). \(options.element)")
        }
        let residentialPreference:Int = Util.getIntegerInput()
        let residentialStatusArray:[ResidentialStatusEnum] = ResidentialStatusEnum.allCases
        let newResidentialStatus:ResidentialStatusEnum = residentialStatusArray[residentialPreference-1]
        profManagerObj.editProfile(attribute: .residentialStatus, newAttribute: newResidentialStatus, mailId: studentMailId)
    }
    
}
