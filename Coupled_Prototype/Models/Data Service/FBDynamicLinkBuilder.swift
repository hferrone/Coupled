//
//  FBDynamicLinkBuilder.swift
//  Coupled_Prototype
//
//  Created by Harrison Ferrone on 2/6/18.
//  Copyright © 2018 Paradigm Shift Development, LLC. All rights reserved.
//

import Foundation
import Firebase

class FBDynamicLinkBuilder {
    
    var infoDictionary: [String: String] =
        ["bundleID": Bundle.main.bundleIdentifier!,
         "fallbackURL": "Fallback URL",
         "minAppVersion": "iOS 9",
         "customScheme": Bundle.main.bundleIdentifier!,
         "storeID": "AppStore ID",
        ]
    
    func buildDynamicLink(completion: @escaping (URL?, Error?) -> Void) {
        if let user = FBDataService.shared.currentUser {
            let encodedURLString = "https://www.google.com?senderUID=\(user.uid)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            infoDictionary["link"] = encodedURLString
        }

        guard let linkString = infoDictionary["link"] else {
            print("Link can not be empty!")
            return
        }
        
        guard let linkURL = URL(string: linkString) else { return }
        let components = DynamicLinkComponents(link: linkURL, domain: Constants.DynamicLinks.domain)
        
        if let bundleID = infoDictionary["bundleID"] {
            // iOS params
            let iOSParams = DynamicLinkIOSParameters(bundleID: bundleID)
            iOSParams.fallbackURL = URL(string: infoDictionary["fallbackURL"]!)
            iOSParams.minimumAppVersion = infoDictionary["minAppVersion"]!
            iOSParams.customScheme = infoDictionary["customScheme"]!
            iOSParams.appStoreID = infoDictionary["storeID"]!
            components.iOSParameters = iOSParams
        }
        
        let options = DynamicLinkComponentsOptions()
        options.pathLength = .short
        components.options = options

        components.shorten { (shortURL, warnings, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let validURL = shortURL {
                completion(validURL, nil)
            } else {
                print("FBDynamicLinkBuilder failed...")
                completion(nil, error)
            }
        }
    }
}

