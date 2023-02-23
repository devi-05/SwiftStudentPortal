//
//  FeePortal.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 21/02/23.
//

import Foundation


class PaymentServiceManager{
    let db = DatabaseManager.dbManagerObj
    func pay(mailId:String,amount:Int){
        guard var feesPaid = db.getFeePaid(mailId: mailId),var feesBalance = db.getFeeBalance(mailId: mailId) else{
            return
        }
        feesBalance -= amount
        feesPaid += amount
        db.updateFees(mailId: mailId, feesPaid: feesPaid, feesBalance: feesBalance)
    }
}
