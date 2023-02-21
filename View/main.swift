//
//  main.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 13/02/23.
//

import Foundation


var student = studentPortal()

MainLoop: while(true){
    
    print("welcome to student portal")
    
    for options in PortalOptions.allCases.enumerated(){
        print("\(options.element.rawValue). \(options.element)")
    }
    
    print("Enter your preference:")
    let preference:Int = UtilFunctions.getIntegerInput()
    
    switch preference{
    case 1:
        student.signUp()
    case 2:
        student.signIn()
    case 3:
        student.signOut()
        break MainLoop
    default:
        print("invalid value")
    }
    
}




