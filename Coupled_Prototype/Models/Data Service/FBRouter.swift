//
//  FBRouter.swift
//  Coupled_Prototype
//
//  Created by Harrison Ferrone on 2/3/18.
//  Copyright © 2018 Paradigm Shift Development, LLC. All rights reserved.
//

import Foundation
import Firebase

let BASE_REF = Database.database().reference()

struct FBRouter {
    private var _REF_BASE = BASE_REF
    private var _REF_USERS = BASE_REF.child("users")
    private var _REF_PARTNERS = BASE_REF.child("partners")
    private var _REF_HISTORY = BASE_REF.child("monthly_history")
    
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    
    var REF_USERS: DatabaseReference {
        return _REF_USERS
    }
    
    var REF_PARTNERS: DatabaseReference {
        return _REF_PARTNERS
    }
    
    var REF_HISTORY: DatabaseReference {
        return _REF_HISTORY
    }
}
