//
//  Profile.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 17/02/23.
//

import Foundation

class Profile{
    func getUserDetails(mailId:String){
        print("Enter details to create your profile")
        print("Enter name:")
        let name:String = UtilFunctions.getStringInput()
        print("Enter PhoneNumber:")
        var phoneNumber:Int = UtilFunctions.getIntegerInput()
        print("Enter Address:")
        var address:String = UtilFunctions.getStringInput()
        print("Enter bloodGroup from below options:")
        for bgOptions in BloodGroup.allCases.enumerated(){
            print("\(bgOptions.element.rawValue). \(bgOptions.element)")
        }
        var bloodGroupOptionsArray:[BloodGroup] = BloodGroup.allCases
        let bloodGroupPreference:Int = UtilFunctions.getIntegerInput()
        let bloodGroup:BloodGroup = bloodGroupOptionsArray[bloodGroupPreference]
        
        if(UtilFunctions.isStudent(mailId: mailId)){
            var rollNumberInitialCount = 1
            let rollNumber:String = "S"+String(rollNumberInitialCount)
            rollNumberInitialCount+=1
            print("Enter department from below options:")
            for deptOptions in DeptEnum.allCases.enumerated(){
                print("\(deptOptions.element.rawValue). \(deptOptions.element)")
            }
            var departmentOptionsArray:[DeptEnum]=DeptEnum.allCases
            let deptPreference:Int = UtilFunctions.getIntegerInput()
            let department:DeptEnum = departmentOptionsArray[deptPreference]
            let joiningYear:String = UtilFunctions.getStudentjoiningyear()
            print("Enter your mode of joining from options below:")
            for options in ModeOfJoiningEnum.allCases.enumerated(){
                print("\(options.element.rawValue). \(options.element)")
            }
            let modePreference:Int = UtilFunctions.getIntegerInput()
            var modeOfJoiningArray:[ModeOfJoiningEnum] = ModeOfJoiningEnum.allCases
            var modeOfJoining:ModeOfJoiningEnum = modeOfJoiningArray[modePreference]
            var modeOfJoiningFees:Int = modeOfJoiningAndFees[modeOfJoining]!
            print("Enter your residential status from options below:")
            for options in ResidentialStatusEnum.allCases.enumerated(){
                print("\(options.element.rawValue). \(options.element)")
            }
            let residentialPreference:Int = UtilFunctions.getIntegerInput()
            var residentialStatusArray:[ResidentialStatusEnum] = ResidentialStatusEnum.allCases
            var residentialStatus:ResidentialStatusEnum = residentialStatusArray[residentialPreference]
            var residentialStatusFees:Int = residentialStatusAndFees[residentialStatus]!
             let transportFees:Int = 40000
            let miscellaneousFees:Int = 45000
            var totalFees:Int = modeOfJoiningFees+transportFees+miscellaneousFees
            var feesPaid:Int = 0
            var newStudent = 
        }
    }
    
}
