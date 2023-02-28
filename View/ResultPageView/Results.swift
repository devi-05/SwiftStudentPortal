//
//  Results.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 27/02/23.
//

import Foundation
class Result:CustomStringConvertible{
    let semesterNum:Int
    let semResults:[Semester]
    let gpa:Double
    init(semesterNum: Int, semResults: [Semester], gpa: Double) {
        self.semesterNum = semesterNum
        self.semResults = semResults
        self.gpa = gpa
    }
    var description: String{
        return "Semester number:\(semesterNum) \nSemesterResults:\(semResults.description) \nGpa:\(gpa)"
    }
}
