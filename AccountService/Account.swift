//
//  Account.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 16/02/23.
//


var db = DatabaseManager.dbObj
struct Account{
    
    func createAccount(mailId:String,password:String)-> Bool {
        guard(db.checkMailId(mailId: mailId))else{
            return false}
        db.add(mailId: mailId, password: password)
        return true
    }
    
    
}
