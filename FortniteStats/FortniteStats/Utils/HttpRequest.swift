//
//  HttpRequest.swift
//  FortniteStats
//
//  Created by Jair Pinedo on 20/04/18.
//  Copyright © 2018 Jair Pinedo. All rights reserved.
//

import Alamofire

class HttpRequest {
    
    typealias HandlerClosure<T> = ((_ response: T?, _ error: String?) -> ())
    
    var headers: HTTPHeaders = [ "TRN-Api-Key": "55a19837-9d24-46bf-81fe-6ba01bd40efd" ]
    
    /**
     Make HTTP request in order to get a generic response
     - parameters:
        - path: String with the URL path
        - method: HTTPMethod enum value
        - params: Parameters for request
     */
    func request<T: Decodable>( path: String, method: HTTPMethod, params: Parameters, handler: @escaping HandlerClosure<T> ) {
        
        let url = Api.BASE_URL + path
        
        Alamofire.request(url, method: method, parameters: params, encoding: URLEncoding.default, headers: headers )
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { ( response ) in
                
                switch response.result {
                case .success:
                    guard let data = response.data else {
                        handler(nil,"Error with JSON response")
                        return
                    }
                    
                    guard let user = try? JSONDecoder().decode(T.self, from: data ) else {
                        handler(nil,"Error with JSON response")
                        return
                    }
                    
                    handler(user,nil)
                    break
                case .failure(let error):
                    print(error)
                    break
                }
                
        }
        
    }
    
}
