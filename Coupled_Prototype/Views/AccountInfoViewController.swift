//
//  AccountInfoViewController.swift
//  Coupled_Prototype
//
//  Created by Harrison Ferrone on 2/4/18.
//  Copyright © 2018 Paradigm Shift Development, LLC. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class AccountInfoViewController: GradientViewController {

    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var updateInfoButton: OnboardingButton!
    @IBOutlet weak var feedbackLabel: UILabel!
    
    lazy var accountInfoViewModel = AccountInfoViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UI bindings
        _ = self.nameTextfield.rx.text.map { $0 ?? "" }
            .bind(to: accountInfoViewModel.displayName).disposed(by: disposeBag)
        
        _ = self.nameTextfield.rx.text.map { ($0?.isEmpty)! }
        .bind(to: self.updateInfoButton.rx.isHidden).disposed(by: disposeBag)
        
        // Action subscriptions
        self.updateInfoButton.rx.tap.subscribe { _ in
            _ = self.accountInfoViewModel.updateProfileInfo().asObservable()
                .subscribe(onNext: { (status) in
                    self.performSegue(withIdentifier: Constants.Segues.toPartnerLink, sender: nil)
                }, onError: { (error) in
                    self.feedbackLabel.text = error.localizedDescription
                })
        }.disposed(by: disposeBag)
    }
}
