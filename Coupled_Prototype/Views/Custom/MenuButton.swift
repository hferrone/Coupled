//
//  MenuButton.swift
//  Coupled_Prototype
//
//  Created by Harrison Ferrone on 2/5/18.
//  Copyright © 2018 Paradigm Shift Development, LLC. All rights reserved.
//

import UIKit

//@IBDesignable
class MenuButton: UIButton, Roundable {

    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet { self.setupButton() }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet { self.setupButton() }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 10.0 {
        didSet { self.setupButton() }
    }
    
    override func awakeFromNib() {
        self.setupButton()
    }
    
    func setupButton() {
        self.roundView(cornerRadius: cornerRadius, borderColor: borderColor, borderWidth: borderWidth, clipForImage: true)
    }
}
