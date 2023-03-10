//
//  ResidentialStatusEnum.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 17/02/23.
//

import Foundation
public enum ResidentialStatus:Int,CaseIterable{
    case dayScholar=1,hosteller
    func getResidentialFees()->Int{
        switch self{
        case .dayScholar:
            return 0
        case .hosteller:
            return 35000
        }
    }
    func toString()->String{
        switch self{
        case .dayScholar:
            return "dayScholar"
        case .hosteller:
            return "hosteller"
        }
    }
}


