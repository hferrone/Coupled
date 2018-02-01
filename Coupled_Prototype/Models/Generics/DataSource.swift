//
//  DataService.swift
//  Coupled_Prototype
//
//  Created by Harrison Ferrone on 2/1/18.
//  Copyright © 2018 Paradigm Shift Development, LLC. All rights reserved.
//

import Foundation

class DataSource<T>: NSObject {
    var currentData: BoundValue<[T]> = BoundValue([])
}
