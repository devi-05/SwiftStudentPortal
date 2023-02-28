//
//  Profile.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 17/02/23.
//

import Foundation

struct ProfilePageDelegator{
    private var db = DatabaseManager.sharedInstance
    var rollNumberInitialCount = 1
    mutating func getUserDetails(mailId:String){
        print("Enter details to create your profile")
        print("Enter name:")
        let name = Validator.nameVerifier()
        print("Enter PhoneNumber:")
        let phoneNumber = Validator.phoneNumberVerifier()
        print("Enter Address:")
        let address = Util.getStringInput()
        print("Enter bloodGroup from below options:")
        
        for bgOptions in BloodGroup.allCases.enumerated(){
            print("\(bgOptions.element.rawValue). \(bgOptions.element)")
        }
        let bloodGroupOptionsArray:[BloodGroup] = BloodGroup.allCases
        let bloodGroupPreference = Validator.inputVerification(num: bloodGroupOptionsArray.count)
        let bloodGroup = bloodGroupOptionsArray[bloodGroupPreference-1]
        
        if(Util.isStudent(mailId: mailId)){

            let rollNumber:String = "S"+String(rollNumberInitialCount)
            rollNumberInitialCount+=1
            print("Enter department from below options:")
            
            for deptOptions in Dept.allCases.enumerated(){
                print("\(deptOptions.element.rawValue). \(deptOptions.element)")
            }
            
            let departmentOptionsArray:[Dept]=Dept.allCases
            let deptPreference = Validator.inputVerification(num: departmentOptionsArray.count)
            let department = departmentOptionsArray[deptPreference-1]
            let joiningYear = Util.getStudentjoiningyear()
            
            print("Enter your mode of joining from options below:")
            for options in ModeOfJoining.allCases.enumerated(){
                print("\(options.element.rawValue). \(options.element)")
            }
            let modeOfJoiningArray:[ModeOfJoining] = ModeOfJoining.allCases
            let modePreference = Validator.inputVerification(num: modeOfJoiningArray.count)
            let modeOfJoining = modeOfJoiningArray[modePreference-1]
            let modeOfJoiningFees = modeOfJoining.getModeOfJoiningFees()
            print("Enter your residential status from options below:")
            for options in ResidentialStatus.allCases.enumerated(){
                print("\(options.element.rawValue). \(options.element)")
            }
            let residentialStatusArray:[ResidentialStatus] = ResidentialStatus.allCases
            let residentialPreference = Validator.inputVerification(num: residentialStatusArray.count)
            let residentialStatus = residentialStatusArray[residentialPreference-1]
            let residentialStatusFees = residentialStatus.getResidentialFees()
            let transportFees = 40000
            let miscellaneousFees = 45000
            let feesWithoutResidentialFees = modeOfJoiningFees+transportFees+miscellaneousFees
            let totalFees = feesWithoutResidentialFees+residentialStatusFees
            let feesPaid = 0
            let feesBalance = (totalFees-feesPaid)
        
            let newStudent = Student(mailId, name, bloodGroup, address, phoneNumber, rollNumber, department, joiningYear, modeOfJoining, modeOfJoiningFees, transportFees, miscellaneousFees,feesWithoutResidentialFees, residentialStatus, residentialStatusFees, totalFees, feesPaid, feesBalance)
            db.addToStudentDb(mailId: mailId, student: newStudent)
        }
        else{
            let adminId:String = "A" + String(rollNumberInitialCount)
            let dateofJoining:String = Util.getEmployeedoj()
            let newAdmin = Admin(mailId, name, bloodGroup, address, phoneNumber, adminId, dateofJoining)
            
            db.addToAdminDb(mailId: mailId, admin: newAdmin)
            
        }
    }
    
}
