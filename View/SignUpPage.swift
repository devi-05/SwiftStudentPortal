//
//  SignUpPage.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 17/02/23.
//

import Foundation

public func portalSignUp(){
    let db = DatabaseManager.dbManagerObj
    let portalMenuPageObj = PortalMenuPage()
    let accountObj = AccountServiceManager()
    print("------------------------------------------------------------------------------------------")
    print("Welcome to signup page!")
    print("------------------------------------------------------------------------------------------")
    print("enter your mailId to sign up")
    let mailId:String = readLine() ?? ""
    if(db.checkMailId(mailId: mailId)){
        print("mailId already exists")
        print("sign up failed")
        
    }
    else{
        print("enter your password to sign up")
        let password:String = readLine() ?? ""
        accountObj.createAccount(mailId: mailId, password: password)
        print("------------------------------------------------------------------------------------------")
        print("signed up successfully")
        print("------------------------------------------------------------------------------------------")
        let profilePageObj = ProfileManager()
        profilePageObj.createProfile(mailId: mailId)
        print("created your profile successfully")
        portalMenuPageObj.displayMenuOptions(mailId: mailId)
    }
    
}
