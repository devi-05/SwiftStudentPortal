//
//  StudentPortal.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 16/02/23.
//

import Foundation

struct StudentPortal:Portal{
    
    func signUp() {
        portalSignUp()
        }
    
    func signIn() {
        portalSignIn()
    }
    
    func signOut() {
        print("signing out")
    }
    
    
}
