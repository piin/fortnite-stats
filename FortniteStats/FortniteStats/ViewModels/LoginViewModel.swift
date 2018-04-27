//
//  LoginViewModel.swift
//  FortniteStats
//
//  Created by Jair Pinedo on 20/04/18.
//  Copyright © 2018 Jair Pinedo. All rights reserved.
//

import Foundation

class LoginViewModel {
    
    var userModel: UserModel?
    
    private var repository = LoginRepository()
    
    /**
     Make login request
     - parameters:
        - completionHandler: result closure with userModel or error
     */
    func login(completionHandler: @escaping (Result<UserModel>) -> ()) {
        repository.login { (result) in
            switch result {
            case .Success(let user):
                self.userModel = user
            case .Failure(let error):
                print(error.getErrorMessage())
            }
            completionHandler(result)
        }
    }
    
}
