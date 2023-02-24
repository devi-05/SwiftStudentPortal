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
            print("view sem result")
            let resultGeneratorObj = ResultGenerator()
            if(!Util.isStudent(mailId: mailId)){
                print("Enter student MailId:")
                let studentMailId = Util.getStringInput()
                print("Enter semester Number:")
                let semNum = Util.getIntegerInput()
                print(resultGeneratorObj.viewSemResult(mailId: studentMailId,semNum:semNum))}
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
                print(resultGeneratorObj.viewEntireSemResult(mailId: studentMailId))}
            else{
                print(resultGeneratorObj.viewEntireSemResult(mailId: mailId))
            }
        case "calculateCgpa":
            print(" ")
        case "backToMenuPage":
            break ResultPageLoop
        default:
            break ResultPageLoop
            
        }
        
    }
    }
}
