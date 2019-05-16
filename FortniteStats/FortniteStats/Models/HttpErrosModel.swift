//
//  ErrorModel.swift
//  FortniteStats
//
//  Created by Jair Pinedo on 03/05/18.
//  Copyright © 2018 Jair Pinedo. All rights reserved.
//

import Foundation

struct HttpErrorsModel: Decodable {
    
    let error: String
    
}

struct HttpMessagesModel : Decodable {
    
    let message: String
    
}


