//
//  FeePortal.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 21/02/23.
//

import Foundation

struct FeePortal{
    private let db = DatabaseManager.sharedInstance
    func feePageView(mailId: String){
        let paymentServiceManagerObj = PaymentServiceManager()
    FeePortalLoop:while(true){
        print("------------------------------------------------------------------------------------------")
        print("Welcome to Fee Portal!")
        print("------------------------------------------------------------------------------------------")
        let feePortalOptionPreference:String
        if(Util.isStudent(mailId: mailId)){
            for options in StudentFeePortalOption.allCases.enumerated(){
                print("\(options.element.rawValue). \(options.element)")
            }
            print("Enter your preference from above options:")
            let feePortalOptionArray:[StudentFeePortalOption]=StudentFeePortalOption.allCases
            let option = Validator.inputVerification(num: feePortalOptionArray.count)
            feePortalOptionPreference = feePortalOptionArray[option-1].toString()
        }
        else{
            for options in AdminFeePortalOption.allCases.enumerated(){
                print("\(options.element.rawValue). \(options.element)")
            }
            print("Enter your preference from above options:")
            let feePortalOptionArray:[AdminFeePortalOption]=AdminFeePortalOption.allCases
            let option = Validator.inputVerification(num: feePortalOptionArray.count)
            feePortalOptionPreference = feePortalOptionArray[option-1].toString()
        }
        switch feePortalOptionPreference{
        case "pay":
            if(db.getFeeBalance(mailId: mailId)! > 0){
                let feesWithoutResidentialFees = db.getFeesWithoutResidentialFees(mailId: mailId)
                print("------------------------------------------------------------------------------------------")
                print("Mode of Joining Fees:Rs.\( feesWithoutResidentialFees[0]!)\nTransport fees: Rs.\( feesWithoutResidentialFees[1]!)\nMiscellaneous Fees: Rs.\( feesWithoutResidentialFees[2]!)\nResidential Fees: Rs.\( db.getResidentialFees(mailId: mailId)!) ")
                print("------------------------------------------------------------------------------------------")
                print("Total fees: Rs.\(db.getTotalFees(mailId: mailId)!)")
                print("Fees Balance : Rs.\(db.getFeeBalance(mailId: mailId)!)")
                print("Enter Mode of Payment:")
                for options in PaymentMode.allCases.enumerated(){
                    print("\(options.element.rawValue). \(options.element)")
                }
                let preference = Util.getIntegerInput()
                let paymentModeEnumArray:[PaymentMode]=PaymentMode.allCases
                let modeOfPayment = paymentModeEnumArray[preference-1]
                let convenienceFeePercent = modeOfPayment.getConvenienceFees()
                let calculatedFeeBalance = Double(db.getFeeBalance(mailId: mailId)!) + ((Double(db.getFeeBalance(mailId: mailId)!) * (convenienceFeePercent/100)))
                print("------------------------------------------------------------------------------------------")
                print("Total fees : Rs.\(db.getTotalFees(mailId: mailId)!)\nFees Paid: Rs.\( db.getFeePaid(mailId: mailId)!)\nConvenienceFees: Rs.\(Int(Double(db.getFeeBalance(mailId: mailId)!) * (convenienceFeePercent/100)))\nFees balance: Rs.\(Int(calculatedFeeBalance))")
                db.updateBalance(mailId: mailId, feeBalance: Int(calculatedFeeBalance))
                print("------------------------------------------------------------------------------------------")
                print("Enter amount to be paid:")
                let amount = Util.getIntegerInput()
                paymentServiceManagerObj.pay(mailId: mailId,amount: amount)
                print("Payment Successful!")
                print("Do you want receipt for this payment(y/n)")
                let receiptPreference = Util.getStringInput()
                if(receiptPreference == "y"){
                    getReceipt(mailId: mailId, amount: amount, modeOfPayment: modeOfPayment)
                }
            }
            else{
                print("No Balance...Full Fees Paid!")
            }
            
        case "getBalance":
            if(!Util.isStudent(mailId: mailId)){
                print("Enter student mailId:")
                let studentMailId = Validator.mailVerifier()
                print(paymentServiceManagerObj.getBalance(mailId: studentMailId))
            }
            else{
                print(paymentServiceManagerObj.getBalance(mailId: mailId))}
        case "updateFees":
            paymentServiceManagerObj.updateFees()
            print("Successfully updated!")
        case "backToMenuPage":
            break FeePortalLoop
            
        default:
            break FeePortalLoop
        }
    }
}

    func getReceipt(mailId:String,amount:Int,modeOfPayment:PaymentMode){
        print("Payer Details:")
        print("------------------------------------------------------------------------------------------")
        print("Name:\(db.getUserName(mailId: mailId)!) \nMailId:\(mailId) \n\(db.getRollNumberAndDepartment(mailId: mailId))")
        print("------------------------------------------------------------------------------------------")
        print("Payment Details:")
        print("------------------------------------------------------------------------------------------")
        print("Transaction status : Success \nCurrent Transaction Amount: Rs.\(amount) \nMode of payment: \(modeOfPayment) \nFees Paid till date: Rs.\(db.getFeePaid(mailId: mailId)!) \nFees balance: Rs.\(db.getFeeBalance(mailId: mailId)!)")
        
    }
    
}
