//
//  RoundedButton.swift
//  Coupled_Prototype
//
//  Created by Harrison Ferrone on 2/4/18.
//  Copyright © 2018 Paradigm Shift Development, LLC. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet { self.setupButton() }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet { self.setupButton() }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet { self.setupButton() }
    }

    override func awakeFromNib() {
        self.setupButton()
    }
    
    func setupButton() {
        self.layer.cornerRadius = self.cornerRadius
        self.layer.borderColor = self.borderColor.cgColor
        self.layer.borderWidth = self.borderWidth
        self.clipsToBounds = true
    }

}
