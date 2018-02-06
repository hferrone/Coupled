//
//  PartnerLinkViewModel.swift
//  Coupled_Prototype
//
//  Created by Harrison Ferrone on 2/6/18.
//  Copyright © 2018 Paradigm Shift Development, LLC. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct PartnerLinkViewModel {
    
    var dynamicLink: Observable<URL> {
        return Observable.create({ (observer) -> Disposable in
            FBDynamicLinkBuilder().buildDynamicLink(completion: { (url, error) in
                if let fbError = error {
                    observer.onError(fbError)
                } else {
                    observer.onNext(url!)
                    observer.onCompleted()
                }
            })
            
            return Disposables.create()
        })
    }
    
}
