//
//  FeePortal.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 21/02/23.
//

import Foundation

struct FeePortal{
    func feePageView(mailId:String){
        let db = DatabaseManager.dbManagerObj
        let paymentServiceManagerObj = PaymentServiceManager()
        print("------------------------------------------------------------------------------------------")
        print("Welcome to Fee Portal!")
        print("------------------------------------------------------------------------------------------")
        for options in FeePortalOptionsEnum.allCases.enumerated(){
            print("\(options.element.rawValue). \(options.element)")
        }
        print("Enter your preference from above options:")
        let option:Int = Util.getIntegerInput()
        let feePortalOptionArray:[FeePortalOptionsEnum]=FeePortalOptionsEnum.allCases
        let feePortalOptionPreference = feePortalOptionArray[option-1]
        switch feePortalOptionPreference{
        case .pay:
            let feesWithoutResidentialFees = db.getFeesWithoutResidentialFees(mailId: mailId)
            print("------------------------------------------------------------------------------------------")
            print("Mode of Joining Fees:\( feesWithoutResidentialFees[0]!)\nTransport fees: \( feesWithoutResidentialFees[1]!)\nMiscellaneous Fees: \( feesWithoutResidentialFees[2]!)\nResidential Fees: \( db.getResidentialFees(mailId: mailId)!) ")
            print("------------------------------------------------------------------------------------------")
            print("Total fees: \(Double(db.getTotalFees(mailId: mailId)!))")
            print("Enter Mode of Payment:")
            for options in PaymentModeEnum.allCases.enumerated(){
                print("\(options.element.rawValue). \(options.element)")
            }
            let preference:Int = Util.getIntegerInput()
            let paymentModeEnumArray:[PaymentModeEnum]=PaymentModeEnum.allCases
            let modeOfPayment = paymentModeEnumArray[preference-1]
            let convenienceFees = modeOfPayment.getConvenienceFees()
            let calculatedTotalFees = Double(db.getTotalFees(mailId: mailId)!) + ((Double(db.getTotalFees(mailId: mailId)!) * (convenienceFees/100)))
            print("------------------------------------------------------------------------------------------")
            print("Total fees with convenience fees: \(calculatedTotalFees)\nFees Paid: \( db.getFeePaid(mailId: mailId)!)\nFees balance: \(db.updateAndReturnBalance(mailId: mailId, feeBalance: Int(calculatedTotalFees))!)")
            print("------------------------------------------------------------------------------------------")
            print("Enter amount to be paid:")
            let amount:Int = Util.getIntegerInput()
            paymentServiceManagerObj.pay(mailId: mailId,amount: amount)
            print("final:\(db.getTotalFees(mailId: mailId)!) \(db.getFeePaid(mailId: mailId)!) \(db.getFeeBalance(mailId: mailId)!)")
        default:
        print("")
        }
        
        
    }
    
}
