//
//  ItemListDataSource.swift
//  Coupled_Prototype
//
//  Created by Harrison Ferrone on 2/1/18.
//  Copyright © 2018 Paradigm Shift Development, LLC. All rights reserved.
//

import Foundation
import UIKit

class ItemListDataSource: DataSource<SharedItem>, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.currentData.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemListCell", for: indexPath)
        _ = self.currentData.value[indexPath.row]
        
        return cell
    }
}
