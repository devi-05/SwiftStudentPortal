//
//  SignInPage.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 19/02/23.
//

import Foundation

struct SignIn{
    func portalSignIn(){
        print("Welcome to Sign In page!")
        print("------------------------------------------------------------------------------------------")
        let db = DatabaseManager.sharedInstance
        let portalMenuPageObj = PortalMenuPage()
        print("Enter your mailId to sign In:")
        let mailId = Validator.mailVerifier()
        if(!db.checkMailId(mailId: mailId)){
            print("MailId doesn't exist")
        }
        else{
            print("Enter your Password to sign In:")
            var password = Validator.passwordVerifier()
            var existingPassword = db.getpassword(mailId: mailId)
            while(password != existingPassword){
                print("Password mismatch")
                print("Do you want to reset password:(y/n)")
                let input = Util.getStringInput()
                if(input == "y"){
                    let accountServiceManagerObj = AccountServiceManager()
                    print("Enter your new password:")
                    let newPassword = Validator.passwordVerifier()
                    if(!accountServiceManagerObj.forgotpassword(mailId: mailId, newPassword: newPassword)){
                        print("Entered password is same as already existing password!")
                    }
                    else{
                        
                        print("Password is set successfully!")
                        print("------------------------------------------------------------------------------------------")
                    }
                    password = newPassword
                    existingPassword = db.getpassword(mailId: mailId)
                }
                else{
                    print("Re-enter your existing password")
                    password = Validator.passwordVerifier()
                }
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
                print("welcome \(UserName)!..You logged in as \(currentUser)")
                portalMenuPageObj.displayMenuOptions(mailId: mailId)
            }
            else{
                print("Error in signing in!")
            }
        }
    }
        
    }


