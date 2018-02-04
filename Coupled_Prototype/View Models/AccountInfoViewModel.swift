//
//  AccountInfoViewModel.swift
//  Coupled_Prototype
//
//  Created by Harrison Ferrone on 2/4/18.
//  Copyright © 2018 Paradigm Shift Development, LLC. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Action

struct AccountInfoViewModel {
    var displayName = Variable<String>("")
    
    func updateProfileInfo() -> Observable<Bool> {
        return Observable.create({ (observer) -> Disposable in
            FBDataService.shared.updateUserProfile(displayName: self.displayName.value, completion: { (error) in
                if let dsError = error {
                    observer.onError(dsError)
                } else {
                    observer.onNext(true)
                    observer.onCompleted()
                }
            })
            
            return Disposables.create()
        })
    }
}
