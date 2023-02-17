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
    func viewProfile(mailId:String){
        let db = DatabaseManager()
        print(db.getUser(mailId: mailId))
    }
}
