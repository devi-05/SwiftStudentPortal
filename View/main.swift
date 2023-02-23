//
//  main.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 13/02/23.
//

import Foundation


    let student = StudentPortal()
    
MainLoop: while(true){
    
    print("------------------------------------------------------------------------------------------")
    
    print("welcome to student portal")
    
    print("------------------------------------------------------------------------------------------")
    
    for options in PortalOptions.allCases.enumerated(){
        print("\(options.element.rawValue). \(options.element)")
    }
    
    print("------------------------------------------------------------------------------------------")
    
    print("Enter your preference:")
    let preference:Int = Util.getIntegerInput()
    
    switch preference{
    case 1:
        student.signUp()
    case 2:
        student.signIn()
    case 3:
        break MainLoop
    default:
        print("invalid value")
    }
    
}
    



