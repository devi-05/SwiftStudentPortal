//
//  CgpaManipulator.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 26/02/23.
//

import Foundation
struct CgpaManipulator{
    func manipulateCgpa(mailId:String){
        let resultGeneratorObj = ResultGenerator()
        let db = DatabaseManager.sharedInstance
        if(!Util.isStudent(mailId: mailId)){
            print("Enter student MailId:")
            let studentMailId = Validator.mailVerifier()
            guard db.doesStudentExist(mailId: studentMailId) else{
                print("---------------------------------------------------")
                print("student doesn't exist")
                print("---------------------------------------------------")
                return
            }
            if let cgpa = resultGeneratorObj.calculateCgpa(mailId: studentMailId){
                print("---------------------------------------------------")
                print("Your CGPA is \(cgpa)")
                print("---------------------------------------------------")
            }
            else{
                print("---------------------------------------------------")
                print("cgpa is not updated!")
                print("---------------------------------------------------")
            }
        }
        else{
            if let cgpa = resultGeneratorObj.calculateCgpa(mailId: mailId){
                print("---------------------------------------------------")
                print("Your CGPA is \(cgpa)")
                print("---------------------------------------------------")
            }
            else{
                print("---------------------------------------------------")
                print("cgpa is not updated!")
                print("---------------------------------------------------")
            }
        }
    }
}
