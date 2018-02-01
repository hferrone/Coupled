//
//  ItemListViewModel.swift
//  Coupled_Prototype
//
//  Created by Harrison Ferrone on 2/1/18.
//  Copyright © 2018 Paradigm Shift Development, LLC. All rights reserved.
//

import Foundation

struct ItemListViewModel {
    weak var dataSource: DataSource<SharedItem>?
    
    var isLoading: BoundValue<Bool> = BoundValue(false)
    
    init(ds: DataSource<SharedItem>?) {
        self.dataSource = ds
    }
    
    func fetchCurrentData() {
        self.isLoading.value = true
    }
}
