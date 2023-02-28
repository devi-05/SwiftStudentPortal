//
//  PaymentModeEnum.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 21/02/23.
//

import Foundation

public enum PaymentMode:Int,CaseIterable{
    case UPI=1,debitCard,creditCard,netBanking
    func getConvenienceFees()->Double{
        switch self{
        case .UPI:
            return 0
        case .debitCard:
            return 1.5
        case .creditCard:
            return 3
        case .netBanking:
            return 3.5
        }
        
    }
}

