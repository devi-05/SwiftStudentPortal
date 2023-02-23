//
//  AdminFeePortalOptions.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 23/02/23.
//

import Foundation

public enum AdminFeePortalOptions:Int,CaseIterable{
    case getBalance=1,updateFees,backToMenuPage
    func toString()-> String{
        switch self{
        case .getBalance:
            return "getBalance"
        case .updateFees:
            return "updateFees"
        case .backToMenuPage:
            return "backToMenuPage"
        }
    }
}
