//
//  PortalMenuPage.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 19/02/23.
//

import Foundation


public func displayMenuOptions(mailId:String){
    print("Welcome to Menu Page!")
    print("Enter your preference from below options")
    for menuOptions in PortalMenuOptions.allCases.enumerated(){
        print("\(menuOptions.element.rawValue). \(menuOptions.element)")
    }
    let menuOptionsArray:[PortalMenuOptions]=PortalMenuOptions.allCases
    let menuOptionPreference:Int = UtilFunctions.getIntegerInput()
    let menuPreference:PortalMenuOptions = menuOptionsArray[menuOptionPreference-1]
    
    switch menuPreference{
    case .profilepage:
        profileMenuPage(mailId:mailId)
        
    case .feePage:
        print("fee")
    case .Resultpage:
        print("result")
    }
}

