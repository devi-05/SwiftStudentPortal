//
//  MainDatabase.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 16/02/23.
//

import Foundation

 struct Database{
    
        var accountDb:[String:String] = [:]
        var studentDb:[String:Student] = [:]
        var adminDb:[String:Admin] = [:]
        var studentTotalCreditdb:[String:[Int:Int]] = [:]
        var studentCreditsWithGradePoints:[String:[Int:Double]] = [:]
        var studentResults:[String:[Result]] = [:]
    
}
