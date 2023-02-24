//
//  ProfileManager.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 17/02/23.
//

import Foundation

class ProfileManager{
    
    func createProfile(mailId:String){
        var profileobj = ProfilePageDelegator()
        profileobj.getUserDetails(mailId: mailId)
    }
    func viewProfile(mailId:String)-> User?{
        let db = DatabaseManager.sharedInstance
        return db.getUser(mailId: mailId)
    }
    func editProfile(attribute:EditStudentProfileEnum,newAttribute:Any,mailId:String){
        let db = DatabaseManager.sharedInstance
        if(attribute == .residentialStatus){
            db.editResidentialStatus(newResidentialStatus: newAttribute as! ResidentialStatusEnum ,newResidentialStatusFees: (newAttribute as! ResidentialStatusEnum).getResidentialFees() ,mailId: mailId)
        }
        db.editProfileInDb(attribute: attribute,newAttribute: newAttribute, mailId: mailId)
    }
    
}

