//
//  FeePortalOptionsEnum.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 23/02/23.
//

import Foundation

public enum StudentFeePortalOptions:Int,CaseIterable{
    case pay=1,getBalance,backToMenuPage
    func toString()-> String{
        switch self{
        case .pay:
            return "pay"
        case .getBalance:
            return "getBalance"
        case .backToMenuPage:
            return "backToMenuPage"
        }
    }
}
