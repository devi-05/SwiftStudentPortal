//
//  ResultGenerator.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 24/02/23.
//

import Foundation

class ResultGenerator{
    private var db = DatabaseManager.sharedInstance
    func addResult(mailId:String,semNum:Int,credits:Int,gradePoints:Double,result:String,gpa:Double){
        db.updateCreditsAndGradePoints(mailId: mailId, semNum: semNum, totalCredits: credits, totalGradePoints: gradePoints, result: result,gpa:gpa)
    }
    func viewSemResult(mailId:String,semNum:Int)->[String:Double]{
        return db.getResult(mailId: mailId, semNum: semNum)
    }
    func viewEntireSemResult(mailId:String)->[Int:[String:Double]]{
        return db.getEntireResults(mailId: mailId)
    }
    func calculateCgpa(mailId:String){
        
    }
}
