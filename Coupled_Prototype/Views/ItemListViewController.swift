//
//  ViewController.swift
//  Coupled_Prototype
//
//  Created by Harrison Ferrone on 2/1/18.
//  Copyright © 2018 Paradigm Shift Development, LLC. All rights reserved.
//

import UIKit

class ItemListViewController: GradientViewController {
    let dataSource = ItemListDataSource()
    
    lazy var viewModel: ItemListViewModel = {
        return ItemListViewModel(ds: dataSource)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // View - View Model binding
        self.dataSource.currentData.addAndNotify(observer: self) { [weak self] in
            // Reload data
        }
        
        self.viewModel.isLoading.addObserver(self) { [weak self] in
            // Animate or fade in transitions
        }
        
        // Fetch most current Firebase data
    }

}

