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
     Login
     - parameters:
        - completionHandler: result closure with userModel or error
     */
    func login( completionHandler: @escaping (Result<UserModel>) -> () ) {
        http.request(path: "/pc/piiin", method: .get, params: [:]) { (result) in
            completionHandler(result)
        }

    }
    
}
