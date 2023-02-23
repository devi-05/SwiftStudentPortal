//
//  DatabaseManager.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 16/02/23.
//

import Foundation

public class DatabaseManager{
    
    
    private var dbMainObj = Database()
    
    static let dbManagerObj=DatabaseManager()
    private init(){}
    
    func addMailIdAndPassword(mailId:String,password:String){
        dbMainObj.accountDb[mailId]=password
    }
    
    func checkMailId(mailId:String)->Bool{
        return dbMainObj.accountDb.keys.contains(mailId)
    }
    func getpassword(mailId:String) ->String?{
        guard let password = dbMainObj.accountDb[mailId] else{
            return nil
        }
        return password
    }
    func addToStudentDb(mailId:String,student:Student){
        
        dbMainObj.studentDb[mailId] = student
    }
    func addToAdminDb(mailId:String,admin:Admin){
        dbMainObj.adminDb[mailId]=admin
    }
    func getUser<T:User>(mailId:String)->T?{
        if(Util.isStudent(mailId: mailId)){
            if let studentProfile = dbMainObj.studentDb[mailId] {
                return studentProfile as? T
            }
            else{
                return nil
            }
        }
        else{
            if let adminProfile = dbMainObj.adminDb[mailId]  {
                return adminProfile as? T}
            else{
                return nil
            }
        }
    }
    func getUserName(mailId:String)->String?{
        guard let userName = dbMainObj.studentDb[mailId]?.userName else{
            return nil
        }
        return userName
    }
    func getRollNumberAndDepartment(mailId:String)->String{
        guard let rollNumber = dbMainObj.studentDb[mailId]?.studentRollNumber, let department = dbMainObj.studentDb[mailId]?.studentDepartment else{
            return ""
        }
        return "RollNumber: \(rollNumber) \nDepartment: \(department)"
    }
    func editProfileInDb(attribute:EditStudentProfileEnum,newAttribute:Any,mailId:String){
        if(Util.isStudent(mailId: mailId)){
            if(attribute == .address){
                dbMainObj.studentDb[mailId]?.userAddress = newAttribute as! String
            }
            else if (attribute == .phoneNumber){
                dbMainObj.studentDb[mailId]?.userPhoneNumber = newAttribute as! Int
            }
        }
        else{
            
            if(attribute == .address){
                dbMainObj.adminDb[mailId]?.userAddress = newAttribute as! String
            }
            else if (attribute == .phoneNumber){
                dbMainObj.adminDb[mailId]?.userPhoneNumber = newAttribute as! Int
            }
            
            
        }
        
    }
    func editResidentialStatus(newResidentialStatus:ResidentialStatusEnum,newResidentialStatusFees:Int,mailId:String){
        dbMainObj.studentDb[mailId]?.studentResidentialStatus = newResidentialStatus
        dbMainObj.studentDb[mailId]?.studentResidentialStatusFees = newResidentialStatusFees
        dbMainObj.studentDb[mailId]?.studentTotalFees = dbMainObj.studentDb[mailId]!.studentFeesWithoutResidentialFees+dbMainObj.studentDb[mailId]!.studentResidentialStatusFees
    }
    
    func getTotalFees(mailId:String)->Int?{
        
        return dbMainObj.studentDb[mailId]?.studentTotalFees
        
    }
    func getFeePaid(mailId:String)->Int?{
        return dbMainObj.studentDb[mailId]?.studentTotalFeesPaid
    }
    func getFeeBalance(mailId:String)->Int?{
        return dbMainObj.studentDb[mailId]?.studentFeesBalance
    }
    
    func getFeesWithoutResidentialFees(mailId:String)->[Int?]{
        return [dbMainObj.studentDb[mailId]?.studentModeOfJoiningFees,dbMainObj.studentDb[mailId]?.studentTransportFees,dbMainObj.studentDb[mailId]?.studentMiscellaneousFees]
    }
    func getResidentialFees(mailId:String)->Int?{
        return dbMainObj.studentDb[mailId]?.studentResidentialStatusFees
    }
    func updateFees(mailId:String,feesPaid:Int,feesBalance:Int){
        dbMainObj.studentDb[mailId]?.studentTotalFeesPaid = feesPaid
        dbMainObj.studentDb[mailId]?.studentFeesBalance = feesBalance
    }
    func updateBalance(mailId:String,feeBalance:Int){
        dbMainObj.studentDb[mailId]?.studentFeesBalance = feeBalance
    }
    func getStudentDb() -> [String:Student]{
        return dbMainObj.studentDb
    }
    
}

