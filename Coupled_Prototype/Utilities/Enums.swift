//
//  Enums.swift
//  Coupled_Prototype
//
//  Created by Harrison Ferrone on 2/1/18.
//  Copyright © 2018 Paradigm Shift Development, LLC. All rights reserved.
//

import Foundation

public enum ItemCategory {
    case Food, Service, Housing, Misc
}

public enum FormValidationResult {
    case Empty
    case TooShort(forContext: String)
    case MissingDotCom(forContext: String)
    case MissingSpecial(forContext: String)
    case Valid
    
    typealias ValidationTuple = (message: String, valid: Bool)
    
    var info: ValidationTuple {
        switch self {
        case .Empty:
            return (message: "", valid: false)
        case .TooShort(let context):
            return (message: "Please ensure that your \(context) is longer than 5 characters", valid: false)
        case .MissingDotCom(let context):
            return (message: "Your \(context) is mising a .com ending", valid: false)
        case .MissingSpecial(let context):
            return (message: "Your \(context) is missing an @ character", valid: false)
        case .Valid:
            return (message: "You're good to go!", valid: true)
        }
    }
}
