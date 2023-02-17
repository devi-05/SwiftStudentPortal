//
//  ResidentialStatusEnum.swift
//  StudentPortal
//
//  Created by devi-pt6261 on 17/02/23.
//

import Foundation
public enum ResidentialStatusEnum:Int,CaseIterable{
    case dayScholar=1,hosteller
}

public let residentialStatusAndFees:[ResidentialStatusEnum:Int]=[.dayScholar:0,.hosteller:35000]
