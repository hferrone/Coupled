//
//  PartnerLinkViewController.swift
//  Coupled_Prototype
//
//  Created by Harrison Ferrone on 2/4/18.
//  Copyright © 2018 Paradigm Shift Development, LLC. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class PartnerLinkViewController: GradientViewController {
    
    @IBOutlet weak var linkPartnerButton: OnboardingButton!
    
    lazy var partnerLinkViewModel = PartnerLinkViewModel()
    var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.partnerLinkViewModel.dynamicLink.asObservable().subscribe(onNext: { (url) in
            print(url.absoluteString)
        }, onError: { (error) in
            print("URL could not be created...")
        }).disposed(by: disposeBag)
        
        // View Model bindings
        self.linkPartnerButton.rx.tap.subscribe { _ in
            self.showPartnerLinkAlertVC()
        }.disposed(by: disposeBag)
    }
    
    func showPartnerLinkAlertVC() {
        let myDynamicLink = "Test";
        let msg = "Hey, check this out: " + myDynamicLink
        let shareSheet = UIActivityViewController(activityItems: [ msg ], applicationActivities: nil)
        shareSheet.popoverPresentationController?.sourceView = self.view
        self.present(shareSheet, animated: true, completion: nil)
    }
}
