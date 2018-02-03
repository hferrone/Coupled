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

    @IBOutlet weak var buildInfoLabel: UILabel!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var validationStatus: UILabel!
    
    lazy var loginViewModel = LoginViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set build info
        self.buildInfoLabel.text = self.currentVersionInfo()
        
        // Set initial UI states
        self.loginButton.isEnabled = false
        self.loginButton.isHidden = true
        
        // Textfield delegates
        emailTextfield.delegate = self
        passwordTextField.delegate = self
        
        // UI bindings
        _ = emailTextfield.rx.text.map { $0 ?? "" }.bind(to: loginViewModel.emailText)
        _ = passwordTextField.rx.text.map { $0 ?? "" }.bind(to: loginViewModel.passwordText)
        
        // Action subscriptions
        self.loginButton.rx.tap.subscribe({ _ in
            _ = self.loginViewModel.createNewUser().asObservable()
                .subscribe(onNext: { (user) in
                    self.validationStatus.text = "Awesome!"
                    self.performSegue(withIdentifier: "segueToItemList", sender: nil)
                }, onError: { (error) in
                    self.validationStatus.text = error.localizedDescription
                })
        }).disposed(by: disposeBag)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        _ = loginViewModel.credentialsAreValid.subscribe(onNext: { (result) in
            self.validationStatus.text = result.info.message
            self.loginButton.isEnabled = result.info.valid
            self.loginButton.isHidden = !result.info.valid
        }).disposed(by: disposeBag)
    }
}
