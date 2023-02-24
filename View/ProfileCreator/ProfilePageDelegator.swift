//
//  Profile.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 17/02/23.
//

import Foundation

struct ProfilePageDelegator{
    var db = DatabaseManager.sharedInstance
    var rollNumberInitialCount = 1
    mutating func getUserDetails(mailId:String){
        print("Enter details to create your profile")
        print("Enter name:")
        let name:String = Util.getStringInput()
        print("Enter PhoneNumber:")
        let phoneNumber:Int = Util.getIntegerInput()
        print("Enter Address:")
        let address:String = Util.getStringInput()
        print("Enter bloodGroup from below options:")
        for bgOptions in BloodGroup.allCases.enumerated(){
            print("\(bgOptions.element.rawValue). \(bgOptions.element)")
        }
        let bloodGroupOptionsArray:[BloodGroup] = BloodGroup.allCases
        let bloodGroupPreference:Int = Util.getIntegerInput()
        let bloodGroup:BloodGroup = bloodGroupOptionsArray[bloodGroupPreference-1]
        
        if(Util.isStudent(mailId: mailId)){

            let rollNumber:String = "S"+String(rollNumberInitialCount)
            rollNumberInitialCount+=1
            print("Enter department from below options:")
            for deptOptions in DeptEnum.allCases.enumerated(){
                print("\(deptOptions.element.rawValue). \(deptOptions.element)")
            }
            let departmentOptionsArray:[DeptEnum]=DeptEnum.allCases
            let deptPreference:Int = Util.getIntegerInput()
            let department:DeptEnum = departmentOptionsArray[deptPreference-1]
            let joiningYear:String = Util.getStudentjoiningyear()
            print("Enter your mode of joining from options below:")
            for options in ModeOfJoiningEnum.allCases.enumerated(){
                print("\(options.element.rawValue). \(options.element)")
            }
            let modePreference:Int = Util.getIntegerInput()
            let modeOfJoiningArray:[ModeOfJoiningEnum] = ModeOfJoiningEnum.allCases
            let modeOfJoining:ModeOfJoiningEnum = modeOfJoiningArray[modePreference-1]
            let modeOfJoiningFees:Int = modeOfJoining.getModeOfJoiningFees()
            print("Enter your residential status from options below:")
            for options in ResidentialStatusEnum.allCases.enumerated(){
                print("\(options.element.rawValue). \(options.element)")
            }
            let residentialPreference:Int = Util.getIntegerInput()
            let residentialStatusArray:[ResidentialStatusEnum] = ResidentialStatusEnum.allCases
            let residentialStatus:ResidentialStatusEnum = residentialStatusArray[residentialPreference-1]
            let residentialStatusFees:Int = residentialStatus.getResidentialFees()
            let transportFees:Int = 40000
            let miscellaneousFees:Int = 45000
            let feesWithoutResidentialFees = modeOfJoiningFees+transportFees+miscellaneousFees
            let totalFees:Int = feesWithoutResidentialFees+residentialStatusFees
            let feesPaid:Int = 0
            let feesBalance:Int = (totalFees-feesPaid)
        
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
