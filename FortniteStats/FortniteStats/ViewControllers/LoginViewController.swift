//
//  ViewController.swift
//  FortniteStats
//
//  Created by Jair Pinedo on 12/04/18.
//  Copyright © 2018 Jair Pinedo. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {
    
    var viewModel = LoginViewModel()

    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

// MARK: - textFieldDelegate

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        viewModel.login { result in
            switch result {
            case .Success(let user):
                // TODO: - Success login go to next view
                print(user)
            case .Failure(let error):
                print(error.getErrorMessage())
            }
        }
                
        return true
    }
}

