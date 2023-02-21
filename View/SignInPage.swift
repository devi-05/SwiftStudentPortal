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
        var password = UtilFunctions.getStringInput()
        let existingPassword = db.getpassword(mailId: mailId)
        while(password != existingPassword){
            print("Password mismatch")
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
        print("welcome \(String(describing: db.getUserName(mailId: mailId)))!..You logged in as \(currentUser)")
        
    }
    profileMenuPage(mailId: mailId)
    
}

