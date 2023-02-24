//
//  StudentResultOptionsEnum.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 24/02/23.
//

import Foundation

enum StudentResultOptionEnum:Int,CaseIterable{
    case viewSemResult=1,viewEntireSemResult,calculateCgpa,backToMenuPage
    func toString()->String{
        switch self{
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
