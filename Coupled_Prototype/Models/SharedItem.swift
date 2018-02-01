//
//  SharedItem.swift
//  Coupled_Prototype
//
//  Created by Harrison Ferrone on 2/1/18.
//  Copyright © 2018 Paradigm Shift Development, LLC. All rights reserved.
//

import Foundation
import UIKit

struct SharedItem {
    let owner: Partner
    let category: ItemCategory
    let name: String
    let description: String?
    let price: Double
    let status: Bool = false
}
