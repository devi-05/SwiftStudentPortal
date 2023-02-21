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
    init(mailId: String, name: String, bloodGroup: BloodGroup, address: String, phoneNumber: Int,adminId:String,dateOfJoining:String){
        self.adminId = adminId
        self.dateOfJoining = dateOfJoining
        super.init(mailId: mailId, name: name, bloodGroup: bloodGroup, address: address, phoneNumber: phoneNumber)
    }
    public var description :String{
        return " MailId : \(userMailId)\n Name : \(userName)\n Bloodgroup : \(userBloodGroup)\n Address : \(userAddress)\n EmployeeId : \(adminId)\n Doj : \(dateOfJoining)"
    }
   
}
