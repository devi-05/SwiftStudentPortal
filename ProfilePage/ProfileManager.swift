//
//  ProfileManager.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 17/02/23.
//

import Foundation

class ProfileManager{
    private let db = DatabaseManager.sharedInstance
    
    func createProfile(mailId:String){
        var profileobj = ProfilePageDelegator()
        profileobj.getUserDetails(mailId: mailId)
    }
    func viewProfile(mailId:String)-> User?{
        return db.getUser(mailId: mailId)
    }
    func editProfile(attribute:EditStudentProfileEnum,newAttribute:String,mailId:String){
        db.editProfileInDb(attribute: attribute,newAttribute: newAttribute, mailId: mailId)
    }
    func editResidentialStatus(attribute:EditStudentProfileEnum,newAttribute:ResidentialStatusEnum,mailId:String){
            db.editResidentialStatus(newResidentialStatus: newAttribute ,newResidentialStatusFees: newAttribute .getResidentialFees() ,mailId: mailId)
        
    }
    
}

