//
//  ItemListViewController.swift
//  Coupled_Prototype
//
//  Created by Harrison Ferrone on 2/6/18.
//  Copyright © 2018 Paradigm Shift Development, LLC. All rights reserved.
//

import UIKit
import Firebase

class ItemListViewController: GradientViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func logoutOnButtonPressed(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            self.dismiss(animated: true, completion: nil)
        } catch {
            print("Something went wrong with your logout...")
        }
    }
}
