//
//  main.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 13/02/23.
//

import Foundation

print("welcome to student portal")
var student = studentPortal()


for options in PortalOptions.allCases.enumerated(){
    print("\(options.element.rawValue) \(options.element)")
}

 let preference:Int = UtilFunctions.getIntegerInput()
    switch preference{
    case 1:
        for _ in 1...2 {
            student.signUp()
        }
    case 2:
        student.signOut()
    default:
        print("invalid value")
    }
    






//var obj = Admin(mailId: "devi@22", name: "dev", bloodGroup: .ABNegative, address: "fghj", phoneNumber: 1234567, employeeId: 12345, dateOfJoining: "qew34rt")
//
//
//print(obj.description)
//
//var obj1 = Student(mailId: "dev@23", name: "devi", bloodGroup: .ABNegative, address: "bv", phoneNumber: 12345, rollNumber: 09, department: "kj", joiningYear: 23, modeOfJoining: "counselling", modeOfJoiningFees: 12345, transportFees: 987654, miscellaneousFees: 9876, residentialStatus: "hosteller", residentialStatusFees: 876, totalFees: 87654, feesPaid: 45678)
//
//print(obj1.description)
