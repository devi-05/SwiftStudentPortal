//
//  UtilFunctions.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 17/02/23.
//

import Foundation

public struct UtilFunctions{
    static func getStringInput()->String{
        if let string = readLine(){
            return string
        }
        else{
            return getStringInput()
        }
    }
    static func getIntegerInput()->Int{
        if let integer = Int(readLine()!){
            return integer
        }
        else{
            return getIntegerInput()
        }
    }
    static func isStudent(mailId:String)->Bool{
        if(mailId.contains("@student.in")){
            return true
        }
        else{
            return false
        }
    }
    static func getStudentjoiningyear()->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        let dateStr =  dateFormatter.string(from: Date())
        return dateStr
    }
    
}