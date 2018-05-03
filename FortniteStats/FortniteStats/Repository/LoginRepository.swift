//
//  LoginRepository.swift
//  FortniteStats
//
//  Created by Jair Pinedo on 24/04/18.
//  Copyright © 2018 Jair Pinedo. All rights reserved.
//

import Foundation

class LoginRepository {
    
    private var http: HttpRequest
    
    init() {
        http = HttpRequest()
    }
    
    /**
     Login request
     - parameters:
        - userName: String
        - platform: String be pc, xbl, psn
        - completionHandler: result closure with userModel or error
     */
    func login(userName: String, platform: String, completionHandler: @escaping ( Result<UserModel> ) -> () ) {
        
        http.request(path: "/\(platform)/\(userName)", method: .get, params: [:]) { (result) in
            completionHandler(result)
        }

    }
    
}
