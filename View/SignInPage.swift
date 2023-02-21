//
//  SignInPage.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 19/02/23.
//

import Foundation


public func portalSignIn(){
    let db = DatabaseManager.dbManagerObj
    print("Enter your mailId to sign In:")
    let mailId = UtilFunctions.getStringInput()
    if(!db.checkMailId(mailId: mailId)){
        print("MailId doesnt exist")
    }
    else{
        print("Enter your Password to sign In:")
        var password = UtilFunctions.getStringInput()
        let existingPassword = db.getpassword(mailId: mailId)
        while(password != existingPassword){
            print("Password mismatch")
            print("Re-enter your existing password")
            password = UtilFunctions.getStringInput()
        }
        print("signed in successfully")
        let currentUser:String
        if(UtilFunctions.isStudent(mailId: mailId)){
            currentUser = "Student"
        }
        else{
            currentUser = "Admin"
        }
        if let UserName = db.getUserName(mailId: mailId){
            print("welcome \(UserName)!..You logged in as \(currentUser)")}
        else{
            print("Error in signing in!")
        }
        
        profileMenuPage(mailId: mailId)
        
    }
    
    
}

