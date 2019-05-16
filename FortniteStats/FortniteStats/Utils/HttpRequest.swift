//
//  HttpRequest.swift
//  FortniteStats
//
//  Created by Jair Pinedo on 20/04/18.
//  Copyright © 2018 Jair Pinedo. All rights reserved.
//

import Alamofire

final class HttpRequest {
    
    var headers: HTTPHeaders = [ Api.HEADER_KEY: Api.HEADER_KEY_VALUE ]
    
    /**
     Make HTTP request in order to get a generic response
     
     - parameters:
        - path: String with the URL path
        - method: HTTPMethod enum value
        - params: Parameters for request
        - completionHandler: closue to execute  ( input: Result<T> ) -> ()
     
     */
    func request<T: Decodable>(
        path: String,
        method: HTTPMethod,
        params: Parameters = [:],
        completionHandler: @escaping ( Result<T, HttpErrors> ) -> Void ) {
        
        let url = Api.BASE_URL + path
        
        AF.request(url, method: method,
            parameters: params, encoding: URLEncoding.default, headers: headers )
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { ( response ) in
                
                switch response.result {
                case .success:
                    
                    guard let data = response.data else {
                        completionHandler(.failure(.jsonError))
                        return
                    }
                    
                    guard let user = try? JSONDecoder().decode(T.self, from: data ) else {
                        completionHandler(.failure(.jsonError))
                        return
                    }
                    
                    completionHandler( .success(user) )
                    break
                    
                case .failure(let reason):
                    print("Error: \(reason)")
                    completionHandler( .failure(.serverError) )
                    break
                }
                
        }
        
    }
    
}
