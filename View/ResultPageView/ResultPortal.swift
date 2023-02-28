//
//  ResultPortal.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 24/02/23.
//

import Foundation


struct ResultPortal{
    func resultPageView(mailId:String){
    ResultPageLoop:while(true){
         let db = DatabaseManager.sharedInstance
        
        print("Welcome to Result Portal!")
        let preference:String
        if(Util.isStudent(mailId: mailId)){
            for options in StudentResultOptionEnum.allCases.enumerated(){
                print("\(options.element.rawValue). \(options.element)")
            }
            let studentResultOptionArray:[StudentResultOptionEnum]=StudentResultOptionEnum.allCases
            print("Enter your preference:")
            let input = Validator.inputVerification(num: studentResultOptionArray.count)
            preference = studentResultOptionArray[input-1].toString()
        }
        else{
            for options in AdminResultOptionEnum.allCases.enumerated(){
                print("\(options.element.rawValue). \(options.element)")
            }
            let adminResultOptionArray:[AdminResultOptionEnum]=AdminResultOptionEnum.allCases
            let input = Validator.inputVerification(num: adminResultOptionArray.count)
            preference = adminResultOptionArray[input-1].toString()
            
        }
        switch preference{
        case "addResult":
            let resultManagementObj = ResultComputingSystem()
            print("Enter student MailId:")
            let studentMailId = Validator.mailVerifier()
            guard (!Util.isStudent(mailId: mailId)) else{
                print("Enter student mailId alone!")
                return
            }
            guard db.doesStudentExist(mailId: studentMailId) else{
                print("---------------------------------------------------")
                print("student doesn't exist")
                print("---------------------------------------------------")
                return
            }
            resultManagementObj.computeResults(mailId: studentMailId)
        case "viewSemResult":
           let semesterResultViewer = SemesterResultViewer()
            semesterResultViewer.viewSemesterResult(mailId: mailId)
            
        case "viewEntireSemResult":
            let resultGeneratorObj = ResultGenerator()
            if(!Util.isStudent(mailId: mailId)){
                print("Enter student MailId:")
                let studentMailId = Validator.mailVerifier()
                if (!db.doesStudentExist(mailId: studentMailId)){
                    print("---------------------------------------------------")
                    print("student doesn't exist")
                    print("---------------------------------------------------")
                    
                }
                else{
                    if(resultGeneratorObj.viewEntireSemResult(mailId: studentMailId)){
                        print("---------------------------------------------------")
                        print("Result were not updated!")
                        print("---------------------------------------------------")
                    }}
            }
                else{
                    
                    if(resultGeneratorObj.viewEntireSemResult(mailId: mailId)){
                        print("---------------------------------------------------")
                        print("Result were not updated!")
                        print("---------------------------------------------------")
                    }
                }
        case "calculateCgpa":
           let cgpaManipulator = CgpaManipulator()
            cgpaManipulator.manipulateCgpa(mailId: mailId)
            
        case "backToMenuPage":
            break ResultPageLoop
        default:
            break ResultPageLoop
            
        }
    }
    }
}
