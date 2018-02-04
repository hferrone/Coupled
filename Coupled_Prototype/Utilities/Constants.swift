//
//  Constants.swift
//  Coupled_Prototype
//
//  Created by Harrison Ferrone on 2/4/18.
//  Copyright © 2018 Paradigm Shift Development, LLC. All rights reserved.
//

import Foundation

struct Constants {
    
    struct ViewControllers {
        static let login = "LoginVC"
        static let accountInfo = "AccountInfoVC"
        static let itemList = "ItemListVC"
        static let partnerLink = "PartnerLinkingVC"
    }
    
    struct Segues {
        static let toAccountInfo = "segueToAccountInfo"
        static let toItemList = "segueToItemList"
        static let toPartnerLink = "segueToPartnerLinking"
    }
}
