//
//  ResultManagementSystem.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 24/02/23.
//

import Foundation

class ResultComputingSystem{
    func computeResults(mailId:String){
        let resultGeneratorObj = ResultGenerator()
        var subjects:[String] = []
        var credits:[String] = []
        var grades:[String] = []
        var gradePoints:[Double] = []
        print("Enter semester number:")
        let semNum = Util.getIntegerInput()
        print("Enter number of subjects:")
        let numOfSub = Util.getIntegerInput()
        var totalCreditsSum:Int = 0
        var totalGradePoints:Double = 0
        for _ in 0...(numOfSub-1){
            print("Enter subject name:")
            let sub = Util.getStringInput()
            subjects.append(sub)
            print("Enter credits: [1 - 5]")
            let subCredit = Util.getIntegerInput()
            credits.append(String(subCredit))
            totalCreditsSum += subCredit
            print("Enter grades:")
            for options in Grades.allCases.enumerated(){
                print("\(options.element.rawValue). \(options.element)")
            }
            let gradeArray:[Grades]=Grades.allCases
            let preference = Util.getIntegerInput()
            let grade = gradeArray[preference-1]
            grades.append(grade.toString())
            gradePoints.append(Double(subCredit*grade.getGradePoints()))
            totalGradePoints += Double(subCredit*grade.getGradePoints())
        }
//        var result:String = ""
//        result += "subjects     Credits     grades \n-------------------------"
//        for i in 0...(subjects.count-1){
//            result += "\n\(subjects[i])       \(credits[i])     \(grades[i])"
//        }
        var result:[[String]]=[]
        result.append(subjects)
        result.append(credits)
        result.append(grades)
        
        let gpa:Double
        gpa = (totalGradePoints)/Double((totalCreditsSum))
        
        resultGeneratorObj.addResult(mailId: mailId, semNum: semNum, credits: totalCreditsSum, gradePoints: totalGradePoints, result: result,gpa:gpa)
        
        print("Results added successfully!")
    }
    
}
