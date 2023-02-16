//
//  Admin.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 13/02/23.
//

import Foundation

class Admin:User,CustomStringConvertible{
    private let employeeId:Int
    private let dateOfJoining:String
    init(mailId: String, name: String, bloodGroup: BloodGroup, address: String, phoneNumber: Int,employeeId:Int,dateOfJoining:String){
        self.employeeId = employeeId
        self.dateOfJoining = dateOfJoining
        super.init(mailId: mailId, name: name, bloodGroup: bloodGroup, address: address, phoneNumber: phoneNumber)
    }
    public var description :String{
        return " mailId is \(userMailId)\n name is \(userName)\n bloodgroup is \(userBloodGroup)\n address is \(userAddress)\n employeeId is \(employeeId)\n doj is \(dateOfJoining)"
    }
   
}
