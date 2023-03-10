//
//  ResultGenerator.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 24/02/23.
//

import Foundation

class ResultGenerator{
    private var db = DatabaseManager.sharedInstance
    func addResult(mailId:String,semNum:Int,credits:Int,gradePoints:Double,result:Result,gpa:Double){
        db.setCredits(mailId: mailId, semNum: semNum, credits: credits)
        db.setGradePoints(mailId: mailId, semNum: semNum, gradePoints: gradePoints)
        db.updateResults(mailId: mailId, semNum: semNum, result: result, gpa: gpa)
        
    }
    
    func viewEntireSemResult(mailId:String)->Bool {
        let resultDelegate = ResultGeneratorDelegate()
        guard let results = db.getEntireResults(mailId: mailId) else{
            return true
        }
        resultDelegate.displayEntireResults(result: results)
        return false
    }
    func calculateCgpa(mailId:String)->Double?{
        guard let totalCredits = db.getTotalCredits(mailId: mailId),let totalGradePoints = db.getTotalGrades(mailId: mailId) else { return nil }
        let roundedCgpa = round((totalGradePoints/Double(totalCredits)) * 100) / 100.0
        return roundedCgpa
    }
}
