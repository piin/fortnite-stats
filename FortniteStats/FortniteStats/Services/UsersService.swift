//
//  LoginRepository.swift
//  FortniteStats
//
//  Created by Jair Pinedo on 24/04/18.
//  Copyright © 2018 Jair Pinedo. All rights reserved.
//

import Foundation
import Alamofire

class UsersService {
    
    
    var http: HttpRequest
    private var userDB: UserDB
    
    init() {
        http = HttpRequest()
        userDB = UserDB()
    }
    
    /**
     search request
     - parameters:
        - userName: String
        - platform: String  pc, xbl, psn
        - completionHandler: result closure with userModel or error
     */
    func search(userName: String, platform: String, completionHandler: @escaping ( Result<UserModel> ) -> () ) {
        
        http.request(path: "/\(platform)/\(userName)", method: HTTPMethod.get, params: [:]) { (result: Result<UserModel> ) in
            completionHandler(result)
        }

    }
    
    /**
     Save User in DB
     - parameters:
        - userModel: UserModel
     */
    func saveUser(userModel: UserModel) {
        // TODO: Fix this O.O, remove the _
        _ = userDB.createUser(userModel: userModel)

    }
    
}
