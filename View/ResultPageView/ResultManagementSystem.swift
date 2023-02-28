//
//  ResultManagementSystem.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 24/02/23.
//

import Foundation

struct ResultComputingSystem{
    func computeResults(mailId:String){
        let semesterViewer = SemesterResultViewer()
        let resultGeneratorObj = ResultGenerator()
        let db = DatabaseManager.sharedInstance
//        var subjects:[String] = []
//        var credits:[String] = []
//        var grades:[String] = []
        var semList:[Semester] = []
        var gradePoints:[Double] = []
        print("Enter semester number:")
        let semNum = Validator.inputVerification(num: 8)
        if let result = db.getResult(mailId: mailId) {
            
            guard semesterViewer.doesSemNumExist(result:result, semNum: semNum) else{
                print("Results are updated for entered semester Number!")
                return
            }
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
            //subjects.append(sub)
            print("Enter credits: [1 - 5]")
            let subCredit = Validator.inputVerification(num: 5)
            //credits.append(String(subCredit))
            totalCreditsSum += subCredit
            print("Enter grades:")
            for options in Grades.allCases.enumerated(){
                print("\(options.element.rawValue). \(options.element)")
            }
            let gradeArray:[Grades]=Grades.allCases
            let preference = Validator.inputVerification(num: gradeArray.count)
            let grade = gradeArray[preference-1]
            let semester = Semester(subject: sub, credit: subCredit, grades: grade)
            semList.append(semester)
            //grades.append(grade.toString())
            gradePoints.append(Double(subCredit*grade.getGradePoints()))
            totalGradePoints += Double(subCredit*grade.getGradePoints())
        }

//        var result:[[String]]=[]
//        result.append(subjects)
//        result.append(credits)
//        result.append(grades)
        
        let gpa:Double
        gpa = (totalGradePoints)/Double((totalCreditsSum))
        let roundedGpa = round(gpa*100)/100.0
        let results = Result(semesterNum: semNum, semResults: semList, gpa: gpa)
        resultGeneratorObj.addResult(mailId: mailId, semNum: semNum, credits: totalCreditsSum, gradePoints: totalGradePoints, result: results,gpa:roundedGpa)
        
        print("Results added successfully!")
    }
    
}
