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
    var userModel: UserModel?

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
                
        return true
    }
}

