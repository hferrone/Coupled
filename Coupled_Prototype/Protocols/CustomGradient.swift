//
//  CustomGradient.swift
//  Coupled_Prototype
//
//  Created by Harrison Ferrone on 2/1/18.
//  Copyright © 2018 Paradigm Shift Development, LLC. All rights reserved.
//

import Foundation
import UIKit
import ChameleonFramework

protocol CustomGradient {}
extension CustomGradient where Self : UIViewController {
    func setupBackgroundGradient(colors: [UIColor]? = [UIColor.bgColorLight(), UIColor.bgColorDark()], style: UIGradientStyle? = .radial) {
        self.view.backgroundColor = GradientColor(style!, frame: self.view.frame, colors: colors!)
    }
}
