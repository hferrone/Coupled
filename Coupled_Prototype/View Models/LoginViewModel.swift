//
//  LoginViewModel.swift
//  Coupled_Prototype
//
//  Created by Harrison Ferrone on 2/3/18.
//  Copyright © 2018 Paradigm Shift Development, LLC. All rights reserved.
//

import Foundation
import RxSwift
import FirebaseAuth

struct LoginViewModel {
    var emailText = Variable<String>("")
    var passwordText = Variable<String>("")
    
    var credentialsAreValid: Observable<FormValidationResult> {
        return Observable.combineLatest(emailText.asObservable(), passwordText.asObservable()) { email, password in
            email.validateEmail().info.valid ? password.validatePassword() : email.validateEmail()
        }
    }
    
    func createNewUser() -> Observable<User> {
        return Observable.create({ (observer) -> Disposable in
            Auth.auth().createUser(withEmail: self.emailText.value, password: self.passwordText.value, completion: { (user, error) in
                if let error = error {
                    observer.onError(error)
                } else {
                    observer.onNext((user!))
                    observer.onCompleted()
                }
            })
            
            return Disposables.create()
        })
    }
}
