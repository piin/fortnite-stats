//
//  ILoginViewModel.swift
//  FortniteStats
//
//  Created by Jair Pinedo on 04/05/18.
//  Copyright © 2018 Jair Pinedo. All rights reserved.
//

import Foundation

protocol IAddUserViewModel {
    
    var userModel: UserModel? { get set }
    
    /**
     Initialize class with a LoginRepository
     - parameters:
        - repository: UsersService
     */
    init(service: UsersService)
    
    /**
     Validate if userName is not nil and has more than 1 character
     - parameters:
        - userName: String? with the userName
     - returns: LoginErrors?
     */
    func validateUserName(userName: String?) -> SearchErrors?
    
    /**
     Make login request and save user in DB
     - parameters:
        - platform: String can be pc, xbl, psn
        - userName: String
        - completionHandler: result closure with userModel or error
     */
    func search(userName: String, platform: String, completionHandler: @escaping (Result<UserModel>) -> ())
    
}
