//
//  Gradientable.swift
//  Coupled_Prototype
//
//  Created by Harrison Ferrone on 2/3/18.
//  Copyright © 2018 Paradigm Shift Development, LLC. All rights reserved.
//

import Foundation
import ChameleonFramework

protocol Gradientable where Self: UIViewController {}

extension Gradientable {
    func setupBackgroundGradient(colors: [UIColor]? = UIColor.bgColorPalette(), style: UIGradientStyle? = .topToBottom) {
        self.view.backgroundColor = GradientColor(style!, frame: self.view.frame, colors: colors!)
    }
}
