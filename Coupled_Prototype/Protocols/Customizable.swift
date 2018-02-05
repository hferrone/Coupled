//
//  Customizable.swift
//  Coupled_Prototype
//
//  Created by Harrison Ferrone on 2/5/18.
//  Copyright © 2018 Paradigm Shift Development, LLC. All rights reserved.
//

import Foundation
import UIKit

protocol Roundable where Self: UIView {}
extension Roundable {
    func roundView(cornerRadius: CGFloat, borderColor: UIColor?, borderWidth: CGFloat?, clipForImage: Bool) {
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = clipForImage
        
        if let color = borderColor, let width = borderWidth {
            self.layer.borderColor = color.cgColor
            self.layer.borderWidth = width
        }
    }
}

protocol Shadowable where Self: UIView {}
extension Shadowable {
    func addDropShadow(radius: CGFloat, color: UIColor, opacity: Float, offset: CGSize) {
        self.layer.shadowRadius = radius
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offset
    }
}
