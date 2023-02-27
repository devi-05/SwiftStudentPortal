//
//  UtilFunctions.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 17/02/23.
//

import Foundation

public struct Util{
    static func getStringInput()->String{
        if let string = readLine(){
                return string
            }
        
        else{
            print("Enter characters alone!")
            return getStringInput()
        }
    }
    static func getAlphaNumericInput()->String{
        if let string = readLine(){
            let result = string.range(
                of: #"^[a-zA-Z0-9@.]{3,50}$"#,
                options: .regularExpression
            )
            if(result != nil){
                return string
            }
            else{
                print("Enter proper input with length of 3 to 50 alone!")
                return getStringInput()
            }
        }
        else{
            print("Enter characters alone!")
            return getStringInput()
        }
    }
    static func getIntegerInput()->Int{
        if let integer = Int(readLine()!){
            return integer
        }
        else{
            print("Enter numbers alone!")
            return getIntegerInput()
        }
    }
    static func isStudent(mailId:String)->Bool{
        return mailId.contains("@student.in")
    }
    static func getStudentjoiningyear()->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        let dateStr =  dateFormatter.string(from: Date())
        return dateStr
    }
    static func getEmployeedoj()->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let dateStr =  dateFormatter.string(from: Date())
        return dateStr
    }
    
}
