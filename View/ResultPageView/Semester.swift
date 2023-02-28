//
//  Semester.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 27/02/23.
//

import Foundation

class Semester:CustomStringConvertible{
    let subject:String
    let credit:Int
    let grades:Grades
    init(subject: String, credit: Int, grades: Grades) {
        self.subject = subject
        self.credit = credit
        self.grades = grades
    }
    var description: String{
        return "subject:\(subject) \ncredit:\(credit) \ngrades:\(grades)"
    }
}
