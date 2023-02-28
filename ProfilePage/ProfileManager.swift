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
    func editProfile(attribute:EditStudentProfile,newInput:String,mailId:String){
        db.editProfileInDb(attribute: attribute,newInput: newInput, mailId: mailId)
    }
    func editResidentialStatus(attribute:EditStudentProfile,newInput:ResidentialStatus,mailId:String){
            db.editResidentialStatus(newResidentialStatus: newInput ,newResidentialStatusFees: newInput .getResidentialFees() ,mailId: mailId)
        
    }
    
}

