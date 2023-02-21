//
//  SignInPage.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 19/02/23.
//

import Foundation


public func portalSignIn(){
    print("Welcome to Sign In page!")
    print("------------------------------------------------------------------------------------------")
    let db = DatabaseManager.dbManagerObj
    let portalMenuPageObj = PortalMenuPage()
    print("Enter your mailId to sign In:")
    let mailId = Util.getStringInput()
    if(!db.checkMailId(mailId: mailId)){
        print("MailId doesnt exist")
    }
    else{
        print("Enter your Password to sign In:")
        var password = Util.getStringInput()
        let existingPassword = db.getpassword(mailId: mailId)
        while(password != existingPassword){
            print("Password mismatch")
            print("Re-enter your existing password")
            password = Util.getStringInput()
        }
        print("signed in successfully")
        print("------------------------------------------------------------------------------------------")
        let currentUser:String
        if(Util.isStudent(mailId: mailId)){
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
        print("------------------------------------------------------------------------------------------")
        portalMenuPageObj.displayMenuOptions(mailId: mailId)
        
    }
    
    
}

