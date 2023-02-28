//
//  ResultPortalManager.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 26/02/23.
//

import Foundation

struct SemesterResultViewer{
    private let db = DatabaseManager.sharedInstance
    private let resultDelegator = ResultGeneratorDelegate()
    
    func viewSemesterResult(mailId:String){
        
        if(!Util.isStudent(mailId: mailId)){
            print("Enter student MailId:")
            let studentMailId = Validator.mailVerifier()
            guard (Util.isStudent(mailId: studentMailId)) else{
                print("Enter student mailId alone!")
                return
            }
            guard (db.doesStudentExist(mailId: studentMailId)) else{
                print("---------------------------------------------------")
                print("student doesn't exist")
                print("---------------------------------------------------")
                return
            }
            
            guard let result = db.getResult(mailId: studentMailId) else{
                print("---------------------------------------------------")
                print("Result were not updated !")
                print("---------------------------------------------------")
                return
            }
            print("Enter semester Number:")
            let semNum = Validator.inputVerification(num: 8)
            
            guard (doesSemNumExist(result:result, semNum: semNum)) else{
                print("---------------------------------------------------")
                print("Results were not updated for this semester!")
                print("---------------------------------------------------")
                return
            }
        }
        else{
            guard let result = db.getResult(mailId: mailId) else{
                print("---------------------------------------------------")
                print("Result were not updated !")
                print("---------------------------------------------------")
                return
            }
            print("Enter semester Number:")
            let semNum = Validator.inputVerification(num: 8)
            
            guard (doesSemNumExist(result:result, semNum: semNum)) else{
                print("---------------------------------------------------")
                print("Results were not updated for this semester!")
                print("---------------------------------------------------")
                return
            }
        }
        }
       
    func doesSemNumExist(result:[Result],semNum:Int)->Bool{
        var temp = 0
            for i in 0...(result.count-1){
                if(result[i].semesterNum == semNum){
                    let semResults = result[i].semResults
                    let roundedGpa = round(result[i].gpa * 100) / 100.0
                    print("Results for semester \(semNum):\n\(resultDelegator.displayResult(result: semResults)) \nGPA for semester \(semNum):\(roundedGpa)")
                }
                else{
                    temp += 1
                }
            }
        if(temp>1){
            return false
        }
        else{
            return true
        }
    }
        
        
}
