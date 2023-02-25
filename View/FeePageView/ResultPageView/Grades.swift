//
//  Grades.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 24/02/23.
//

import Foundation

enum Grades:Int,CaseIterable{
    case O=1,A,B,C,D
    func getGradePoints()->Int{
        switch self{
        case .O:
            return 10
        case .A:
            return 9
        case .B:
            return 8
        case .C:
            return 7
        case .D:
            return 6
        }
    }
    func toString()->String{
        switch self{
        case .O:
            return "O"
        case .A:
            return "A"
        case .B:
            return "B"
        case .C:
            return "C"
        case .D:
            return "D"
        }
    }
}
