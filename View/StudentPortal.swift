//
//  StudentPortal.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 16/02/23.
//

import Foundation

struct studentPortal:Portal{
    
    func signUp() {
        let accountObj = Account()
        print("welcome to signup page")
        print("enter your mailId to sign up")
        let mailId:String = readLine() ?? ""
        print("enter your password to sign up")
        let password:String = readLine() ?? ""
        if(!accountObj.createAccount(mailId: mailId, password: password)){
            print("error in signing up")
        }
        else{
            print("signed up successfully")
        }
        
    }
    
    func signIn() {
        
    }
    
    func signOut() {
        
    }
    
    
}
