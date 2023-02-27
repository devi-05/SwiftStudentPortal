//
//  Validator.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 27/02/23.
//

import Foundation

struct Validator{
    static func mailVerifier()->String{
        let mail = readLine()!
        let result = mail.range(
            of: #"^[a-zA-z0-9]+@(student|admin).in$"#,
            options: .regularExpression
        )
        if(result != nil){
            return mail
        }
        else{
            print("enter valid mailId( eg: xxxx@student.in or xxxx@admin.in")
            print("enter valid mailId:")
            return mailVerifier()
        }
    }
    static func nameVerifier()->String{
        let name = Util.getAlphaNumericInput()
        let result = name.range(
            of: #"^[a-zA-Z]{4,10}?.*[a-zA-Z]{2,10}$"#,
            options: .regularExpression
        )

        if (result != nil){
            return name
        }
        else{
            print("Enter name with length of 4 to 10")
            return nameVerifier()
        }
        
    }
    static func phoneNumberVerifier()->String{
        let phoneNum = Util.getIntegerInput()
        let result = String(phoneNum).range(
            of: #"^\d{10}$"#,
            options: .regularExpression
        )
        if(result != nil){
            return String(phoneNum)
        }
        else{
            print("phonenumber should contain 10 digits!")
            return phoneNumberVerifier()
        }
    }
    static func inputVerification(num:Int)->Int{
        let input = Util.getIntegerInput()
        if((0<input) && (input<=num)){
            return input
        }
        else{
            print("Enter options between  1 to \(num)")
            return inputVerification(num: num)
        }
    }
    static func passwordVerifier()->String{
        let password = Util.getAlphaNumericInput()
        let result = password.range(
            of: #"^[a-zA-z0-9]{3,10}$"#,
            options: .regularExpression
        )
        if(result != nil){
            return password
        }
        else{
            print("Enter valid password which can contain 5 to 10 alphanumeric characters")
            return passwordVerifier()
        }
    }
}
