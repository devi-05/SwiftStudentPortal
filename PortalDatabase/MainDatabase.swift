//
//  MainDatabase.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 16/02/23.
//

import Foundation

public struct Database{
    static let dbObj=Database()
    private init(){}

     var accountDb:[String:String] = [:]
     var studentDb:[String:Student] = [:]
     var adminDb:[String:Admin] = [:]
    
}
