//
//  ResidentialStatusEnum.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 17/02/23.
//

import Foundation
public enum ResidentialStatusEnum:Int,CaseIterable{
    case dayScholar=1,hosteller
    func getResidentialFees()->Int{
        switch self{
        case .dayScholar:
            return 0
        case .hosteller:
            return 35000
        }
    }
}


