//
//  Profile.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 17/02/23.
//

import Foundation

struct Profile{
    var db = DatabaseManager.dbManagerObj
    var rollNumberInitialCount = 1
    mutating func getUserDetails(mailId:String){
        print("Enter details to create your profile")
        print("Enter name:")
        let name:String = UtilFunctions.getStringInput()
        print("Enter PhoneNumber:")
        let phoneNumber:Int = UtilFunctions.getIntegerInput()
        print("Enter Address:")
        let address:String = UtilFunctions.getStringInput()
        print("Enter bloodGroup from below options:")
        for bgOptions in BloodGroup.allCases.enumerated(){
            print("\(bgOptions.element.rawValue). \(bgOptions.element)")
        }
        let bloodGroupOptionsArray:[BloodGroup] = BloodGroup.allCases
        let bloodGroupPreference:Int = UtilFunctions.getIntegerInput()
        let bloodGroup:BloodGroup = bloodGroupOptionsArray[bloodGroupPreference-1]
        
        if(UtilFunctions.isStudent(mailId: mailId)){

            let rollNumber:String = "S"+String(rollNumberInitialCount)
            rollNumberInitialCount+=1
            print("Enter department from below options:")
            for deptOptions in DeptEnum.allCases.enumerated(){
                print("\(deptOptions.element.rawValue). \(deptOptions.element)")
            }
            let departmentOptionsArray:[DeptEnum]=DeptEnum.allCases
            let deptPreference:Int = UtilFunctions.getIntegerInput()
            let department:DeptEnum = departmentOptionsArray[deptPreference-1]
            let joiningYear:String = UtilFunctions.getStudentjoiningyear()
            print("Enter your mode of joining from options below:")
            for options in ModeOfJoiningEnum.allCases.enumerated(){
                print("\(options.element.rawValue). \(options.element)")
            }
            let modePreference:Int = UtilFunctions.getIntegerInput()
            let modeOfJoiningArray:[ModeOfJoiningEnum] = ModeOfJoiningEnum.allCases
            let modeOfJoining:ModeOfJoiningEnum = modeOfJoiningArray[modePreference-1]
            let modeOfJoiningFees:Int = modeOfJoiningAndFees[modeOfJoining]!
            print("Enter your residential status from options below:")
            for options in ResidentialStatusEnum.allCases.enumerated(){
                print("\(options.element.rawValue). \(options.element)")
            }
            let residentialPreference:Int = UtilFunctions.getIntegerInput()
            let residentialStatusArray:[ResidentialStatusEnum] = ResidentialStatusEnum.allCases
            let residentialStatus:ResidentialStatusEnum = residentialStatusArray[residentialPreference-1]
            let residentialStatusFees:Int = residentialStatusAndFees[residentialStatus]!
            let transportFees:Int = 40000
            let miscellaneousFees:Int = 45000
            let totalFees:Int = modeOfJoiningFees+transportFees+miscellaneousFees
            let feesPaid:Int = 0
            
        
            let newStudent = Student(mailId: mailId, name: name, bloodGroup: bloodGroup, address: address, phoneNumber: phoneNumber, rollNumber: rollNumber, department: department, joiningYear: joiningYear, modeOfJoining: modeOfJoining, modeOfJoiningFees: modeOfJoiningFees, transportFees: transportFees, miscellaneousFees: miscellaneousFees, residentialStatus: residentialStatus, residentialStatusFees: residentialStatusFees, totalFees: totalFees, feesPaid: feesPaid)
            db.addToStudentDb(mailId: mailId, student: newStudent)
        }
        else{
            let adminId:String = "A" + String(rollNumberInitialCount)
            let dateofJoining:String = UtilFunctions.getEmployeedoj()
            let newAdmin = Admin(mailId: mailId, name: name, bloodGroup: bloodGroup, address: address, phoneNumber: phoneNumber, adminId: adminId, dateOfJoining: dateofJoining)
            
            db.addToAdminDb(mailId: mailId, admin: newAdmin)
            
        }
    }
    
}
