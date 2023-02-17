//
//  SignUpPage.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 17/02/23.
//

import Foundation

public func portalSignUp(){
    let accountObj = Account()
    print("welcome to signup page")
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
        print("signed up successfully")
    }
    
}