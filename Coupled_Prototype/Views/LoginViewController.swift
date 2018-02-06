//
//  LoginViewController.swift
//  Coupled_Prototype
//
//  Created by Harrison Ferrone on 2/3/18.
//  Copyright © 2018 Paradigm Shift Development, LLC. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: GradientViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var buildInfoLabel: UILabel!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var validationStatus: UILabel!
    
    lazy var loginViewModel = LoginViewModel()
    let disposeBag = DisposeBag()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Animation setup
        self.setupAnimations()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if FBDataService.shared.currentUser != nil {
            self.performSegue(withIdentifier: Constants.Segues.toItemList, sender: nil)
        }
        
        // Fire animations
        self.fireAnimations()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set build info
        self.buildInfoLabel.text = self.currentVersionInfo()
        
        // UI bindings
        _ = emailTextfield.rx.text.map { $0 ?? "" }.bind(to: loginViewModel.emailText).disposed(by: disposeBag)
        _ = passwordTextField.rx.text.map { $0 ?? "" }.bind(to: loginViewModel.passwordText).disposed(by: disposeBag)
        
        // View Model bindings
        self.loginViewModel.credentialsAreValid.map { !$0.info.valid }
        .bind(to: self.loginButton.rx.isHidden).disposed(by: disposeBag)
        
        self.loginViewModel.credentialsAreValid.map { !$0.info.valid }
        .bind(to: self.registerButton.rx.isHidden).disposed(by: disposeBag)
        
        self.loginViewModel.credentialsAreValid.map { $0.info.message }
        .bind(to: self.validationStatus.rx.text).disposed(by: disposeBag)
        
        // View Model subscriptions
        self.loginButton.rx.tap.subscribe { _ in
            _ = self.loginViewModel.loginReturningUser().asObservable()
                .subscribe(onNext: { (user) in
                    self.performSegue(withIdentifier: Constants.Segues.toItemList, sender: nil)
                }, onError: { (error) in
                    self.validationStatus.text = error.localizedDescription
                })
        }.disposed(by: disposeBag)
        
        self.registerButton.rx.tap.subscribe({ _ in
            _ = self.loginViewModel.createNewUser().asObservable()
                .subscribe(onNext: { (user) in
                    self.performSegue(withIdentifier: Constants.Segues.toAccountInfo, sender: nil)
                }, onError: { (error) in
                    self.validationStatus.text = error.localizedDescription
                })
        }).disposed(by: disposeBag)
    }
    
    // MARK: Animations
    func setupAnimations() {
        self.titleLabel.alpha = 0.0
        self.subtitleLabel.alpha = 0.0
        self.emailTextfield.alpha = 0.0
        self.emailTextfield.isEnabled = false
        self.passwordTextField.alpha = 0.0
        self.passwordTextField.isEnabled = false
    }
    
    func fireAnimations() {
        UIView.animate(withDuration: 1.5, delay: 0.3, options: .curveEaseInOut, animations: {
            self.titleLabel.alpha = 1.0
        }, completion: nil)
        
        UIView.animate(withDuration: 1.5, delay: 0.6, options: .curveEaseInOut, animations: {
            self.subtitleLabel.alpha = 1.0
        }, completion: nil)
        
        UIView.animate(withDuration: 1.5, delay: 0.9, options: .curveEaseInOut, animations: {
            self.emailTextfield.alpha = 1.0
        }, completion: nil)
        
        UIView.animate(withDuration: 1.5, delay: 1.2, options: .curveEaseInOut, animations: {
            self.passwordTextField.alpha = 1.0
        }) { complete in
            self.emailTextfield.isEnabled = true
            self.passwordTextField.isEnabled = true
        }
    }
}
