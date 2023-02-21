//
//  PaymentModeEnum.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 21/02/23.
//

import Foundation

public enum PaymentModeEnum:Int,CaseIterable{
    case UPI,debitCard,creditCard,netBanking
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
//let paymentModeEnumAndConvenienceFees:[PaymentModeEnum:Double]=[.UPI:0,.debitCard:1.5,.creditCard:3,.netBanking:3.5]


