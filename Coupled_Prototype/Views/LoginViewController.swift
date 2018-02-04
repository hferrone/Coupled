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

class LoginViewController: GradientViewController, UITextFieldDelegate {

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
        
        // Fire animations
        self.fireAnimations()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set build info
        self.buildInfoLabel.text = self.currentVersionInfo()
        
        // Set initial UI states
        self.loginButton.isEnabled = false
        self.loginButton.isHidden = true
        self.registerButton.isEnabled = false
        self.registerButton.isHidden = true
        
        // Textfield delegates
        emailTextfield.delegate = self
        passwordTextField.delegate = self
        
        // UI bindings
        _ = emailTextfield.rx.text.map { $0 ?? "" }.bind(to: loginViewModel.emailText).disposed(by: disposeBag)
        _ = passwordTextField.rx.text.map { $0 ?? "" }.bind(to: loginViewModel.passwordText).disposed(by: disposeBag)
        
        // Action subscriptions
        self.loginButton.rx.tap.subscribe { _ in
            _ = self.loginViewModel.loginReturningUser().asObservable()
                .subscribe(onNext: { (user) in
                    self.enterApplication()
                }, onError: { (error) in
                    self.validationStatus.text = error.localizedDescription
                })
        }.disposed(by: disposeBag)
        
        self.registerButton.rx.tap.subscribe({ _ in
            _ = self.loginViewModel.createNewUser().asObservable()
                .subscribe(onNext: { (user) in
                    self.enterApplication()
                }, onError: { (error) in
                    self.validationStatus.text = error.localizedDescription
                })
        }).disposed(by: disposeBag)
    }
    
    func enterApplication() {
        self.validationStatus.text = "Awesome!"
        self.performSegue(withIdentifier: "segueToItemList", sender: nil)
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
    
    // MARK: TextField Delegate
    func textFieldDidEndEditing(_ textField: UITextField) {
        _ = loginViewModel.credentialsAreValid.subscribe(onNext: { (result) in
            self.validationStatus.text = result.info.message
            self.loginButton.isEnabled = result.info.valid
            self.loginButton.isHidden = !result.info.valid
            self.registerButton.isEnabled = result.info.valid
            self.registerButton.isHidden = !result.info.valid
        }).disposed(by: disposeBag)
    }
}
