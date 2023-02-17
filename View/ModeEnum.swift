//
//  ModeEnum.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 17/02/23.
//

import Foundation

public enum ModeOfJoiningEnum:Int,CaseIterable{
    case counseling=1,management
}


public let modeOfJoiningAndFees:[ModeOfJoiningEnum:Int]=[.counseling:50000,.management:100000]


