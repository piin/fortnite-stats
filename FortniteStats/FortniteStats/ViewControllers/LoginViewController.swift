//
//  ViewController.swift
//  FortniteStats
//
//  Created by Jair Pinedo on 12/04/18.
//  Copyright © 2018 Jair Pinedo. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var platformSegmentedControl: PlatformSegmentedControl!
    
    // MARK: - Properties
    
    private let viewModel: ILoginViewModel = LoginViewModel()
    private let GO_HOME_SEGUE = "goToHomeSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Methods
    
    private func validateTextField() {
        self.view.endEditing(true)
        
        if let validUserNameError =  viewModel.validateUserName(userName: nameTextField.text) {
            showAlert(message: validUserNameError.rawValue)
            return
        }
        
        doLogin()
        
    }
    
    private func doLogin() {
        
        guard let userName = nameTextField.text else {
            fatalError("Should never enter here")
        }
        
        let platform = platformSegmentedControl.selectedValue
        
        self.showProgressView()
        
        viewModel.login(userName: userName, platform: platform.rawValue ) { (result) in
            self.dismiss(animated: true, completion: {
                switch result {
                case .Success(let user):
                    self.performSegue(withIdentifier: self.GO_HOME_SEGUE, sender: nil)
                    print("USER: ", user)
                case .Failure(let error):
                    self.showAlert(message: error.getErrorMessage())
                }
                
            })
        }
    }
    
}

// MARK: - textFieldDelegate

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        validateTextField()
        return true
    }
    
}

