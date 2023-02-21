//
//  User.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 16/02/23.
//

import Foundation


class User{
    private let mailId:String
    private let name:String
    private let bloodGroup:BloodGroup
    private var address:String
    private var phoneNumber:Int
    init(_ mailId: String, _ name: String, _ bloodGroup: BloodGroup, _ address: String, _ phoneNumber: Int) {
        self.mailId = mailId
        self.name = name
        self.bloodGroup = bloodGroup
        self.address = address
        self.phoneNumber = phoneNumber
    }
    public var userMailId:String{
        get {
            return self.mailId
        }
    }
    public var userName:String{
        get{
            return self.name
        }
    }
    public var userBloodGroup:BloodGroup{
        get{
            return self.bloodGroup
        }
    }
    public var userAddress:String{
        get{
            return self.address
        }
        set{
            self.address = newValue
        }
    }
    public var userPhoneNumber:Int{
        get{
            return self.phoneNumber
        }
        set{
            self.phoneNumber = newValue
        }
    }
}
