//
//  HttpRequest.swift
//  FortniteStats
//
//  Created by Jair Pinedo on 20/04/18.
//  Copyright © 2018 Jair Pinedo. All rights reserved.
//

import Alamofire

enum Result<T> {
    case Success(T)
    case Failure(HttpErrors)
}

struct HttpRequest {
    
    var headers: HTTPHeaders = [ "TRN-Api-Key": "55a19837-9d24-46bf-81fe-6ba01bd40efd" ]
    
    /**
     Make HTTP request in order to get a generic response
     - parameters:
        - path: String with the URL path
        - method: HTTPMethod enum value
        - params: Parameters for request
     */
    func request<T: Decodable>(path: String, method: HTTPMethod, params: Parameters, completionHandler: @escaping ( Result<T> ) -> () ) {
        
        let url = Api.BASE_URL + path
        
        Alamofire.request(url, method: method, parameters: params, encoding: URLEncoding.default, headers: headers )
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { ( response ) in
                
                switch response.result {
                case .success:
                    guard let data = response.data else {
                        completionHandler( .Failure(.jsonError) )
                        return
                    }
                    
                    if let errors = try? JSONDecoder().decode(HttpErrosModel.self, from: data ) {
                        completionHandler( .Failure(.apiError(errors.error)) )
                        return
                    }
                    
                    guard let user = try? JSONDecoder().decode(T.self, from: data ) else {
                        completionHandler( .Failure(.jsonError) )
                        return
                    }
                    
                    completionHandler( .Success(user) )
                    break
                case .failure(let error):
                    print("ERROR: server error", error)
                    completionHandler( .Failure(.serverError) )
                    break
                }
                
        }
    }
    
}
