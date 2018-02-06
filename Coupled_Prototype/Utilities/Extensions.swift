//
//  Extensions.swift
//  Coupled_Prototype
//
//  Created by Harrison Ferrone on 2/1/18.
//  Copyright © 2018 Paradigm Shift Development, LLC. All rights reserved.
//

import Foundation
import UIKit
import ChameleonFramework

extension UIColor {
    static func bgFemaleLight() -> UIColor {
        return FlatWatermelon()
    }
    
    static func bgFemaleDark() -> UIColor {
        return FlatWatermelonDark()
    }
    
    static func bgMaleLight() -> UIColor {
        return FlatPowderBlue()
    }
    
    static func bgMaleDark() -> UIColor {
        return FlatPowderBlueDark()
    }
    
    static func bgColorPalette() -> [UIColor] {
        return [bgFemaleDark(), bgFemaleLight(), bgMaleLight(), bgMaleDark()]
    }
}

extension NSObject {
    public func currentVersionInfo() -> String {
        let infoDict = Bundle.main.infoDictionary
        let appVersion = infoDict?["CFBundleShortVersionString"]
        let buildNumber = infoDict?["CFBundleVersion"]
        
        if let version = appVersion, let build = buildNumber {
            return "Version \(version) (\(build)) - Paradigm Shift Development, LLC"
        }
        
        return "Version information is unavailable"
    }
}
