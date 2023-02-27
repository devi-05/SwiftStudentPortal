//
//  ResultPortalManager.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 26/02/23.
//

import Foundation

struct SemesterResultViewer{
    func viewSemesterResult(mailId:String){
        let db = DatabaseManager.sharedInstance
        let resultGeneratorObj = ResultGenerator()
        let resultDelegator = ResultGeneratorDelegate()
        if(!Util.isStudent(mailId: mailId)){
            print("Enter student MailId:")
            let studentMailId = Validator.mailVerifier()
            guard db.doesStudentExist(mailId: studentMailId) else{
                print("---------------------------------------------------")
                print("student doesn't exist")
                print("---------------------------------------------------")
                return
            }
            print("Enter semester Number:")
            let semNum = Validator.inputVerification(num: 8)
            guard (!db.doesSemNumExist(mailId: mailId, semNum: semNum)) else{
                print("---------------------------------------------------")
                print("Results were not updated for this semester!")
                print("---------------------------------------------------")
                return
            }
            
            let result = resultGeneratorObj.viewSemResult(mailId: studentMailId,semNum:semNum)
            resultDelegator.displaySingleSemResults(results: result)
           
        }
        else{
            print("Enter semester Number:")
            let semNum = Validator.inputVerification(num: 8)
            guard (!db.doesSemNumExist(mailId: mailId, semNum: semNum)) else{
                print("---------------------------------------------------")
                print("Results were not updated for this semester!")
                print("---------------------------------------------------")
                return
            }
            let result = resultGeneratorObj.viewSemResult(mailId: mailId,semNum:semNum)
            resultDelegator.displaySingleSemResults(results: result)
        }
    }
}