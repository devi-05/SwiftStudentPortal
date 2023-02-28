//
//  Semester.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 27/02/23.
//

import Foundation

struct Semester:CustomStringConvertible{
    let subject:String
    let credit:Int
    let grades:Grade
    init(subject: String, credit: Int, grades: Grade) {
        self.subject = subject
        self.credit = credit
        self.grades = grades
    }
    var description: String{
        return "subject:\(subject) \ncredit:\(credit) \ngrades:\(grades)"
    }
}
