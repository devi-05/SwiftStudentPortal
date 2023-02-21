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
        guard(dbMainObj.accountDb.keys.contains(mailId)) else{
            return false
        }
        return true
    }
    func getpassword(mailId:String) ->String?{
        dbMainObj.accountDb[mailId]
    }
    func addToStudentDb(mailId:String,student:Student){
        
        dbMainObj.studentDb[mailId] = student
    }
    func addToAdminDb(mailId:String,admin:Admin){
        dbMainObj.adminDb[mailId]=admin
    }
    func getUser<T:User>(mailId:String)->T?{
        if(UtilFunctions.isStudent(mailId: mailId)){
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
        if let userName = dbMainObj.studentDb[mailId]?.userName{
            return userName
        }
        else{
            return nil
        }
    }
    func editProfileInDb(attribute:EditStudentProfileEnum,newAttribute:Any,mailId:String){
        if(UtilFunctions.isStudent(mailId: mailId)){
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
    }
    
    func getTotalFees(mailId:String)->Int?{
        
        guard let totalFees = dbMainObj.studentDb[mailId]?.studentTotalFees else{
            return nil
        }
        return totalFees
        
    }
    func getFeePaid(mailId:String)->Int?{
        guard let totalFeesPaid = dbMainObj.studentDb[mailId]?.studentTotalFees else{
            return nil
        }
        return totalFeesPaid
    }
}

