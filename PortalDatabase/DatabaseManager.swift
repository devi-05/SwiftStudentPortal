//
//  DatabaseManager.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 16/02/23.
//

import Foundation



class DatabaseManager{
    
    private var dbMainObj = Database()
    
    static let sharedInstance=DatabaseManager()
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
        if(Util.isStudent(mailId: mailId)){
            guard let userName = dbMainObj.studentDb[mailId]?.userName else{
                return nil
            }
            return userName}
        else{
            guard let userName = dbMainObj.adminDb[mailId]?.userName else{
                return nil
            }
            return userName
        }
    }
    func getRollNumberAndDepartment(mailId:String)->String{
        guard let rollNumber = dbMainObj.studentDb[mailId]?.studentRollNumber, let department = dbMainObj.studentDb[mailId]?.studentDepartment else{
            return ""
        }
        return "RollNumber: \(rollNumber) \nDepartment: \(department)"
    }
    func editProfileInDb(attribute:EditStudentProfile,newInput:String,mailId:String){
        if(Util.isStudent(mailId: mailId)){
            if(attribute == .address){
                dbMainObj.studentDb[mailId]?.userAddress = newInput
            }
            else if (attribute == .phoneNumber){
                dbMainObj.studentDb[mailId]?.userPhoneNumber = newInput
            }
        }
        else{
            
            if(attribute == .address){
                dbMainObj.adminDb[mailId]?.userAddress = newInput
            }
                else if (attribute == .phoneNumber){
                dbMainObj.adminDb[mailId]?.userPhoneNumber = newInput
            }
            
            
        }
        
    }
    func editResidentialStatus(newResidentialStatus:ResidentialStatus,newResidentialStatusFees:Int,mailId:String){
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

    func updateResults(mailId:String,semNum:Int,result:Result,gpa:Double){
        var tempDict:[Result] = []
        if(dbMainObj.studentResults[mailId]==nil){
            tempDict.append(result)
            dbMainObj.studentResults[mailId] = tempDict
        }
        else{
            
                tempDict = dbMainObj.studentResults[mailId]!
                tempDict.append(result)
                dbMainObj.studentResults[mailId] = tempDict
            
        }
    }
    
    func getEntireResults(mailId:String)->[Result]?{
        return dbMainObj.studentResults[mailId]
    }
    
    func getResult(mailId:String)->[Result]?{
        return dbMainObj.studentResults[mailId]
    }
    func setCredits(mailId:String,semNum:Int,credits:Int){
        var tempCreditDict:[Int:Int] = [:]
        
        if dbMainObj.studentTotalCreditdb[mailId] == nil{
            tempCreditDict[semNum] = credits
            dbMainObj.studentTotalCreditdb[mailId] = tempCreditDict
        }
        else{
            if let credit = dbMainObj.studentTotalCreditdb[mailId]{
                tempCreditDict = credit
                tempCreditDict[semNum] = credits
                dbMainObj.studentTotalCreditdb[mailId] = tempCreditDict
            }
        }
    }
    func setGradePoints(mailId:String,semNum:Int,gradePoints:Double){
        var tempGradeDict:[Int:Double] = [:]
        if(dbMainObj.studentCreditsWithGradePoints[mailId]==nil){
            tempGradeDict[semNum]=gradePoints
            dbMainObj.studentCreditsWithGradePoints[mailId] = tempGradeDict
        }
        else{
            if let gradePoint = dbMainObj.studentCreditsWithGradePoints[mailId]{
                tempGradeDict = gradePoint
                tempGradeDict[semNum] = gradePoints
                dbMainObj.studentCreditsWithGradePoints[mailId] = tempGradeDict
            }
        }
    }
    func getTotalCredits(mailId:String)->Int?{
        if let credit = dbMainObj.studentTotalCreditdb[mailId]{
            var creditCollection = 0
            for i in credit.values{
                creditCollection+=i
            }
            return  creditCollection
        }
        else{
            return nil
        }
    }
    func getTotalGrades(mailId:String)->Double?{
        if let grades = dbMainObj.studentCreditsWithGradePoints[mailId]{
            var gradeCollection:Double = 0
            for i in grades.values{
                gradeCollection+=i
            }
            return  gradeCollection
        }
        else{
            return nil
        }
    }
    func doesStudentExist(mailId:String)->Bool{
        return dbMainObj.accountDb[mailId] != nil
    }
    
    func getConsecutiveSemNum(mailId:String)->Int{
        guard let result = dbMainObj.studentResults[mailId] else{
            return 0
        }
        var semNumList:[Int] = []
        for i in 0...(result.count-1){
            semNumList.append(result[i].semesterNum)
        }
        return semNumList.max()!
    }
    
}

