//
//  LoginViewModel.swift
//  FortniteStats
//
//  Created by Jair Pinedo on 20/04/18.
//  Copyright © 2018 Jair Pinedo. All rights reserved.
//

import Foundation

class LoginViewModel {
    
    // MARK: - Properties
    
    var userModel: UserModel?
    private var validUserName = false
    private var repository = LoginRepository()
    
    enum LoginErrors : String {
        case invalidUserName = "Invalid Fortnite name"
    }
    
    // MARK: - Methods
    
    /**
     Validate if userName is not nil and has more than 1 character
     - parameters:
        - userName: String? with the userName
     - returns: LoginErrors?
     */
    func validateUserName(userName: String?) -> LoginErrors? {
        guard let text = userName, text.count > 1 else {
            validUserName = false
            return .invalidUserName
        }
        validUserName = true
        return nil
    }
    
    /**
     Make login request
     - parameters:
        - platform: String can be pc, xbl, psn
        - userName: String
        - completionHandler: result closure with userModel or error
     */
    func login(userName: String, platform: String, completionHandler: @escaping (Result<UserModel>) -> ()) {
        
        repository.login(userName: userName, platform: platform) { (result) in
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
