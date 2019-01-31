//
//  LoginViewModel.swift
//  FortniteStats
//
//  Created by Jair Pinedo on 20/04/18.
//  Copyright © 2018 Jair Pinedo. All rights reserved.
//
//  MARK: - Documentation in ILoginViewModel


import Foundation

enum LoginErrors : String {
    case invalidUserName = "Invalid Fortnite name"
}

class LoginViewModel: ILoginViewModel {
    
    // MARK: - Properties
    
    var userModel: UserModel?
    private let repository: LoginRepository
    
    required init(repository: LoginRepository) {
        self.repository = repository
    }

    // MARK: - Methods
    
    func validateUserName(userName: String?) -> LoginErrors? {
        guard let text = userName, text.count > 1 else {
            return .invalidUserName
        }
        return nil
    }
    
    func login(userName: String, platform: String, completionHandler: @escaping (Result<UserModel>) -> ()) {
        
        repository.login(userName: userName, platform: platform) { (result) in
            
            switch result {
            case .Success(let user):
                self.userModel = user
                self.repository.saveUser(userModel: user)
            case .Failure(let error):
                print(error.getErrorMessage())
            }
            // After make all the logic return the result enum
            completionHandler(result)
            
        }

    }
    
}
