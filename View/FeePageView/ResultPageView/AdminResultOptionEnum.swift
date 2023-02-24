//
//  AdminResultOptionEnum.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 24/02/23.
//

import Foundation

enum AdminResultOptionEnum:Int,CaseIterable{
    case addResult = 1,viewSemResult,viewEntireSemResult,calculateCgpa,backToMenuPage
    func toString()->String{
        switch self{
        case .addResult:
            return "addResult"
        case .viewSemResult:
            return "viewSemResult"
        case .viewEntireSemResult:
            return "viewEntireSemResult"
        case .calculateCgpa:
            return "calculateCgpa"
        case .backToMenuPage:
            return "backToMenuPage"
        }
    }
}
