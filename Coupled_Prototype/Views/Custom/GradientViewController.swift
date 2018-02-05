//
//  GradientViewController.swift
//  Coupled_Prototype
//
//  Created by Harrison Ferrone on 2/3/18.
//  Copyright © 2018 Paradigm Shift Development, LLC. All rights reserved.
//

import UIKit

class GradientViewController: UIViewController, Gradientable {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgroundGradient()
    }
}




