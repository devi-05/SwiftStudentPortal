//
//  Student.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 13/02/23.
//

import Foundation


class Student:User,CustomStringConvertible{
    
    private let rollNumber :String
    private let department:Dept
    private let joiningYear:String
    private let modeOfJoining:ModeOfJoining
    private let modeOfJoiningFees:Int
    private let transportFees:Int
    private let miscellaneousFees:Int
    private let feesWithoutResidentialFees:Int
    private var residentialStatus:ResidentialStatus
    private var residentialStatusFees:Int
    private var totalFees:Int
    private var feesPaid:Int
    private var feesBalance:Int
    
    
    init(_ mailId: String, _ name: String, _ bloodGroup:BloodGroup, _ address: String, _ phoneNumber: String,_ rollNumber: String, _ department: Dept, _ joiningYear: String, _ modeOfJoining: ModeOfJoining, _ modeOfJoiningFees: Int, _ transportFees: Int, _ miscellaneousFees: Int,_ feesWithoutResidentialFees:Int, _ residentialStatus: ResidentialStatus, _ residentialStatusFees: Int, _ totalFees: Int, _ feesPaid: Int,_ feesBalance:Int) {
        
        self.rollNumber = rollNumber
        self.department = department
        self.joiningYear = joiningYear
        self.modeOfJoining = modeOfJoining
        self.modeOfJoiningFees = modeOfJoiningFees
        self.transportFees = transportFees
        self.miscellaneousFees = miscellaneousFees
        self.feesWithoutResidentialFees = feesWithoutResidentialFees
        self.residentialStatus = residentialStatus
        self.residentialStatusFees = residentialStatusFees
        self.totalFees = totalFees
        self.feesPaid = feesPaid
        self.feesBalance = feesBalance
        super.init(mailId, name, bloodGroup, address, phoneNumber)
        
    }
    
    
    public var studentRollNumber:String{
        get {
            return self.rollNumber
        }
    }
    
    public var studentDepartment:Dept{
        get{
            return self.department
        }
    }
    
    public var studentJoiningYear:String{
        get{
            return self.joiningYear
        }
    }
    
    public var studentModeOfJoining:ModeOfJoining{
        get{
            return self.modeOfJoining
        }
    }
    
    public var studentModeOfJoiningFees:Int{
        get{
            return self.modeOfJoiningFees
        }
    }
    
    public var studentTransportFees:Int{
        get{
            return self.transportFees
        }
    }
    
    public var studentMiscellaneousFees:Int{
        get{
            return self.miscellaneousFees
        }
    }
    public var studentFeesWithoutResidentialFees:Int{
        get{
            return self.feesWithoutResidentialFees
        }
    }
    
    public var studentResidentialStatus:ResidentialStatus{
        get{
            return self.residentialStatus
        }
        set{
            self.residentialStatus = newValue
        }
    }
    
    public var studentResidentialStatusFees:Int{
        get{
            return self.residentialStatusFees
        }
        set{
            self.residentialStatusFees = newValue
        }
    }
    
    public var studentTotalFees:Int{
        get{
            return self.totalFees
        }
        set{
            self.totalFees = newValue
        }
    }
    
    public var studentTotalFeesPaid:Int{
        get{
            return self.feesPaid
        }
        set{
            self.feesPaid = newValue
        }
    }
    public var studentFeesBalance:Int{
        get{
            return self.feesBalance
        }
        set{
            self.feesBalance = newValue
        }
    }
    
    
    public var description :String{
        return " MailId : \(userMailId)\n Name : \(userName)\n Address: \(userAddress)\n PhoneNumber: \(userPhoneNumber)\n BloodGroup: \(userBloodGroup)\n Rollnumber : \(studentRollNumber)\n Department : \(studentDepartment)\n Joining year : \(studentJoiningYear)\n Mode of joining : \(studentModeOfJoining)\n Mode of joining fees : \(studentModeOfJoiningFees)\n Transport fees : \(studentTransportFees)\n Miscellaneous fees : \(studentMiscellaneousFees)\n Residential status : \(studentResidentialStatus)\n Residential status fees : \(studentResidentialStatusFees)\n Total fees : \(studentTotalFees)\n Fees paid : \(studentTotalFeesPaid)\n Fees Balance : \(studentFeesBalance)"
    }

    
    
}
