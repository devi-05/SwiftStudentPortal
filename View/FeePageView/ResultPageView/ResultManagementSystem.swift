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
        let db = DatabaseManager.sharedInstance
        var subjects:[String] = []
        var credits:[String] = []
        var grades:[String] = []
        var gradePoints:[Double] = []
        print("Enter semester number:")
        let semNum = Util.getIntegerInput()
        guard db.doesSemNumExist(mailId: mailId, semNum: semNum) else{
            print("Results are updated for entered semester Number!")
            return
        }
        guard (db.getConsecutiveSemNum(mailId: mailId)+1 == semNum) else{
            print("Enter correct semester number ...once verify previous semester results are updated!")
            return
        }
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

        var result:[[String]]=[]
        result.append(subjects)
        result.append(credits)
        result.append(grades)
        
        let gpa:Double
        gpa = (totalGradePoints)/Double((totalCreditsSum))
        let roundedGpa = round(gpa*100)/100.0
        resultGeneratorObj.addResult(mailId: mailId, semNum: semNum, credits: totalCreditsSum, gradePoints: totalGradePoints, result: result,gpa:roundedGpa)
        
        print("Results added successfully!")
    }
    
}
