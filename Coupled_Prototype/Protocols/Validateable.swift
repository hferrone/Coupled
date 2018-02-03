//
//  Validateable.swift
//  Coupled_Prototype
//
//  Created by Harrison Ferrone on 2/3/18.
//  Copyright © 2018 Paradigm Shift Development, LLC. All rights reserved.
//

import Foundation

protocol Validateable {}

extension String: Validateable {
    
    func validateEmail() -> FormValidationResult {
        let context = "email"
        
        if self.isEmpty {
            return FormValidationResult.Empty
        }
        
        if !self.contains("@") {
            return FormValidationResult.MissingSpecial(forContext: context)
        }
        
        if !self.contains(".com") {
            return FormValidationResult.MissingDotCom(forContext: context)
        }
        
        return FormValidationResult.Valid
    }
    
    func validatePassword() -> FormValidationResult {
        let context = "password"
        
        if self.isEmpty {
            return FormValidationResult.Empty
        }
        
        if self.count < 6 {
            return FormValidationResult.TooShort(forContext: context)
        }
        
        return FormValidationResult.Valid
    }
}
