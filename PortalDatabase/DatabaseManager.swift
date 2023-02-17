//
//  DatabaseManager.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 16/02/23.
//

import Foundation

public struct DatabaseManager{
    
    static let dbObj=DatabaseManager()
    private init(){}
    
    var dbMainObj = Database()
    
    mutating func add(mailId:String,password:String){
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
    
}

