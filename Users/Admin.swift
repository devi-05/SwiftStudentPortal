//
//  Admin.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 13/02/23.
//

import Foundation

class Admin:User,CustomStringConvertible{
    private let adminId:String
    private let dateOfJoining:String
    init(_ mailId: String, _ name: String, _ bloodGroup: BloodGroup, _ address: String, _ phoneNumber: String,_ adminId:String,_ dateOfJoining:String){
        self.adminId = adminId
        self.dateOfJoining = dateOfJoining
        super.init( mailId, name,  bloodGroup,  address,  phoneNumber)
    }
    public var description :String{
        return " MailId : \(userMailId)\n Name : \(userName)\n Bloodgroup : \(userBloodGroup)\n Address : \(userAddress)\n EmployeeId : \(adminId)\n Doj : \(dateOfJoining)"
    }
   
}
