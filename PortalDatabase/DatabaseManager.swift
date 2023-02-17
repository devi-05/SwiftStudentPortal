//
//  DatabaseManager.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 16/02/23.
//

import Foundation

public struct DatabaseManager{
    
    
    var dbMainObj = Database.dbObj
    
    mutating func addMailIdAndPassword(mailId:String,password:String){
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
    mutating func addToStudentDb(mailId:String,student:Student){
        print("aded in student db")
        print(student)
        dbMainObj.studentDb[mailId] = student
    }
    mutating func addToAdminDb(mailId:String,admin:Admin){
        dbMainObj.adminDb[mailId]=admin
    }
    func getUser<T:User>(mailId:String)->T{
        print(dbMainObj.studentDb)
        print(dbMainObj.adminDb)
        print(dbMainObj.studentDb[mailId])
        if(UtilFunctions.isStudent(mailId: mailId)){
            return dbMainObj.studentDb[mailId] as! T
        }
        else{
            return dbMainObj.adminDb[mailId] as! T
        }
    }
}

