//
//  LoginButton.swift
//  Coupled_Prototype
//
//  Created by Harrison Ferrone on 2/5/18.
//  Copyright © 2018 Paradigm Shift Development, LLC. All rights reserved.
//

import UIKit

//@IBDesignable
class OnboardingButton: UIButton, Roundable, Shadowable {
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet { self.setupButton() }
    }
    
    @IBInspectable var borderWidth: CGFloat = 3.0 {
        didSet { self.setupButton() }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 30.0 {
        didSet { self.setupButton() }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 5.0 {
        didSet { self.setupButton() }
    }
    
    @IBInspectable var shadowColor: UIColor = UIColor.black {
        didSet { self.setupButton() }
    }
    
    @IBInspectable var shadowOpacity: Float = 0.5 {
        didSet { self.setupButton() }
    }
    
    @IBInspectable var shadowOffset: CGSize = .zero {
        didSet { self.setupButton() }
    }
    
    override func awakeFromNib() {
        self.setupButton()
    }
    
    func setupButton() {
        self.roundView(cornerRadius: cornerRadius, borderColor: borderColor, borderWidth: borderWidth, clipForImage: false)
        self.addDropShadow(radius: shadowRadius, color: shadowColor, opacity: shadowOpacity, offset: shadowOffset)
    }
    
}
