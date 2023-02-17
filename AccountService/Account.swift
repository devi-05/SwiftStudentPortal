//
//  Account.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 16/02/23.
//


var db = DatabaseManager.dbObj
struct Account{
    
    func createAccount(mailId:String,password:String) {
        
        db.add(mailId: mailId, password: password)
        
    }
    func forgotpassword(mailId:String,newPassword:String)->Bool{
        let oldPassword = db.getpassword(mailId: mailId)
        if(oldPassword==newPassword){
            return false
        }
        else{
            db.add(mailId: mailId, password: newPassword)
            return true
        }
    }
    
    
}
