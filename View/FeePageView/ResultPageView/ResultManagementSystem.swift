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
        var credits:[Int] = []
        var grades:[Grades] = []
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
            credits.append(subCredit)
            totalCreditsSum += subCredit
            print("Enter grades:")
            for options in Grades.allCases.enumerated(){
                print("\(options.element.rawValue). \(options.element)")
            }
            let gradeArray:[Grades]=Grades.allCases
            let preference = Util.getIntegerInput()
            let grade = gradeArray[preference-1]
            grades.append(grade)
            gradePoints.append(Double(subCredit*grade.getGradePoints()))
            totalGradePoints += Double(subCredit*grade.getGradePoints())
        }
        var result:String = ""
        result += "subjects     Credits     grades \n"
        result += " --------------------------------"
        for i in 0...(subjects.count-1){
            result += "\n\(subjects[i])       \(credits[i])     \(grades[i])"
        }
        
        let gpa:Double
        gpa = (totalGradePoints)/Double((totalCreditsSum))
        
        resultGeneratorObj.addResult(mailId: mailId, semNum: semNum, credits: totalCreditsSum, gradePoints: totalGradePoints, result: result,gpa:gpa)
        
        print("Results added successfully!")
    }
    
}
