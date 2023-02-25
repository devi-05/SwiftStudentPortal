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
        print("Welcome to Result Portal!")
        let preference:String
        if(Util.isStudent(mailId: mailId)){
            for options in StudentResultOptionEnum.allCases.enumerated(){
                print("\(options.element.rawValue). \(options.element)")
            }
            let studentResultOptionArray:[StudentResultOptionEnum]=StudentResultOptionEnum.allCases
            let input = Util.getIntegerInput()
            preference = studentResultOptionArray[input-1].toString()
        }
        else{
            for options in AdminResultOptionEnum.allCases.enumerated(){
                print("\(options.element.rawValue). \(options.element)")
            }
            let adminResultOptionArray:[AdminResultOptionEnum]=AdminResultOptionEnum.allCases
            let input = Util.getIntegerInput()
            preference = adminResultOptionArray[input-1].toString()
            
        }
        switch preference{
        case "addResult":
            let resultManagementObj = ResultComputingSystem()
            print("Enter student MailId:")
            let studentMailId = Util.getStringInput()
            resultManagementObj.computeResults(mailId: studentMailId)
        case "viewSemResult":
            let resultGeneratorObj = ResultGenerator()
            if(!Util.isStudent(mailId: mailId)){
                print("Enter student MailId:")
                let studentMailId = Util.getStringInput()
                print("Enter semester Number:")
                let semNum = Util.getIntegerInput()
                let result = resultGeneratorObj.viewSemResult(mailId: studentMailId,semNum:semNum).keys
                let subjects = result[result.startIndex][0]
                let credits = result[result.startIndex][1]
                let grades = result[result.startIndex][2]
                print("---------------------------------------------------")
                for i in 0...(subjects.count-1){
                    print("SUBJECT NAME:\(subjects[i])         \nCREDITS:\(credits[i])            \nGRADES:\(grades[i])")
                    print("-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-")
                }
                print("---------------------------------------------------")
                let gpa = resultGeneratorObj.viewSemResult(mailId: studentMailId,semNum:semNum).values
                print("GPA: \(gpa[gpa.startIndex])")
               
            }
            else{
                print("Enter semester Number:")
                let semNum = Util.getIntegerInput()
                print(resultGeneratorObj.viewSemResult(mailId: mailId,semNum:semNum))
            }
        case "viewEntireSemResult":
            let resultGeneratorObj = ResultGenerator()
            if(!Util.isStudent(mailId: mailId)){
                print("Enter student MailId:")
                let studentMailId = Util.getStringInput()
                resultGeneratorObj.viewEntireSemResult(mailId: studentMailId)}
            else{
                resultGeneratorObj.viewEntireSemResult(mailId: mailId)
            }
        case "calculateCgpa":
            let resultGeneratorObj = ResultGenerator()
            if(!Util.isStudent(mailId: mailId)){
                print("Enter student MailId:")
                let studentMailId = Util.getStringInput()
                if let cgpa = resultGeneratorObj.calculateCgpa(mailId: studentMailId){
                    print("---------------------------------------------------")
                    print("Your CGPA is\(cgpa)")
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
                    print(cgpa)
                }
                else{
                    print("cgpa is not updated!")
                }
            }
            
        case "backToMenuPage":
            break ResultPageLoop
        default:
            break ResultPageLoop
            
        }
    }
    }
}
