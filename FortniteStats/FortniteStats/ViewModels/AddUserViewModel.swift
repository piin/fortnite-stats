//
//  LoginViewModel.swift
//  FortniteStats
//
//  Created by Jair Pinedo on 20/04/18.
//  Copyright © 2018 Jair Pinedo. All rights reserved.
//
//  MARK: - Documentation in ILoginViewModel


import Foundation

enum SearchErrors : String {
    case invalidUserName = "Invalid Fortnite name"
}

class AddUserViewModel: IAddUserViewModel {
    
    // MARK: - Properties
    
    var userModel: UserModel?
    private let service: UsersService
    
    required init(service: UsersService) {
        self.service = service
    }

    // MARK: - Methods
    
    func validateUserName(userName: String?) -> SearchErrors? {
        guard let text = userName, text.count > 1 else {
            return .invalidUserName
        }
        return nil
    }
    
    func search(userName: String, platform: String, completionHandler: @escaping (Result<UserModel>) -> ()) {
        
        service.search(userName: userName, platform: platform) { (result) in
            
            switch result {
            case .Success(let user):
                self.userModel = user
                self.service.saveUser(userModel: user)
            case .Failure(let error):
                print(error.getErrorMessage())
            }
            // After make all the logic return the result enum
            completionHandler(result)
            
        }

    }
    
}
