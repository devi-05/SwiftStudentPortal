//
//  Student.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 13/02/23.
//

import Foundation


class Student:User,CustomStringConvertible{
    
    private let rollNumber :String
    private let department:DeptEnum
    private let joiningYear:String
    private let modeOfJoining:ModeOfJoiningEnum
    private let modeOfJoiningFees:Int
    private let transportFees:Int
    private let miscellaneousFees:Int
    private var residentialStatus:ResidentialStatusEnum
    private var residentialStatusFees:Int
    private var totalFees:Int
    private var feesPaid:Int
    
    
    init(mailId: String, name: String, bloodGroup:BloodGroup, address: String, phoneNumber: Int,rollNumber: String, department: DeptEnum, joiningYear: String, modeOfJoining: ModeOfJoiningEnum, modeOfJoiningFees: Int, transportFees: Int, miscellaneousFees: Int, residentialStatus: ResidentialStatusEnum, residentialStatusFees: Int, totalFees: Int, feesPaid: Int) {
        
        self.rollNumber = rollNumber
        self.department = department
        self.joiningYear = joiningYear
        self.modeOfJoining = modeOfJoining
        self.modeOfJoiningFees = modeOfJoiningFees
        self.transportFees = transportFees
        self.miscellaneousFees = miscellaneousFees
        self.residentialStatus = residentialStatus
        self.residentialStatusFees = residentialStatusFees
        self.totalFees = totalFees
        self.feesPaid = feesPaid
        super.init(mailId: mailId, name: name, bloodGroup: bloodGroup, address: address, phoneNumber: phoneNumber)
        
    }
    
    
    public var studentRollNumber:String{
        get {
            return self.rollNumber
        }
    }
    
    public var studentDepartment:DeptEnum{
        get{
            return self.department
        }
    }
    
    public var studentJoiningYear:String{
        get{
            return self.joiningYear
        }
    }
    
    public var studentModeOfJoining:ModeOfJoiningEnum{
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
    
    public var studentResidentialStatus:ResidentialStatusEnum{
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
    
    
    public var description :String{
        return " mailId is \(userMailId)\n name is \(userName)\n rollnumber is \(studentRollNumber)\n department is \(studentDepartment)\n joining year is \(studentJoiningYear)\n mode of joining is \(studentModeOfJoining)\n mode of joining fees is \(studentModeOfJoiningFees)\n transport fees is \(studentTransportFees)\n miscellaneous fees is \(studentMiscellaneousFees)\n residential status is \(studentResidentialStatus)\n residential status fees is \(studentResidentialStatusFees)\n total fees is \(studentTotalFees)\n fees paid is \(studentTotalFeesPaid)"
    }

    
    
}
