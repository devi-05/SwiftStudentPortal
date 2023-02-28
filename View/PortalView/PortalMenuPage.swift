//
//  PortalMenuPage.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 19/02/23.
//

import Foundation


struct PortalMenuPage{
    
    func displayMenuOptions(mailId: String){
    MenuLoop:while(true){
        print("------------------------------------------------------------------------------------------")
        print("Welcome to Menu Page!")
        print("------------------------------------------------------------------------------------------")
        print("Enter your preference from below options")
        for menuOptions in PortalMenuOption.allCases.enumerated(){
            print("\(menuOptions.element.rawValue). \(menuOptions.element)")
        }
        
        let menuOptionsArray:[PortalMenuOption]=PortalMenuOption.allCases
        let menuOptionPreference = Validator.inputVerification(num: menuOptionsArray.count)
        let menuPreference = menuOptionsArray[menuOptionPreference-1]
        
        switch menuPreference{
        case .profilepage:
            let profileMenuPageObj = ProfileMenuController()
            profileMenuPageObj.profileMenuPageController(mailId:mailId)
        case .feePage:
            let feeMenuPageObj = FeePortal()
            feeMenuPageObj.feePageView(mailId: mailId)
        case .resultPage:
            let resultportalObj = ResultPortal()
            resultportalObj.resultPageView(mailId: mailId)
        case .signOut:
            let signoutObj = StudentPortal()
            signoutObj.signOut()
            break MenuLoop
        }
    }
        
    }
}
