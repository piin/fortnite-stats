//
//  LoginRepository.swift
//  FortniteStats
//
//  Created by Jair Pinedo on 24/04/18.
//  Copyright © 2018 Jair Pinedo. All rights reserved.
//

import Foundation
import Alamofire

class LoginRepository {
    
    private var http: HttpRequest
    private var userModel: UserModel?
    
    typealias HandlerClosure = ((_ loginResponse: UserModel?, _ err: String?) -> ())
    
    init() {
        http = HttpRequest()
    }
    
    func login( loginHandler: @escaping HandlerClosure ) {

        http.request(path: "/pc/piiin", method: HTTPMethod.get, params: [:]) { (response, error) in
            self.userModel = response
            
        }
        
    }
    
}
