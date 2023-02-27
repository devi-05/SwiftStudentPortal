//
//  StudentPortal.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 16/02/23.
//

import Foundation

struct StudentPortal:Portal{
    func signUp() {
        let signupObj = SignUp()
        signupObj.portalSignUp()
        }
    
    func signIn() {
        let signInObj = SignIn()
        signInObj.portalSignIn()
    }
    
    func signOut() {
        print("signing out")
    }
    
    
}
