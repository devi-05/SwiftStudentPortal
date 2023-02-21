//
//  ProfileManager.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 17/02/23.
//

import Foundation

class ProfileManager{
    func createProfile(mailId:String){
        let profileobj = Profile()
        profileobj.getUserDetails(mailId: mailId)
    }
    func viewProfile(mailId:String)-> User?{
        let db = DatabaseManager.dbManagerObj
        return db.getUser(mailId: mailId)
    }
    func editProfile(mailId:String){
        
    }
}
