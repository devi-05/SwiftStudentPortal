//
//  ModeEnum.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 17/02/23.
//

import Foundation

public enum ModeOfJoiningEnum:Int,CaseIterable{
    case counseling=1,management
    func getModeOfJoiningFees()->Int{
        switch self{
        case .counseling:
            return 50000
        case .management:
            return 100000
        }
    }
}




