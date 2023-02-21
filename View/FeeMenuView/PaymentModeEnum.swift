//
//  PaymentModeEnum.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 21/02/23.
//

import Foundation

public enum PaymentModeEnum:Int,CaseIterable{
    case UPI,debitCard,creditCard,netBanking
    func getConveninceFees()->Double{
        if(self == .UPI){
            return 0
        }
        else if(self == .creditCard){
            return 3
        }
        else{
            return 0
        }
    }
}
let paymentModeEnumAndConvenienceFees:[PaymentModeEnum:Double]=[.UPI:0,.debitCard:1.5,.creditCard:3,.netBanking:3.5]


