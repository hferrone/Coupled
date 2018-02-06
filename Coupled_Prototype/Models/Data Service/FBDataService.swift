//
//  FBDataService.swift
//  Coupled_Prototype
//
//  Created by Harrison Ferrone on 2/1/18.
//  Copyright © 2018 Paradigm Shift Development, LLC. All rights reserved.
//

import Foundation
import Firebase

class FBDataService {
    static let shared = FBDataService()
    
    var currentUser: User? {
        if let user = Auth.auth().currentUser {
            return user
        } else {
            return nil
        }
    }
    
    func addNewUserToDatabase(uid: String, data: Dictionary<String, Any>) {
        FBRouter().REF_USERS.child(uid).updateChildValues(data)
    }
    
    func updateUserProfile(displayName: String, completion: @escaping (Error?) -> Void) {
        if let user = currentUser {
            let changeRequest = user.createProfileChangeRequest()
            
            changeRequest.displayName = displayName
            changeRequest.commitChanges(completion: { (error) in
                if let updateError = error {
                    completion(updateError)
                }
            })
            
            FBRouter().REF_USERS.child(user.uid).updateChildValues(["name": displayName])
            completion(nil)
        }
    }
    
    func linkPartners(senderUID: String) {
        if let user = currentUser {
            FBRouter().REF_USERS.child(senderUID).updateChildValues(["partnerUID": user.uid, "connectedToPartner": true])
            FBRouter().REF_USERS.child(user.uid).updateChildValues(["partnerUID": senderUID, "connectedToPartner": true])
        }
    }
}
