//
//  main.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 13/02/23.
//

import Foundation

print("welcome to student portal")
var student = studentPortal()


for options in PortalOptions.allCases.enumerated(){
    print("\(options.element.rawValue). \(options.element)")
}

let preference:Int = UtilFunctions.getIntegerInput()

switch preference{
case 1:
    student.signUp()
case 2:
    student.signIn()
case 3:
    student.signOut()
default:
    print("invalid value")
}






