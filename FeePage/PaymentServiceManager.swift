//
//  FeePortal.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 21/02/23.
//

import Foundation


class PaymentServiceManager{
    let db = DatabaseManager.sharedInstance
    func pay(mailId:String,amount:Int){
        guard var feesPaid = db.getFeePaid(mailId: mailId),var feesBalance = db.getFeeBalance(mailId: mailId) else{
            return
        }
        feesBalance -= amount
        feesPaid += amount
        db.updateFees(mailId: mailId, feesPaid: feesPaid, feesBalance: feesBalance)
    }
    func getBalance(mailId:String) ->String{
        if(db.checkMailId(mailId: mailId)){
            return "Name:\(db.getUserName(mailId: mailId)!) \nMailId:\(mailId) \n\(db.getRollNumberAndDepartment(mailId: mailId)) \nFeesBalance: \(db.getFeeBalance(mailId: mailId)!)"}
        else{
            return "student doesn't exist"
        }
    }
    
    func updateFees(){
        for mailId in db.getStudentDb().keys {
            db.updateBalance(mailId: mailId, feeBalance: (db.getTotalFees(mailId: mailId)! + db.getFeeBalance(mailId: mailId)!))
        }
    }
}
